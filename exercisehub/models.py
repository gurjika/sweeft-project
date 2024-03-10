from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator
from django.conf import settings
# Create your models here.

class Profile(models.Model):
    age = models.PositiveSmallIntegerField(validators=[MinValueValidator(8), MaxValueValidator(95)])
    weight = models.DecimalField(max_digits=5, decimal_places=2)
    height = models.DecimalField(max_digits=5, decimal_places=2)
    goal_weight = models.DecimalField(max_digits=5, decimal_places=2)
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)


class Muscle(models.Model):
    name = models.CharField(max_length=255)



class Exercise(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField()
    start_reps = models.PositiveSmallIntegerField(blank=True)
    start_sets = models.PositiveSmallIntegerField(blank=True)
    duration = models.PositiveSmallIntegerField()
    start_distance = models.DecimalField(max_digits=5, decimal_places=2, blank=True)
    muscle = models.ManyToManyField(Muscle, through='MuscleExercise')



class ExerciseCustom(models.Model):
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    default_exercise = models.OneToOneField(Exercise, on_delete=models.PROTECT)
    new_reps = models.PositiveSmallIntegerField(blank=True)
    new_sets = models.PositiveSmallIntegerField(blank=True)
    duration = models.PositiveSmallIntegerField()
    new_distance = models.DecimalField(max_digits=5, decimal_places=2, blank=True)

class ExerciseAchievement(models.Model):
    achieved_sets = models.PositiveSmallIntegerField(blank=True)
    achieved_reps = models.PositiveSmallIntegerField(blank=True)
    achieved_distance = models.DecimalField(max_digits=5, decimal_places=2, blank=True)
    exercise = models.ForeignKey(Exercise, on_delete=models.CASCADE)


class Weekday(models.Model):
    weekday = models.CharField(max_length=255)

    def __str__(self) -> str:
        return self.weekday
    
    class Meta:
        ordering = ['id']


class Plan(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    exercise = models.ManyToManyField(Exercise, related_name='plans', through='ExercisePlan')
    weekday = models.ManyToManyField(Weekday, through='PlanWeekday', related_name='plans')




class PlanWeekday(models.Model):
    plan = models.ForeignKey(Plan, on_delete=models.CASCADE)
    weekday = models.ForeignKey(Weekday, on_delete=models.CASCADE)



class ExercisePlan(models.Model):
    plan = models.ForeignKey(Plan, on_delete=models.CASCADE)
    exercise = models.ForeignKey(Exercise, on_delete=models.CASCADE)



class MuscleExercise(models.Model):
    muscle = models.ForeignKey(Muscle, on_delete=models.CASCADE)
    exercise = models.ForeignKey(Exercise, on_delete=models.CASCADE)


class Assessment(models.Model):
    weight = models.DecimalField(max_digits=5, decimal_places=2)
    weight_added = models.DateField(auto_now_add=True)
    weight_lost = models.DecimalField(max_digits=5, decimal_places=2)
    weight_gained = models.DecimalField(max_digits=5, decimal_places=2)



class Tracking(models.Model):
    completion_rate = models.DecimalField(max_digits=5, decimal_places=2)
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)

