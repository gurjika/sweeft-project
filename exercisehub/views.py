from django.shortcuts import render
from rest_framework.mixins import ListModelMixin, CreateModelMixin, RetrieveModelMixin, DestroyModelMixin, UpdateModelMixin
from rest_framework.viewsets import ModelViewSet, GenericViewSet
from rest_framework.permissions import IsAuthenticated, AllowAny, IsAdminUser
from rest_framework.decorators import action
from rest_framework.response import Response
from django.db.models import Prefetch
from django.contrib.contenttypes.models import ContentType
from exercisehub.serializers import AddExerciseToListSerializer, AddPlanToWeekDaySerializer, AssessmentSerializer, CustomExerciseSerializer, DefaultExerciseSerializer, ExerciseAchievementSerializer, CustomOrExerciseSerializer, FullAssessmentSerializer, PlanSerializer, ProfileAchievementsSerializer, ProfileSerializer, SimpleProfileSerializer, UploadExerciseSerializer, WeekDaySerializer
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
        queryset=Plan.objects.prefetch_related().prefetch_related('weekdays').prefetch_related('exercise'))

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
    
class WeekdayViewSet(ListModelMixin, RetrieveModelMixin, DestroyModelMixin, GenericViewSet, CreateModelMixin):

    
    permission_classes = [IsAuthenticated]

    def get_queryset(self):


        queryset = Weekday.objects.filter(plan__profile=self.request.user.profile).prefetch_related(
            'plan',  
             
            Prefetch('plan__exercise', queryset=Exercise.objects.prefetch_related(
                'muscles', 
                'custom_exercise', 
            )),
        ).prefetch_related('plan__completion_rates').prefetch_related('plan__weekdays').all()

        return queryset
    

    def get_serializer_class(self):
        if self.request.method == 'GET':
            return WeekDaySerializer
        if self.request.method == 'POST':
            return AddPlanToWeekDaySerializer
    
    def get_serializer_context(self):
        return {'profile_id': self.request.user.profile.id}
    

    def destroy(self, request, *args, **kwargs):
        weekday = Weekday.objects.get(id=self.kwargs['pk'])
        #TODO weekdays have one plan only, while plans may have many weekdays

        weekday.plan = None
        weekday.save()
        return Response(f'plan removed on {weekday.weekday}')
        
    

class MyExercisesViewSet(ModelViewSet):

    permission_classes = [IsAuthenticated]
    http_method_names = ['patch', 'get', 'delete', 'head', 'options', 'post']

    serializer_class = CustomOrExerciseSerializer

    def get_queryset(self):
        plan = Weekday.objects.get(id=self.kwargs['weekday_pk']).plan
        return Exercise.objects.filter(plan__profile__user=self.request.user, plan=plan).select_related('custom_exercise').prefetch_related('muscles').all()

    def get_serializer_class(self):
        if self.request.method == 'GET':
            return CustomOrExerciseSerializer
        if self.request.method == 'POST':
            return AddExerciseToListSerializer
        return CustomExerciseSerializer
    
    def get_serializer_context(self):
        if self.request.method == 'POST':
            return {'weekday_pk': self.kwargs['weekday_pk'], 'user': self.request.user, }
        if self.request.method == 'PATCH':
             return {'exercise_pk': self.kwargs['pk'], 'weekday_pk': self.kwargs['weekday_pk'], 'user': self.request.user}
    

    def destroy(self, request, *args, **kwargs):
        weekday = Weekday.objects.get(id=self.kwargs['weekday_pk'])
        plan = weekday.plan
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
            return WeekDaySerializer
        return UploadExerciseSerializer

    def get_queryset(self):
        weekday = datetime.now().strftime('%A')

        queryset = Weekday.objects.filter(plan__profile=self.request.user.profile, weekday=weekday).prefetch_related(
            'plan',  
             
            Prefetch('plan__exercise', queryset=Exercise.objects.prefetch_related(
                'muscles', 
                'custom_exercise', 
            )),
        ).prefetch_related('plan__completion_rates').prefetch_related('plan__weekdays').all()

        return queryset
    

    def get_serializer_context(self):
        weekday = datetime.now().strftime('%A')
        return {'weekday': weekday}