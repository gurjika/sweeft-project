# Generated by Django 5.0.3 on 2024-03-10 19:34

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exercisehub', '0005_rename_muscle_exercise_muscles_and_more'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.AlterField(
            model_name='exercisecustom',
            name='created_by',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='custom_exercise', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='plan',
            name='exercise',
            field=models.ManyToManyField(related_name='plan', through='exercisehub.ExercisePlan', to='exercisehub.exercise'),
        ),
        migrations.AlterField(
            model_name='plan',
            name='weekday',
            field=models.ManyToManyField(related_name='plan', through='exercisehub.PlanWeekday', to='exercisehub.weekday'),
        ),
    ]
