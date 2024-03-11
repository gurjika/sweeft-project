from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator
from django.conf import settings
# Create your models here.

class Profile(models.Model):
    age = models.PositiveSmallIntegerField(validators=[MinValueValidator(8), MaxValueValidator(95)], null=True)
    start_weight = models.DecimalField(max_digits=5, decimal_places=2, null=True)
    weight_now = models.DecimalField(max_digits=5, decimal_places=2, null=True)
    height = models.DecimalField(max_digits=5, decimal_places=2, null=True)
    goal_weight = models.DecimalField(max_digits=5, decimal_places=2, null=True)
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)


class Muscle(models.Model):
    muscle = models.CharField(max_length=255)



class Exercise(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField()
    reps = models.PositiveSmallIntegerField(null=True)
    sets = models.PositiveSmallIntegerField(null=True)
    duration = models.PositiveSmallIntegerField()
    muscles = models.ManyToManyField(Muscle, through='MuscleExercise')



class ExerciseCustom(models.Model):
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    default_exercise = models.OneToOneField(Exercise, on_delete=models.PROTECT, related_name='custom_exercise')
    new_reps = models.PositiveSmallIntegerField(null=True)
    new_sets = models.PositiveSmallIntegerField(null=True)
    duration = models.PositiveSmallIntegerField()

class ExerciseAchievement(models.Model):
    achieved_sets = models.PositiveSmallIntegerField(null=True)
    achieved_reps = models.PositiveSmallIntegerField(null=True)
    exercise = models.ForeignKey(Exercise, on_delete=models.CASCADE, related_name='exercises')
    profile = models.ForeignKey(Profile, on_delete=models.CASCADE, related_name='achievements')
    duration = models.PositiveSmallIntegerField()
    date_added = models.DateField(auto_now_add=True)



class Plan(models.Model):
    profile = models.ForeignKey(Profile, on_delete=models.CASCADE, related_name='plans')
    exercise = models.ManyToManyField(Exercise, related_name='plan', through='ExercisePlan')



class Weekday(models.Model):
    weekday = models.CharField(max_length=255)
    plan = models.ForeignKey(Plan, related_name='weekdays', on_delete=models.CASCADE, null=True)

    def __str__(self) -> str:
        return self.weekday
    
    class Meta:
        ordering = ['id']


class ExercisePlan(models.Model):
    plan = models.ForeignKey(Plan, on_delete=models.CASCADE)
    exercise = models.ForeignKey(Exercise, on_delete=models.CASCADE)



class MuscleExercise(models.Model):
    muscle = models.ForeignKey(Muscle, on_delete=models.CASCADE)
    exercise = models.ForeignKey(Exercise, on_delete=models.CASCADE)


class Assessment(models.Model):
    weight = models.DecimalField(max_digits=5, decimal_places=2)
    weight_added = models.DateField(auto_now_add=True)
    profile = models.ForeignKey(Profile, on_delete=models.CASCADE, related_name='assessments')



class Tracking(models.Model):
    completion_rate = models.DecimalField(max_digits=5, decimal_places=2)
    profile = models.OneToOneField(Profile, on_delete=models.CASCADE)

