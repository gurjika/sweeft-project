# Generated by Django 5.0.3 on 2024-03-11 14:04

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('exercisehub', '0020_exerciseachievement_date_added'),
    ]

    operations = [
        migrations.RenameField(
            model_name='exercise',
            old_name='start_reps',
            new_name='reps',
        ),
        migrations.RenameField(
            model_name='exercise',
            old_name='start_sets',
            new_name='sets',
        ),
    ]