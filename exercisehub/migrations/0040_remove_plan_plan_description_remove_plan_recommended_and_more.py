# Generated by Django 5.0.3 on 2024-03-13 10:33

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exercisehub', '0039_alter_plan_profile'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='plan',
            name='plan_description',
        ),
        migrations.RemoveField(
            model_name='plan',
            name='recommended',
        ),
        migrations.AlterField(
            model_name='plan',
            name='profile',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='profile_plans', to='exercisehub.profile'),
            preserve_default=False,
        ),
    ]
