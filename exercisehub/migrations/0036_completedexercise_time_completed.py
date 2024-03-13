# Generated by Django 5.0.3 on 2024-03-12 20:58

import django.utils.timezone
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exercisehub', '0035_alter_assessment_weight_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='completedexercise',
            name='time_completed',
            field=models.DateField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
    ]