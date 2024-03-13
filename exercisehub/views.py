from django.shortcuts import render
from rest_framework.mixins import ListModelMixin, CreateModelMixin, RetrieveModelMixin, DestroyModelMixin, UpdateModelMixin
from rest_framework.viewsets import ModelViewSet, GenericViewSet
from rest_framework.permissions import IsAuthenticated, AllowAny, IsAdminUser
from rest_framework.decorators import action
from django.db.models import Subquery
from rest_framework.exceptions import NotFound
from rest_framework.filters import SearchFilter
from rest_framework.response import Response
from django.db.models import Prefetch
from django.contrib.contenttypes.models import ContentType
from exercisehub.serializers import AddExerciseToListSerializer, AddPlanToWeekDaySerializer, AssessmentSerializer, CreatePlanSerializer, CustomExerciseSerializer, DefaultExerciseSerializer, ExerciseAchievementSerializer, CustomOrExerciseSerializer, FullAssessmentSerializer, HistorySerializer, PlanSerializer, ProfileAchievementsSerializer, ProfileSerializer, SimpleProfileSerializer, UploadExerciseSerializer, WeekDaySerializer
from .models import Assessment, CompletedExercise, Exercise, ExerciseAchievement, ExerciseCustom, Plan, Profile, Weekday, Tracking
from datetime import datetime
# Create your views here.


class ProfileViewSet(ListModelMixin, RetrieveModelMixin, UpdateModelMixin, GenericViewSet):
    serializer_class = ProfileSerializer
    """
    get:
    Return a list of all the existing profiles.

    retrieve:
    Return the given profile.

    update:
    Update a profile instance.
    """


    def get_permissions(self):

        """
        Permissions change based on the request method:
        - 'GET' requests are allowed for any user.
        - All other requests require admin permissions.
        """
        if self.request.method == 'GET':
            return [AllowAny()]
        return [IsAdminUser()]
    

    def get_queryset(self):
        plan_prefetch = Prefetch(
        'profile_plans',
        queryset=Plan.objects.prefetch_related('exercise'))

        profiles = Profile.objects.select_related('user').prefetch_related(plan_prefetch)

        if not self.request.user.is_staff:
            profiles = profiles.filter(user=self.request.user)
        return profiles
    
    def get_serializer_class(self):
        if self.request.method == 'GET':
            return ProfileSerializer
        return SimpleProfileSerializer


    @action(detail=False, methods=['GET', 'PATCH'], permission_classes=[IsAuthenticated])
    def me(self, request):

        """
        me [GET]:
        Return the profile of the currently authenticated user.

        me [PATCH]:
        Update the profile of the currently authenticated user.
        """
      
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
        """
        achievement [GET]:
        Return the achievements of the currently authenticated user's profile.
        """


        queryset = Profile.objects.filter(user=self.request.user)
        if request.method == 'GET':
            serializer = ProfileAchievementsSerializer(queryset, many=True)
            return Response(serializer.data)
        
    @action(detail=False, methods=['GET'], permission_classes=[IsAuthenticated])
    def history(self, request):

        """
        history [GET]:
        Return the exercise history of the currently authenticated user's profile.
        """
        queryset = CompletedExercise.objects.filter(completed_by=self.request.user.profile).select_related('exercise')
        
        if request.method == 'GET':
            serializer = HistorySerializer(queryset, many=True)
            return Response(serializer.data)






class ExerciseViewSet(ModelViewSet):

    """
    retrieve:
    Return a single exercise instance by ID.

    list:
    Return a list of all exercises, filtered by any parameter sent.

    create:
    Create a new exercise instance.

    Permissions change based on the request method:
    - 'GET' requests are allowed for any user.
    - All other requests require admin permissions.
    """


    queryset = Exercise.objects.all().prefetch_related('muscles')
    serializer_class = DefaultExerciseSerializer
    filter_backends = [SearchFilter]
    search_fields = ['duration', 'muscles__muscle']


    def get_permissions(self):
        if self.request.method == 'GET':
            return [AllowAny()]
        return [IsAdminUser()]
    
class WeekdayViewSet(RetrieveModelMixin, ListModelMixin, GenericViewSet, DestroyModelMixin):
    """
    get:
    Return a list of plans for the current user.

    retrieve:
    Return a specific plan by weekday for the current user.

    destroy:
    Remove a plan from a specific weekday for the current user.
    
    Permission is required for authenticated users.
    """
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        queryset = Plan.objects.filter(profile=self.request.user.profile).prefetch_related('completion_rates').prefetch_related('exercise')
        

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

    """
    list:
    Return a list of exercises for the plan of the specified weekday for the current user.

    create:
    Add an exercise to the plan of the specified weekday for the current user.

    delete:
    Remove an exercise from the plan of the specified weekday for the current user.

    Permission is required for authenticated users.
    """


    permission_classes = [IsAuthenticated]
    http_method_names = ['patch', 'get', 'delete', 'head', 'options', 'post']

    serializer_class = CustomOrExerciseSerializer

    def get_queryset(self):
        plan = Plan.objects.get(weekday_id=self.kwargs['weekday_pk'], profile__user=self.request.user)
        return Exercise.objects.filter(plan=plan)\
        .prefetch_related(Prefetch('custom_exercise', queryset=ExerciseCustom.objects.filter(created_by=self.request.user), to_attr='user_custom_exercise'))\
        .prefetch_related('muscles')

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
    """
    list:
    Return a list of assessments for the current user.

    create:
    Create a new assessment for the current user.

    Permission is required for authenticated users.
    """



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

    """
    list:
    Return a list of plans for today for the current user.

    create:
    Mark an exercise as completed for today's plan for the current user.

    Permission is required for authenticated users.
    """
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


    """
    list:
    Return a list of plans for the current user.

    create:
    Create a new plan for the current user.

    update:
    Update a specific plan for the current user.

    delete:
    Delete a specific plan for the current user.

    Permission is required for authenticated users.
    """

    http_method_names = ['get', 'post', 'delete', 'patch', 'head', 'options']


    def get_queryset(self):
        return Plan.objects.filter(profile__user=self.request.user).prefetch_related('completion_rates').prefetch_related('exercise')
    
    def get_serializer_class(self):
        if self.request.method == 'GET':
            return PlanSerializer
        if self.request.method == 'PATCH':
            return AddPlanToWeekDaySerializer
        if self.request.method == 'POST':
            return CreatePlanSerializer
    

    def get_serializer_context(self):

        return {'profile_id': self.request.user.profile.id, 'user': self.request.user,}