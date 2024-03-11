from django.shortcuts import get_object_or_404
from rest_framework import serializers
from .models import Assessment, Exercise, ExerciseAchievement, ExerciseCustom, ExercisePlan, Muscle, Plan, Profile, Weekday




class MuscleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Muscle
        fields = ['muscle']

class ExerciseSerializer(serializers.ModelSerializer):
    muscles = MuscleSerializer(many=True, read_only=True)
    id = serializers.IntegerField(read_only=True)

    start_reps = serializers.SerializerMethodField(method_name='return_reps')
    start_sets = serializers.SerializerMethodField(method_name='return_sets')
    duration = serializers.SerializerMethodField(method_name='return_duration')

    class Meta:
        model = Exercise
        fields = ['id','name', 'description', 'start_reps', 'start_sets', 'duration', 'muscles']

    def has_custom_exercise(self, exercise):
        if hasattr(exercise, 'custom_exercise') and exercise.custom_exercise is not None:
            return True 
        return False

    def return_reps(self, exercise):
        if self.has_custom_exercise(exercise):
            return exercise.custom_exercise.new_reps
        return exercise.start_reps
        
        
    def return_sets(self, exercise):
        if self.has_custom_exercise(exercise):
            return exercise.custom_exercise.new_sets
        return exercise.start_sets
        
    def return_duration(self, exercise):
        if self.has_custom_exercise(exercise):
            return exercise.custom_exercise.duration
        return exercise.duration
        

     
    
class PlanSerializer(serializers.ModelSerializer):
    exercise = ExerciseSerializer(many=True)
    class Meta:
        model = Plan
        fields = ['id', 'exercise']

class ProfileSerializer(serializers.ModelSerializer):
    plans = PlanSerializer(many=True)
    class Meta:
        model = Profile
        fields = ['id', 'user_id', 'age', 'weight', 'goal_weight', 'height', 'plans']

class WeekDaySerializer(serializers.ModelSerializer):
    plan = PlanSerializer()
    class Meta:
        model = Weekday
        fields = ['id', 'weekday', 'plan']


class CustomExerciseSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(read_only=True)
    class Meta:
        model = ExerciseCustom
        fields = ['id', 'new_reps', 'new_sets', 'duration']


    def save(self, **kwargs):
        exercise_pk = self.context['exercise_pk']
        new_reps = self.validated_data.get('new_reps')
        new_sets = self.validated_data.get('new_sets')
        user = self.context['user']
        duration = self.validated_data.get('duration')

        custom_exercise, created = ExerciseCustom.objects.update_or_create(
            default_exercise_id=exercise_pk,
            created_by=user,
            defaults={
                'new_reps': new_reps,
                'new_sets': new_sets,
                'duration': self.validated_data.get('duration'),
            }
        )
        


        last_exercise_achievement = ExerciseAchievement.objects.filter(exercise_id=exercise_pk).last()
       

        new_reps = self.validated_data.get('new_reps')
        new_sets = self.validated_data.get('new_sets')

        create_new_achievement = False
        create_new_achievement_robust = False

        user = self.context['user']
        if last_exercise_achievement:
            if (new_reps and new_reps > last_exercise_achievement.achieved_reps) or \
                (new_sets and new_sets > last_exercise_achievement.achieved_sets):
                create_new_achievement = True
        else:
            create_new_achievement_robust = True


        if create_new_achievement:
            new_achivement = ExerciseAchievement.objects.create(
                exercise_id=exercise_pk, 
                profile=user.profile, 
                duration=duration
                )


            if new_reps and new_reps > last_exercise_achievement.achieved_reps:
                new_achivement.achieved_reps = new_reps
            else:
                new_achivement.achieved_reps = custom_exercise.new_reps

            if new_sets and new_sets > last_exercise_achievement.achieved_sets:
                new_achivement.achieved_sets = new_sets
            else:
                new_achivement.achieved_sets = custom_exercise.new_sets




            new_achivement.save()
        
        if create_new_achievement_robust:
            new_achivement = ExerciseAchievement.objects.create \
            (exercise_id=exercise_pk, 
             profile=user.profile, 
             achieved_reps=new_reps,
             achieved_sets=new_sets,
             duration=duration)

            new_achivement.save()

        return custom_exercise

class AddExerciseToListSerializer(serializers.ModelSerializer):
    exercise_id = serializers.IntegerField()
    class Meta:
        model = Plan
        fields = ['exercise_id']


    def create(self, validated_data):
        exercise_id = self.validated_data['exercise_id']
        plan_id = self.context['plan_pk']
        plan = Plan.objects.get(id=plan_id)
        exercise =  Exercise.objects.get(id=exercise_id)
        
        plan.exercise.add(exercise)
        
        plan.save()
        exercise_plan_object = ExercisePlan.objects.get(exercise_id=exercise_id)
        return exercise_plan_object
        
    
class AddPlanToWeekDaySerializer(serializers.ModelSerializer):
    id = serializers.IntegerField()
    plan_id = serializers.IntegerField()
    class Meta:
        model = Weekday
        fields = ['id', 'plan_id']


    def create(self, validated_data):
        weekday_id = self.validated_data['id']
        plan_id = self.validated_data['plan_id']
        weekday = Weekday.objects.get(pk=weekday_id)
        plan, created = Plan.objects.get_or_create(id=plan_id)

        weekday.plan = plan
        weekday.save()
        

        return weekday


class SimpleProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ['age', 'weight', 'goal_weight', 'height']


class AssessmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Assessment
        fields = ['weight', 'weight_added']



class FullAssessmentSerializer(serializers.ModelSerializer):
    assessments = AssessmentSerializer(many=True, read_only=True)
    start_weight = serializers.DecimalField(read_only=True, decimal_places=2, max_digits=5)
    weight_gained = serializers.SerializerMethodField(method_name='returns_weight_gained')
    weight_lost = serializers.SerializerMethodField(method_name='returns_weight_lost')

    class Meta:
        model = Profile
        fields = ['assessments', 'start_weight', 'weight_now', 'weight_gained', 'weight_lost']


    def returns_weight_gained(self, profile):
        weight_gained = profile.weight_now - profile.start_weight
        
        if weight_gained > 0:
            return 0
        return weight_gained
    
    def returns_weight_lost(self, profile):
        weight_lost = profile.start_weight - profile.weight_now
        if weight_lost < 0:
            return 0
        return weight_lost
    
    def create(self, validated_data):
        weight_now = validated_data['weight_now']
        profile_id = self.context['profile_id']
        assessment = Assessment.objects.create(weight=weight_now, profile_id=profile_id)
        assessment.save()

        profile = Profile.objects.get(id=profile_id)
        profile.weight_now = weight_now
        profile.save()

        return profile