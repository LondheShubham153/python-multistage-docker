# Multistage Dockerfile Example for Flask Application

This repository demonstrates the use of a multistage Dockerfile to build and package a Flask backend application. Multistage builds are used to optimize the final Docker image size and improve security.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Dockerfile Explanation](#dockerfile-explanation)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Modern application deployments often involve containerizing both the backend and frontend components. This project focuses on using a multistage Dockerfile to efficiently build a Flask backend application, creating a lightweight and secure Docker image.

## Prerequisites

- Docker: You need to have Docker installed on your machine. Visit [Docker's official website](https://www.docker.com/get-started) to download and install Docker.

## Getting Started

1. Clone this repository:
   ```sh
   git clone https://github.com/your-username/multistage-flask-app.git
   cd multistage-flask-app
   ```

2. Build the Docker image:
   ```sh
   docker build -t my-flask-app .
   ```

## Usage

1. Run the Docker container:
   ```sh
   docker run -p 5000:5000 my-flask-app
   ```

2. Access the Flask application in your web browser at `http://localhost:5000`.

## Dockerfile Explanation

The multistage Dockerfile consists of two build stages, each optimized for a specific purpose.

### Stage 1: Build the Flask Application

- Use a Python base image to build the Flask backend.
- Copy the backend source code and install dependencies.
- Build the Flask application.

### Stage 2: Final Image

- Use a minimal Python base image for the final image.
- Copy the built backend from Stage 1.
- Expose the necessary port and start the Flask application.

## Contributing

Contributions are welcome! If you find any issues or want to improve this project, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

