from django.apps import AppConfig


class ExercisehubConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'exercisehub'


    def ready(self) -> None:
        import exercisehub.signals