# ------------------- Stage 1: Build Stage ------------------------------
FROM python:3.9 AS backend-builder

# Set the working directory to /app
WORKDIR /app

# Copy the contents of the backend directory into the container at /app
COPY backend/ .

# Install dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# ------------------- Stage 2: Final Stage ------------------------------

# Use a slim Python 3.9 image as the final base image
FROM python:3.9-slim

# Set the working directory to /app
WORKDIR /app

# Copy the built dependencies from the backend-builder stage
COPY --from=backend-builder /usr/local/lib/python3.9/site-packages/ /usr/local/lib/python3.9/site-packages/

# Copy the application code from the backend-builder stage
COPY --from=backend-builder /app /app

# Expose port 5000 for the Flask application
EXPOSE 5000

# Define the default command to run the application
CMD ["python", "app.py"]
