from .models import CompletedExercise, Exercise, ExerciseCustom, Profile, Tracking, Plan
from django.conf import settings
from django.dispatch import receiver
from django.contrib.contenttypes.models import ContentType
from django.db.models import Avg
from django.db.models.signals import post_save

@receiver(post_save, sender=settings.AUTH_USER_MODEL)
def create_customer_for_new_user(sender, **kwargs):
    if kwargs['created']:
        Profile.objects.create(user=kwargs['instance'])


@receiver(post_save, sender=Tracking)
def update_overall_completion_rate(sender, created, instance, **kwargs):
    if created:
         
        plan = instance.plan
        profile = plan.profile
        plan_ids = Plan.objects.filter(profile=profile).values_list('id', flat=True)

        tracking_avg = Tracking.objects.filter(
                plan_id__in=plan_ids, 
            ).aggregate(average_completion=Avg('completion_percentage'))

        profile.overall_completion_rate = tracking_avg['average_completion']
        profile.save()



