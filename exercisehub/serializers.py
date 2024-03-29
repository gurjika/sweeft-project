from django.shortcuts import get_object_or_404
from rest_framework import serializers
from .models import Assessment, CompletedExercise, Exercise, ExerciseAchievement, ExerciseCustom, ExercisePlan, Muscle, Plan, Profile, Tracking, Weekday
from django.db import IntegrityError
from django.db import transaction




class MuscleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Muscle
        fields = ['muscle']

class DefaultExerciseSerializer(serializers.ModelSerializer):
    muscles = MuscleSerializer(many=True)
    class Meta:
        model = Exercise
        fields = ['id', 'name', 'description', 'reps', 'sets', 'duration', 'muscles']

class CustomOrExerciseSerializer(serializers.ModelSerializer):
    muscles = MuscleSerializer(many=True, read_only=True)
    id = serializers.IntegerField(read_only=True)

    reps = serializers.SerializerMethodField(method_name='return_reps')
    sets = serializers.SerializerMethodField(method_name='return_sets')
    duration = serializers.SerializerMethodField(method_name='return_duration')


    class Meta:
        model = Exercise
        fields = ['id','name', 'description', 'reps', 'sets', 'duration', 'muscles']


    def return_reps(self, exercise):
        new_exercise = next(iter(getattr(exercise, 'user_custom_exercise', [])), None)
        if new_exercise:
            return new_exercise.new_reps
        return exercise.reps
    

    def return_sets(self, exercise):
        new_exercise = next(iter(getattr(exercise, 'user_custom_exercise', [])), None)
        if new_exercise:
            return new_exercise.new_sets
        return exercise.sets
    

    def return_duration(self, exercise):
        new_exercise = next(iter(getattr(exercise, 'user_custom_exercise', [])), None)
        if new_exercise:
            return new_exercise.duration
        return exercise.duration

class PlanTrackingsSerializer(serializers.ModelSerializer):
    plan_completion_percentage = serializers.SerializerMethodField('sum_percentage')
    class Meta:
        model = Tracking
        fields = ['plan_completion_percentage']


    def sum_percentage(self, completion_percentages):
        
        count = len(completion_percentages.all())
        if count != 0:
            sum = 0

            for completion_percentage in completion_percentages.all():
                sum += completion_percentage.completion_percentage
            
            return sum / count
        return 0
     
class SimpleExerciseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Exercise
        fields = ['id', 'name']



class PlanSerializer(serializers.ModelSerializer):
    completion_rates = PlanTrackingsSerializer()
    exercise = SimpleExerciseSerializer(many=True)
    class Meta:
        model = Plan
        fields = ['id', 'exercise', 'completion_rates', 'weekday_id']

class WeekDaySerializer(serializers.ModelSerializer):
    plans = PlanSerializer(many=True)
    class Meta:
        model = Weekday
        fields = ['id', 'weekday', 'plans']



class SimplePlanSerializer(serializers.ModelSerializer):
    exercise = SimpleExerciseSerializer(many=True)
    class Meta:
        model = Plan
        fields = ['id', 'exercise', 'weekday']




class ProfileSerializer(serializers.ModelSerializer):
    profile_plans = SimplePlanSerializer(many=True, read_only=True)
    weight_now = serializers.DecimalField(max_digits=5, decimal_places=2, read_only=True)
    start_weight = serializers.DecimalField(max_digits=5, decimal_places=2)

    class Meta:
        model = Profile
        fields = ['id', 'user_id', 'age', 'weight_now', 'start_weight', 'goal_weight', 'height', 'profile_plans', 'overall_completion_rate']



        


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


        
        if ExerciseCustom.objects.filter(created_by=user).first():
            custom_exercise = ExerciseCustom.objects.filter(created_by=user).first()
            
            custom_exercise.new_reps = new_reps
            custom_exercise.new_sets = new_sets
            custom_exercise.duration = duration

            custom_exercise.save()

        else:
        
            custom_exercise = ExerciseCustom.objects.create(
                default_exercise_id=exercise_pk,
                created_by=user,
                new_reps=new_reps,
                new_sets=new_sets,
                duration=duration
            )
        


        

        return custom_exercise

class AddExerciseToListSerializer(serializers.ModelSerializer):
    exercise_id = serializers.IntegerField()
    class Meta:
        model = Plan
        fields = ['exercise_id']


    def create(self, validated_data):
        user = self.context['user']
        exercise_id = self.validated_data.get('exercise_id')
        weekday_id = self.context['weekday_pk']
        plan = Plan.objects.get(weekday_id=weekday_id, profile__user=user)
        exercise =  Exercise.objects.get(id=exercise_id)
        
        plan.exercise.add(exercise)
        
        plan.save()

        exercise_plan_object = ExercisePlan.objects.get(exercise=exercise, plan=plan)
        return exercise_plan_object
        
    
class AddPlanToWeekDaySerializer(serializers.ModelSerializer):
    weekday_id = serializers.IntegerField()
    id = serializers.IntegerField(read_only=True)
    class Meta:

        model = Plan
        fields = ['id', 'weekday_id']

    def validate_weekday_id(self, value):
        weekday = value
        

        if Plan.objects.filter(weekday=weekday, profile=self.context['user'].profile).exists():
            raise serializers.ValidationError('Weekday is already planned')
        return weekday


    def create(self, validated_data):
        plan_id = self.validated_data['id']
        
        weekday_id = self.validated_data['weekday_id']

        
        profile_id = self.context['profile_id']
        weekday = Weekday.objects.get(id=weekday_id)
        plan, created = Plan.objects.get_or_create(id=plan_id, profile_id=profile_id)
        
        plan.weekday = weekday
        plan.save()
    

        return plan


class SimpleProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ['age', 'start_weight', 'goal_weight', 'height']


    
    def update(self, instance, validated_data):

        start_weight = validated_data.get('start_weight')
        if start_weight and not instance.start_weight:
            instance.start_weight = validated_data.get('start_weight', instance.start_weight)
        
        instance.age = validated_data.get('age', instance.age)
        instance.goal_weight = validated_data.get('goal_weight', instance.goal_weight)
        instance.height = validated_data.get('height', instance.height)
        
        instance.save()

        return instance



class AssessmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Assessment
        fields = ['weight', 'weight_added']



class FullAssessmentSerializer(serializers.ModelSerializer):
    assessments = AssessmentSerializer(many=True, read_only=True)
    start_weight = serializers.DecimalField(read_only=True, decimal_places=2, max_digits=5)
    weight_gained = serializers.SerializerMethodField(method_name='returns_weight_gained')
    weight_lost = serializers.SerializerMethodField(method_name='returns_weight_lost')
    goal_weight = serializers.DecimalField(max_digits=5, decimal_places=2, read_only=True)


    class Meta:
        model = Profile
        fields = ['assessments', 'start_weight', 'weight_now', 'weight_gained', 'weight_lost', 'goal_weight']


    def returns_weight_gained(self, profile):
        weight_gained = 0
        if profile.weight_now and profile.start_weight:
            weight_gained = profile.weight_now - profile.start_weight
        
            if weight_gained < 0:
                return 0
        return weight_gained
    
    def returns_weight_lost(self, profile):
        weight_lost = 0
        if profile.weight_now and profile.start_weight:
            weight_lost = profile.start_weight - profile.weight_now
            if weight_lost < 0:
                return 0
        return weight_lost
    
    def create(self, validated_data):
        weight_now = validated_data.get('weight_now')
        profile_id = self.context['profile_id']
        assessment = Assessment.objects.create(weight=weight_now, profile_id=profile_id)
        assessment.save()

        profile = Profile.objects.get(id=profile_id)
        profile.weight_now = weight_now
        profile.save()

        return profile
    

    

class ExerciseAchievementSerializer(serializers.ModelSerializer):
    exercise = SimpleExerciseSerializer()
    class Meta:
        model = ExerciseAchievement
        fields = ['id', 'date_added', 'achieved_reps', 'achieved_sets', 'duration', 'exercise']

    
class ProfileAchievementsSerializer(serializers.ModelSerializer):
    achievements = ExerciseAchievementSerializer(many=True)
    class Meta:
        model = Profile
        fields = ['achievements']




class UploadExerciseSerializer(serializers.ModelSerializer):
    exercise_id = serializers.IntegerField()
    class Meta:
        model = CompletedExercise
        fields = ['exercise_id', 'reps', 'sets', 'duration']


    def create(self, validated_data):
        with transaction.atomic():
            user = self.context['user']
            reps = validated_data.get('reps')
            sets = validated_data.get('sets')
            exercise_id = validated_data.get('exercise_id')
            duration = validated_data.get('duration')
            completed_exercise = CompletedExercise.objects.create(exercise_id=exercise_id, reps=reps, sets=sets, duration=duration, completed_by=user.profile)
            completed_exercise.save()
            try:
                plan = Plan.objects.get(weekday__weekday=self.context['weekday'], profile__user=user)

                plan_exercises = plan.exercise

                if plan_exercises.filter(id=exercise_id).exists():
                    try:
                        goal_exercise = ExerciseCustom.objects.get(created_by=self.context['user'])
                        goal_reps = goal_exercise.new_reps
                        goal_sets = goal_exercise.new_sets
                    except ExerciseCustom.DoesNotExist:
                        goal_exercise = Exercise.objects.get(id=exercise_id)
                        goal_reps = goal_exercise.reps
                        goal_sets = goal_exercise.sets

                    completion_percentage = 100 * ((reps * sets) / (goal_reps * goal_sets))

                    if completion_percentage > 100:
                        completion_percentage = 100
            
                    Tracking.objects.create(
                        plan=plan,
                        completion_percentage=completion_percentage
                    )
            except Plan.DoesNotExist:
                pass

            last_exercise_achievement = ExerciseAchievement.objects.filter(exercise_id=exercise_id, profile=user.profile).last()
        

            new_reps = reps
            new_sets = sets

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
                new_achivement = {
                    'achieved_sets': None,
                    'achieved_reps': None
                }

                if new_reps * new_sets > last_exercise_achievement.achieved_reps * last_exercise_achievement.achieved_sets:
                    new_achivement['achieved_sets'] = new_sets
                    new_achivement['achieved_reps'] = new_reps

                    created_achivement = ExerciseAchievement.objects.create(
                    exercise_id=exercise_id, 
                    profile=user.profile, 
                    duration=duration,
                    **new_achivement
                    )

                    created_achivement.save()
            
            if create_new_achievement_robust:
                new_achivement = ExerciseAchievement.objects.create \
                (exercise_id=exercise_id, 
                profile=user.profile, 
                achieved_reps=new_reps,
                achieved_sets=new_sets,
                duration=duration)

                new_achivement.save()

        

            return completed_exercise
        

class CreatePlanSerializer(serializers.ModelSerializer):

    class Meta:
        model = Plan
        fields = ['id']

    def create(self, validated_data):
        
        plan = Plan.objects.create(profile_id=self.context['profile_id'])
        return plan
    

class HistorySerializer(serializers.ModelSerializer):
    exercise = SimpleExerciseSerializer()
    class Meta:
        model = CompletedExercise
        fields = ['completed_by', 'reps', 'sets', 'duration', 'time_completed', 'exercise']