# Generated by Django 5.0.3 on 2024-03-12 12:07

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exercisehub', '0026_alter_assessment_options_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='weekday',
            name='plan',
        ),
        migrations.AddField(
            model_name='plan',
            name='weekday',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='plans', to='exercisehub.weekday'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='tracking',
            name='plan',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='completion_rates', to='exercisehub.plan'),
        ),
    ]
