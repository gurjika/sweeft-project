# Generated by Django 5.0.3 on 2024-03-11 13:57

import django.utils.timezone
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exercisehub', '0019_exerciseachievement_duration'),
    ]

    operations = [
        migrations.AddField(
            model_name='exerciseachievement',
            name='date_added',
            field=models.DateField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
    ]
