# Generated by Django 5.0.3 on 2024-03-11 12:53

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exercisehub', '0015_alter_profile_age_alter_profile_goal_weight_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='exerciseachievement',
            name='profile',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='achievements', to='exercisehub.profile'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='exerciseachievement',
            name='exercise',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='exercises', to='exercisehub.exercise'),
        ),
    ]
