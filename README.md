# ExerciseHub API

ExerciseHub is a comprehensive fitness tracking API, designed to manage users' profiles, exercises, plans, and achievements. Built with Django and Django Rest Framework (DRF).



# API Endpoints Overview
ExerciseHub API offers a variety of endpoints for managing fitness data:

### Profiles: 
Manage user profiles, including fetching and updating profile information.

### Exercises:
Retrieve and manage exercises, including creating new exercises and listing all available exercises.

### Plans: 
Create, retrieve, update, and delete workout plans.

### Assessments: 
Manage user fitness assessments.

### Achievements:
Track and retrieve user exercise achievements and history.

### Each endpoint supports various operations, such as GET, POST, PATCH, and DELETE, tailored to the needs of the respective resource.

# Swagger Documentation
To explore and test the API endpoints, visit the Swagger documentation at http://localhost:8000/swagger/schema. This interactive documentation provides detailed information about each endpoint, including the expected request bodies, response formats, and query parameters.

## Clone the repository.
### Install the required dependencies: pip install -r requirements.txt.

### Run the Django migrations to set up your database: python manage.py migrate.

### Start the development server: python manage.py runserver.
 
### Populate the Postgresql database: python manage.py seed_db or run psql -h host -U user -d database -f  outputfile.sql

