# ExerciseHub API

ExerciseHub is a comprehensive fitness tracking API, designed to manage users' profiles, exercises, plans, and achievements. Built with Django and Django Rest Framework (DRF), it provides a robust set of endpoints for a fitness application.

# Features

## User Profiles: 
Manage user profiles, including viewing and updating profiles.

## Exercises:
Access to a vast library of exercises, along with the ability to create, retrieve, update, and delete custom exercises.

## Plans:
Users can create, update, and delete their workout plans, assign exercises to specific weekdays, and track their completion.

## Achievements & History: 
Track exercise achievements and view the history of completed exercises.



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
To explore and test the API endpoints, visit the Swagger documentation at http://localhost:8000/swagger/. This interactive documentation provides detailed information about each endpoint, including the expected request bodies, response formats, and query parameters.

## Clone the repository.
### Install the required dependencies: pip install -r requirements.txt.

### Run the Django migrations to set up your database: python manage.py migrate.

### Start the development server: python manage.py runserver.
 
### Populate the Postgresql: python manage.py seed_db

### Use a tool like Postman or cURL to interact with the API endpoints.
