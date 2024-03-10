from django.contrib import admin

# Register your models here.
from . import models


admin.site.register(models.Profile)
admin.site.register(models.Muscle)
admin.site.register(models.Exercise)
admin.site.register(models.ExerciseCustom)
admin.site.register(models.ExerciseAchievement)
admin.site.register(models.Weekday)
admin.site.register(models.Plan)
admin.site.register(models.PlanWeekday)
admin.site.register(models.ExercisePlan)
admin.site.register(models.MuscleExercise)
admin.site.register(models.Tracking)
admin.site.register(models.Assessment)


