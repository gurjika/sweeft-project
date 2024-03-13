### ExerciseHub API

ExerciseHub is a comprehensive fitness tracking API, designed to manage users' profiles, exercises, plans, and achievements. Built with Django and Django Rest Framework (DRF), it provides a robust set of endpoints for a fitness application.

### Features

## User Profiles: 
Manage user profiles, including viewing and updating profiles.

## Exercises:
Access to a vast library of exercises, along with the ability to create, retrieve, update, and delete custom exercises.

## Plans:
Users can create, update, and delete their workout plans, assign exercises to specific weekdays, and track their completion.

## Achievements & History: 
Track exercise achievements and view the history of completed exercises.


# API Endpoints

## Profiles

### GET /profiles/: Retrieve a list of all user profiles.
### GET /profiles/{id}/: Retrieve a specific profile by ID.
### PATCH /profiles/{id}/: Update a specific profile.

## Exercises

# GET /exercises/: Retrieve a list of all exercises.
# POST /exercises/: Create a new exercise.
# GET /exercises/{id}/: Retrieve a specific exercise by ID.
# PATCH /exercises/{id}/: Update a specific exercise.
# DELETE /exercises/{id}/: Delete a specific exercise.
## Plans

# GET /plans/: Retrieve a list of all plans for the current user.
# POST /plans/: Create a new plan.
# PATCH /plans/{weekday}/: Update a plan for a specific weekday.
# DELETE /plans/{weekday}/: Remove a plan from a specific weekday.

## Achievements & History

# GET /profiles/me/achievements/: Retrieve the achievements of the currently authenticated user.
# GET /profiles/me/history/: Retrieve the exercise history of the currently authenticated user.
# Authentication & Permissions
# The API uses token-based authentication. Most endpoints require the user to be authenticated. Permissions vary by endpoint:

Profile updates and sensitive actions require admin or user-specific permissions.
Reading exercises and general profile information is available to any authenticated user.
### Getting Started
# To use the ExerciseHub API, follow these steps:

### Clone the repository.
# Install the required dependencies: pip install -r requirements.txt.

# Run the Django migrations to set up your database: python manage.py migrate.

# Start the development server: python manage.py runserver.
 
# Populate the Postgresql: python manage.py seed_db

# Use a tool like Postman or cURL to interact with the API endpoints.
