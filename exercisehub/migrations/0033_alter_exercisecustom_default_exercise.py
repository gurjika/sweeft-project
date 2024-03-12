# Generated by Django 5.0.3 on 2024-03-12 17:30

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exercisehub', '0032_alter_plan_options_alter_plan_profile_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='exercisecustom',
            name='default_exercise',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='custom_exercise', to='exercisehub.exercise'),
        ),
    ]
