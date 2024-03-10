from django.contrib import admin
from django.urls import include, path
from rest_framework_nested import routers
from . import views
router = routers.DefaultRouter()

router.register(prefix='profiles', viewset=views.ProfileViewSet)
router.register(prefix='exercises', viewset=views.ExerciseViewSet)
urlpatterns = [
    ###
]

urlpatterns += router.urls