# Generated by Django 5.0.3 on 2024-03-12 20:21

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exercisehub', '0033_alter_exercisecustom_default_exercise'),
    ]

    operations = [
        migrations.AddField(
            model_name='completedexercise',
            name='completed_by',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='completed_exercises', to='exercisehub.profile'),
            preserve_default=False,
        ),
    ]