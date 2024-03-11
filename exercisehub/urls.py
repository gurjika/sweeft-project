from django.contrib import admin
from django.urls import include, path
from rest_framework_nested import routers
from . import views
router = routers.DefaultRouter()

router.register(prefix='profiles', viewset=views.ProfileViewSet, basename='profiles')
router.register(prefix='all-exercises', viewset=views.ExerciseViewSet)
router.register(prefix='plans', viewset=views.WeekdayViewSet, basename='plans')
router.register(prefix='assessments', viewset=views.AssessmentViewSet, basename='assessments')


plans_router = routers.NestedDefaultRouter(parent_router=router, parent_prefix='plans', lookup='plan')
plans_router.register('exercises', views.MyExercisesViewSet, basename='exercises')

urlpatterns = [
    ###
]

urlpatterns += router.urls + plans_router.urls