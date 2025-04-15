# Use official Python image from Docker Hub
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt to the container
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the container
COPY . /app/

# Expose the port Django will run on
EXPOSE 8000

# Set the environment variable to tell Django to run in production mode
ENV DJANGO_SETTINGS_MODULE=your_project_name.settings.production

# Run Django’s development server (You can replace this with gunicorn for production)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

