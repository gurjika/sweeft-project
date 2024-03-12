from django.shortcuts import render
from rest_framework.mixins import ListModelMixin, CreateModelMixin, RetrieveModelMixin, DestroyModelMixin, UpdateModelMixin
from rest_framework.viewsets import ModelViewSet, GenericViewSet
from rest_framework.permissions import IsAuthenticated, AllowAny, IsAdminUser
from rest_framework.decorators import action
from django.db.models import Subquery
from rest_framework.exceptions import NotFound

from rest_framework.response import Response
from django.db.models import Prefetch
from django.contrib.contenttypes.models import ContentType
from exercisehub.serializers import AddExerciseToListSerializer, AddPlanToWeekDaySerializer, AssessmentSerializer, CreatePlanSerializer, CustomExerciseSerializer, DefaultExerciseSerializer, ExerciseAchievementSerializer, CustomOrExerciseSerializer, FullAssessmentSerializer, PlanSerializer, ProfileAchievementsSerializer, ProfileSerializer, SimpleProfileSerializer, UploadExerciseSerializer, WeekDaySerializer
from .models import Assessment, Exercise, ExerciseAchievement, Plan, Profile, Weekday, Tracking
from datetime import datetime
# Create your views here.


class ProfileViewSet(ListModelMixin, RetrieveModelMixin, UpdateModelMixin, GenericViewSet):
    serializer_class = ProfileSerializer



    def get_permissions(self):
        if self.request.method == 'GET':
            return [AllowAny()]
        return [IsAdminUser()]
    

    def get_queryset(self):
        plan_prefetch = Prefetch(
        'plans',
        queryset=Plan.objects.prefetch_related('exercise'))

        profiles = Profile.objects.select_related('user').prefetch_related(plan_prefetch)
        return profiles
    
    def get_serializer_class(self):
        if self.request.method == 'GET':
            return ProfileSerializer
        return SimpleProfileSerializer


    @action(detail=False, methods=['GET', 'PATCH'], permission_classes=[IsAuthenticated])
    def me(self, request):
      
        profile = self.get_queryset().filter(user=self.request.user).first()

        if request.method == 'GET':
            serializer = ProfileSerializer(profile)
            return Response(serializer.data)
        elif request.method == 'PATCH':
            serializer = ProfileSerializer(profile, data=request.data)
            serializer.is_valid(raise_exception=True)
            serializer.save()
            return Response(serializer.data)
        
    @action(detail=False, methods=['GET'], permission_classes=[IsAuthenticated])
    def achievement(self, request):
        


        queryset = Profile.objects.filter(user=self.request.user)
        if request.method == 'GET':
            serializer = ProfileAchievementsSerializer(queryset, many=True)
            return Response(serializer.data)




class ExerciseViewSet(ModelViewSet):
    queryset = Exercise.objects.all().prefetch_related('muscles')
    serializer_class = DefaultExerciseSerializer

    def get_permissions(self):
        if self.request.method == 'GET':
            return [AllowAny()]
        return [IsAdminUser()]
    
class WeekdayViewSet(RetrieveModelMixin, ListModelMixin, GenericViewSet, DestroyModelMixin):
    
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        queryset = Plan.objects.filter(profile=self.request.user.profile)
        

        return queryset
    
    def get_object(self):
        try:
            Plan.objects.filter(profile=self.request.user.profile).filter(weekday_id=self.kwargs['pk']).exists()
            return Plan.objects.get(profile=self.request.user.profile, weekday_id=self.kwargs['pk'])
        except Plan.DoesNotExist:
            raise NotFound(detail='Weekday has no plans', code=404)
    
    def get_serializer_class(self):
       
        if self.request.method == 'POST':
            return CreatePlanSerializer
        return PlanSerializer
    
    def get_serializer_context(self):
        context = {'user': self.request.user, 'profile_id': self.request.user.profile.id}
        return context
    

    def destroy(self, request, *args, **kwargs):
        plan = Plan.objects.get(weekday_id=self.kwargs['pk'], profile=self.request.user.profile)
        weekday = plan.weekday
        plan.weekday = None
        plan.save()
       
        return Response(f'plan removed on {weekday}')
        
    

class MyExercisesViewSet(ModelViewSet):

    permission_classes = [IsAuthenticated]
    http_method_names = ['patch', 'get', 'delete', 'head', 'options', 'post']

    serializer_class = CustomOrExerciseSerializer

    def get_queryset(self):
        plan = Plan.objects.get(weekday_id=self.kwargs['weekday_pk'], profile__user=self.request.user)
        return Exercise.objects.filter(plan=plan).prefetch_related('muscles').prefetch_related('custom_exercise').all()

    def get_serializer_class(self):
        if self.request.method == 'GET':
            return CustomOrExerciseSerializer
        if self.request.method == 'POST':
            return AddExerciseToListSerializer
        return CustomExerciseSerializer
    
    def get_serializer_context(self):
        context = {'user': self.request.user}

        



        if self.request.method == 'POST':
            context['weekday_pk'] = self.kwargs['weekday_pk']
        if self.request.method == 'PATCH':
             context['exercise_pk'] = self.kwargs['pk']
             context['weekday_pk'] =  self.kwargs['weekday_pk']
            
        return context

    def destroy(self, request, *args, **kwargs):
        plan = Plan.objects.get(weekday_id=self.kwargs['weekday_pk'], profile__user=self.request.user)
        exercise = Exercise.objects.get(pk=self.kwargs['pk'])
        plan.exercise.remove(exercise)
        return Response('Exercise Removed from your plan')
    


class AssessmentViewSet(ListModelMixin, GenericViewSet, CreateModelMixin):
    permission_classes = [IsAuthenticated]
    serializer_class = FullAssessmentSerializer
    def get_queryset(self):
        queryset = Profile.objects.filter(user=self.request.user).prefetch_related('assessments')
        return queryset
    

    
    @action(detail=False)
    def assessment(self, request):
        if self.request.method == 'GET':
            return AssessmentSerializer
        


    def get_serializer_context(self):
        return {'profile_id': self.request.user.profile.id}
    


class ExerciseCompletionViewSet(ListModelMixin, CreateModelMixin, GenericViewSet):
    permission_classes = [IsAuthenticated]
    def get_serializer_class(self):
        if self.request.method == 'GET':
            return PlanSerializer
        return UploadExerciseSerializer

    def get_queryset(self):
        weekday = datetime.now().strftime('%A')
        queryset = Plan.objects.filter(weekday__weekday=weekday, profile__user=self.request.user)
        return queryset
    

    def get_serializer_context(self):
        weekday = datetime.now().strftime('%A')
        return {'weekday': weekday, 'user': self.request.user}
    

class MyPlansViewSet(ModelViewSet):

    http_method_names = ['get', 'post', 'delete', 'patch', 'head', 'options']


    def get_queryset(self):
        return Plan.objects.filter(profile__user=self.request.user)
    
    def get_serializer_class(self):
        if self.request.method == 'GET':
            return PlanSerializer
        if self.request.method == 'PATCH':
            return AddPlanToWeekDaySerializer
        if self.request.method == 'POST':
            return CreatePlanSerializer
    

    def get_serializer_context(self):
        return {'profile_id': self.request.user.profile.id}