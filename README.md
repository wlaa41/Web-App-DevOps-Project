# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Reverted Features](#rSeverted-features)
- [Containerization](#containerization)
- [Infrastructure as Code](#infrastructure as code)
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

## Infrastructure as Code: Networking Setup

The foundation of our e-commerce application's infrastructure on Azure is laid out using Terraform, an Infrastructure as Code (IaC) tool, which enables us to define, provision, and manage the cloud infrastructure using configuration files. Below are the steps and components involved in setting up the networking infrastructure for our application.

### Networking with Terraform on Azure

#### Prerequisites

Before proceeding, ensure that you have the Azure CLI installed and configured with the necessary permissions to create and manage Azure resources.

### Resource Group

- **File**: `main.tf`
- **Resource**: `azurerm_resource_group`
- **Purpose**: Serves as a container that holds related resources for the e-commerce application.
- **Importance**: Essential (1)
- **Dependencies**: All networking resources are dependent on the resource group.
- **Variables**:
  - `resource_group_name`: Name for the Azure Resource Group.
  - `location`: Geographic location for the deployment of resources.

### Virtual Network (VNet)

- **File**: `main.tf`
- **Resource**: `azurerm_virtual_network`
- **Purpose**: Provides a private network for the e-commerce application where resources such as VMs and databases can securely communicate.
- **Importance**: Essential (1)
- **Dependencies**: Must be created within the resource group defined above.
- **Variables**:
  - `vnet_address_space`: Defines the IP address range for the VNet.

### Subnets

- **File**: `main.tf`
- **Resources**: `azurerm_subnet`
  - **control_plane_subnet**: Dedicated subnet for the control plane components, ensuring isolated and secure management operations.
  - **worker_node_subnet**: Dedicated subnet for the worker nodes where the application components are deployed.
- **Purpose**: Segregates the network for organizational and security purposes.
- **Importance**: Essential (1)
- **Dependencies**: Depends on the virtual network.

### Network Security Group (NSG)

- **File**: `main.tf`
- **Resource**: `azurerm_network_security_group`
- **Purpose**: Defines security rules for the network, controlling inbound and outbound traffic to VMs and services.
- **Importance**: Essential (1)
- **Dependencies**: Tied to the subnets and must align with the overall security posture.
- **Security Rules**:
  - **kube-apiserver-rule**: Allows traffic to the Kubernetes API server.
  - **ssh-rule**: Permits SSH access to the cluster for remote management.

### Output Variables

- **File**: `outputs.tf`
- **Purpose**: Outputs the IDs and names of the created resources, which are necessary for referencing these resources in other parts of the Terraform configuration or for external use.
- **Importance**: High (2)
- **Details**:
  - `vnet_id`: The ID of the created VNet.
  - `control_plane_subnet_id`: The ID of the control plane subnet.
  - `worker_node_subnet_id`: The ID of the worker node subnet.
  - `networking_resource_group_name`: The name of the resource group where networking resources are provisioned.
  - `aks_nsg_id`: The ID of the Network Security Group.

### Input Variables

- **File**: `variables.tf`
- **Purpose**: Allows customization of the networking module by defining variables that can be passed to the Terraform configuration.
- **Importance**: High (2)
- **Details**: Includes descriptions and default values for the resource group name, location, and VNet address space.

## Steps to Provision the Networking Infrastructure

1. **Initialization**: Run `terraform init` in the root directory to initialize the Terraform workspace.
2. **Configuration**: Update the `terraform.tfvars` with the desired values for the input variables.
3. **Planning**: Execute `terraform plan` to review the proposed changes to your infrastructure.
4. **Application**: Apply the configuration with `terraform apply` to create the networking infrastructure.
5. **Validation**: Use the output variables to validate the creation of the networking components.

By following these steps, you will have a secure and scalable network infrastructure on Azure, ready to support the demands of your e-commerce application.


## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
