# Generated by Django 5.0.3 on 2024-03-13 10:21

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exercisehub', '0038_plan_plan_description_plan_recommended'),
    ]

    operations = [
        migrations.AlterField(
            model_name='plan',
            name='profile',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='profile_plans', to='exercisehub.profile'),
        ),
    ]
