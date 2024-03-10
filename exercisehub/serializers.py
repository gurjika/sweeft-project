from rest_framework import serializers
from .models import Exercise, Muscle, Profile

class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ['id', 'user_id', 'age', 'weight', 'goal_weight', 'height']


class MuscleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Muscle
        fields = ['muscle']

class ExerciseSerializer(serializers.ModelSerializer):
    muscles = MuscleSerializer(many=True)
    class Meta:
        model = Exercise
        fields = ['name', 'description', 'start_reps', 'start_sets', 'duration', 'start_distance', 'muscles']
