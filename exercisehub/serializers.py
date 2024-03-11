from django.shortcuts import get_object_or_404
from rest_framework import serializers
from .models import Exercise, ExerciseCustom, ExercisePlan, Muscle, Plan, Profile, Weekday

class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ['id', 'user_id', 'age', 'weight', 'goal_weight', 'height']


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
    start_distance = serializers.SerializerMethodField(method_name='return_distance')

    class Meta:
        model = Exercise
        fields = ['id','name', 'description', 'start_reps', 'start_sets', 'duration', 'start_distance', 'muscles']

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
        
    def return_distance(self, exercise):
        if self.has_custom_exercise(exercise):
            return exercise.custom_exercise.new_distance
        return exercise.start_distance
     
    
class PlanSerializer(serializers.ModelSerializer):
    exercise = ExerciseSerializer(many=True)
    class Meta:
        model = Plan
        fields = ['id', 'exercise']

class WeekDaySerializer(serializers.ModelSerializer):
    plan = PlanSerializer()
    class Meta:
        model = Weekday
        fields = ['id', 'weekday', 'plan']


class CustomExerciseSerializer(serializers.ModelSerializer):
    class Meta:
        model = ExerciseCustom
        fields = ['id', 'new_reps', 'new_sets', 'duration', 'new_distance']


    def save(self, **kwargs):
        exercise_pk = self.context['exercise_pk']
        custom_exercise = ExerciseCustom.objects.get(default_exercise_id=exercise_pk)

        custom_exercise.new_reps = self.validated_data['new_reps']
        custom_exercise.new_sets = self.validated_data['new_sets']
        custom_exercise.new_distance = self.validated_data['new_distance']
        custom_exercise.duration = self.validated_data['duration']

        custom_exercise.save()

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

