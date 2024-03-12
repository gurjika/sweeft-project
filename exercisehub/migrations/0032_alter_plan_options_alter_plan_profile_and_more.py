# Generated by Django 5.0.3 on 2024-03-12 16:19

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exercisehub', '0031_alter_plan_weekday'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='plan',
            options={'ordering': ['weekday__id']},
        ),
        migrations.AlterField(
            model_name='plan',
            name='profile',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='profile_plans', to='exercisehub.profile'),
        ),
        migrations.AlterField(
            model_name='profile',
            name='overall_completion_rate',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=5),
        ),
    ]