# Generated by Django 5.0.3 on 2024-03-11 13:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exercisehub', '0018_remove_exercise_start_distance'),
    ]

    operations = [
        migrations.AddField(
            model_name='exerciseachievement',
            name='duration',
            field=models.PositiveSmallIntegerField(default=15),
            preserve_default=False,
        ),
    ]