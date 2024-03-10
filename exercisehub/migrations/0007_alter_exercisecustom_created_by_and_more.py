# Generated by Django 5.0.3 on 2024-03-10 19:35

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exercisehub', '0006_alter_exercisecustom_created_by_alter_plan_exercise_and_more'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.AlterField(
            model_name='exercisecustom',
            name='created_by',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='exercisecustom',
            name='default_exercise',
            field=models.OneToOneField(on_delete=django.db.models.deletion.PROTECT, related_name='custom_exercise', to='exercisehub.exercise'),
        ),
    ]
