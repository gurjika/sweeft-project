# Generated by Django 5.0.3 on 2024-03-13 13:40

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exercisehub', '0040_remove_plan_plan_description_remove_plan_recommended_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='plan',
            name='profile',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='profile_plans', to='exercisehub.profile'),
        ),
    ]
