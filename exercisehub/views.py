from django.shortcuts import render
from rest_framework.mixins import ListModelMixin, CreateModelMixin, RetrieveModelMixin, DestroyModelMixin, UpdateModelMixin
from rest_framework.viewsets import ModelViewSet, GenericViewSet
from rest_framework.permissions import IsAuthenticated, AllowAny, IsAdminUser
from rest_framework.decorators import action
from rest_framework.response import Response
from exercisehub.serializers import AddExerciseToListSerializer, CustomExerciseSerializer, ExerciseSerializer, PlanSerializer, ProfileSerializer, WeekDaySerializer
from .models import Exercise, Plan, Profile, Weekday
# Create your views here.


class ProfileViewSet(ModelViewSet):
    queryset = Profile.objects.all()
    serializer_class = ProfileSerializer


    def get_permissions(self):
        if self.request.method == 'GET':
            return [AllowAny()]
        return [IsAdminUser()]
    

    @action(detail=False, methods=['GET', 'PUT'], permission_classes=[IsAuthenticated])
    def me(self, request):      
        profile = Profile.objects.get(user_id=request.user.id)

        if request.method == 'GET':
            serializer = ProfileSerializer(profile)
            return Response(serializer.data)
        elif request.method == 'PUT':
            serializer = ProfileSerializer(profile, data=request.data)
            serializer.is_valid(raise_exception=True)
            serializer.save()
            return Response(serializer.data)


class ExerciseViewSet(ModelViewSet):
    queryset = Exercise.objects.all()
    serializer_class = ExerciseSerializer

    def get_permissions(self):
        if self.request.method == 'GET':
            return [AllowAny()]
        return [IsAdminUser()]
    
class WeekdayViewSet(ListModelMixin, GenericViewSet, RetrieveModelMixin):

    
    serializer_class = WeekDaySerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return Weekday.objects.filter(plan__user_id=self.request.user.id).all()
    

class MyExercisesViewSet(ModelViewSet):
    http_method_names = ['patch', 'get', 'delete', 'head', 'options', 'post']

    serializer_class = ExerciseSerializer

    def get_queryset(self):
        return Exercise.objects.filter(plan__user=self.request.user).all()

    def get_serializer_class(self):
        if self.request.method == 'GET':
            return ExerciseSerializer
        if self.request.method == 'POST':
            return AddExerciseToListSerializer
        return CustomExerciseSerializer
    
    def get_serializer_context(self):
        if self.request.method == 'POST':
            return {'plan_pk': self.kwargs['plan_pk']}
        if self.request.method == 'PATCH':
             return {'exercise_pk': self.kwargs['pk'], 'weekday_pk': self.kwargs['plan_pk']}
    

    def destroy(self, request, *args, **kwargs):
        plan = Plan.objects.get(pk=self.kwargs['plan_pk'])
        exercise = Exercise.objects.get(pk=self.kwargs['pk'])
        plan.exercise.remove(exercise)
        return Response('Exercise Removed from your plan')