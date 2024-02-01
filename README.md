# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Reverted Features](#rSeverted-features)
- [Containerization](#containerization)
- [Contributors](#contributors)
- [License](#license)




## Features

- **Order List:** View a comprehensive list of orders including details like date UUID, user ID, card number, store code, product code, product quantity, order date, and shipping date.
  
![Screenshot 2023-08-31 at 15 48 48](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/3a3bae88-9224-4755-bf62-567beb7bf692)

- **Pagination:** Easily navigate through multiple pages of orders using the built-in pagination feature.
  
![Screenshot 2023-08-31 at 15 49 08](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/d92a045d-b568-4695-b2b9-986874b4ed5a)

- **Add New Order:** Fill out a user-friendly form to add new orders to the system with necessary information.
  
![Screenshot 2023-08-31 at 15 49 26](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/83236d79-6212-4fc3-afa3-3cee88354b1a)

- **Data Validation:** Ensure data accuracy and completeness with required fields, date restrictions, and card number validation.

## Getting Started

### Prerequisites

For the application to succesfully run, you need to install the following packages:

- flask (version 2.2.2)
- pyodbc (version 4.0.39)
- SQLAlchemy (version 2.0.21)
- werkzeug (version 2.2.3)

### Usage

To run the application, you simply need to run the `app.py` script in this repository. Once the application starts you should be able to access it locally at `http://127.0.0.1:5000`. Here you will be meet with the following two pages:

1. **Order List Page:** Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

2. **Add New Order Page:** Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.

## Reverted Features: Delivery Date Column

### Delivery Date Column
#### Overview
The `delivery_date` feature, aimed at tracking order delivery dates, was added and later reverted. This documentation provides detailed implementation and potential usage for future reference.

#### Developer Guide

- **Branch Name**: `revert-delivery-date`
- **Commit Hash for Revert**: The feature was reverted in commit `9da61682fe08c6e7d7827f4fb476617c9f49a053` on the `revert-delivery-date` branch.

##### Database Model
- **Model Changes**: Added a `delivery_date` column to the `Order` class in `app.py`.

##### Backend Changes
- **Route Update**: Modified the `/add_order` route to include `delivery_date` processing.

##### Frontend Adjustments
- **Form Update**: Updated `order.html` to incorporate a `delivery_date` field for adding and displaying orders.

#### User Guide

- **Placing Orders**: Users had the option to specify delivery dates for new orders via a dedicated field.
- **Viewing Orders**: Delivery dates were displayed in the order list, alongside other essential order details.

This feature has been documented with branch and commit details for potential reintegration or reference in the future.

## Containerization

### Containerization Process

#### Building the Dockerfile

1. **Dockerfile Overview**: The provided Dockerfile is a set of instructions for Docker to automatically build a container image for our web application.

2. **Base Image**: We start with `python:3.8-slim` as our base image, chosen for its balance between size and utility, providing a Python environment with minimal overhead.

3. **Working Directory**: Setting the working directory to `/app` ensures that all subsequent commands run in this location within the container.

4. **Dependencies**: Essential system dependencies are installed using `apt-get` to ensure that our application has all the necessary libraries and tools, such as `gcc` for compiling and `unixodbc-dev` for database connectivity.

5. **Python Environment**: We upgrade `pip` and install the required Python packages as specified in `requirements.txt`, ensuring that the Python environment is prepared with the dependencies our application needs.

6. **Final Steps**: We set the command to run the application using `CMD` and document the port that our application will be served on using `EXPOSE`.

### Docker Commands

#### Usage

- **Building the Image**: `docker build -t webapp-devops .` to create an image from the Dockerfile in the current directory.
- **Running a Container**: `docker run -p 5000:5000 webapp-devops` to start a container and expose it on port 5000.
- **Tagging the Image**: `docker tag webapp-devops walaab/aicore_finalproject` to assign a tag to the image for pushing to Docker Hub.
- **Pushing to Docker Hub**: `docker push walaab/aicore_finalproject` to upload the tagged image to Docker Hub.

### Image Information

The Docker image for the Web-App-DevOps-Project includes all the dependencies and configurations required to run the web application in a containerized environment. The image is named `webapp-devops` and is tagged as `walaab/aicore_finalproject` for version control and distribution through Docker Hub.



## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
