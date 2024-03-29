# Generated by Django 5.0.3 on 2024-03-12 10:45

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exercisehub', '0025_profile_overall_completion_rate_and_more'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='assessment',
            options={'ordering': ['-weight_added']},
        ),
        migrations.RemoveField(
            model_name='tracking',
            name='content_type',
        ),
        migrations.RemoveField(
            model_name='tracking',
            name='object_id',
        ),
        migrations.AddField(
            model_name='tracking',
            name='plan',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='exercisehub.plan'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='tracking',
            name='completion_percentage',
            field=models.DecimalField(decimal_places=2, max_digits=5),
        ),
    ]
