# Dockerfile for Web-App-DevOps-Project
# This Dockerfile is a set of instructions to Docker for how to construct the container image for this Flask application.
# The resulting image will contain the Python interpreter and all the necessary code and dependencies to run the app.
# It starts from a base image that already has Python installed, and then it installs the specific packages needed.
# The base image is tagged with '3.8-slim' to indicate that we're using Python 3.8 in a slimmed-down version of Debian.
# This slim image contains only the minimal packages needed to run Python and reduces the image size and surface area.

FROM python:3.8-slim

# WORKDIR is a Docker instruction that sets the working directory for any RUN, CMD, ENTRYPOINT, COPY, and ADD instructions that follow in the Dockerfile.
# Here, we set /app as the directory where we will be executing our subsequent commands and where our app will reside.
# It's equivalent to running 'cd /app' on a Linux machine.
# If /app doesn't exist, WORKDIR will create it, even if it's not used in any subsequent Dockerfile instruction.
WORKDIR /app

# COPY takes two parameters, the source and the destination.
# It copies files and directories from the source, which is the file system of the machine building the image, to the destination, which is the file system of the container.
# '.' denotes the current directory (where the Dockerfile is), and '/app' is the destination in the container's file system.
# This command is crucial because it moves the application code into the container, which is necessary for it to run.
COPY . /app

# RUN is used to execute commands inside your Docker image at build time.
# Here, we're using it to install system packages that our application depends on.
# These packages include tools and libraries that allow us to install the ODBC driver and compile certain Python packages that may include C extensions.
# The '&&' allows us to run multiple commands in succession, only proceeding if the previous command succeeded.
# The 'apt-get clean' at the end is used to remove the package lists that were downloaded by apt-get update, reducing the image size.
RUN apt-get update && apt-get install -y \
    unixodbc unixodbc-dev odbcinst odbcinst1debian2 libpq-dev gcc && \
    apt-get install -y gnupg && \
    apt-get install -y wget && \
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    wget -qO- https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y msodbcsql18 && \
    apt-get purge -y --auto-remove wget && \  
    apt-get clean


# Here, we use RUN again to upgrade pip and install the Python dependencies listed in the requirements.txt file.
# We use pip to install the Python dependencies which our application requires to run, such as Flask and SQLAlchemy.
# The '--no-cache-dir' option tells pip not tSo save the downloaded packages, which can save space in the final image.
# The '--trusted-host pypi.python.org' is an extra measure to prevent issues in networks with SSL certificate verification problems.
RUN pip install --upgrade pip setuptools \
    && pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

# EXPOSE is a way of documenting which ports are intended to be published at runtime.
# While EXPOSE doesn't actually publish the port, it functions as a type of documentation between the person who builds the image and the person who runs the container.
# For Flask apps, the default port is 5000. This line is a hint to anyone running the container that this port is important and is likely where the Flask service will be listening.
EXPOSE 5000

# CMD is the command the container executes by default when you launch the built image.
# This command starts the Flask web server.
# 'python' is the executable to run, followed by 'app.py', which is our Flask application.
# This CMD means: when the container starts, run the app.py file with Python, which should start the Flask server.
CMD ["python", "app.py"]

# This Dockerfile is carefully crafted to build a minimal and secure container image.
# It's optimized for build performance and includes necessary steps to make the application ready to run in a production-like environment.
# It's the blueprint for a Docker image, encapsulating all the software dependencies, configurations, and runtime instructions in one place.
