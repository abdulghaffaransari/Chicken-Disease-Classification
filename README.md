
---

# 🐔 Chicken Disease Classification

**An end-to-end deep learning pipeline for real-time chicken disease detection from fecal images. This project integrates with cloud services for scalable deployment, providing an accessible API for both training and inference.**

---

## 🔗 Project Repository

Clone the project with the following command:

```bash
git clone https://github.com/abdulghaffaransari/Chicken-Disease-Classification.git
cd Chicken-Disease-Classification
```

---

## 🚀 Project Overview

This project is built to automate the process of identifying diseases in chickens by analyzing fecal images. Leveraging Convolutional Neural Networks (CNNs) and cloud deployment on AWS and Azure, it provides a flexible and scalable solution for real-time classification tasks, complete with training and inference capabilities.

The web application is powered by Flask, and the entire machine learning pipeline is managed by DVC (Data Version Control) for reproducibility. The project also supports CI/CD with GitHub Actions, making it a fully production-ready application for industrial use cases in poultry farming and veterinary diagnostics.

---

## 🗂️ Project Structure

```plaintext
.
├── .github/workflows           # GitHub Actions workflows for CI/CD
├── artifacts                   # Storage for pipeline artifacts
│   ├── data_ingestion          # Ingested image data
│   ├── prepare_base_model      # Model architecture and weights
│   ├── prepare_callbacks       # Callbacks for model training
│   └── training                # Trained model files
├── config                      # Configuration files for the pipeline
├── logs                        # Logging for each stage of the pipeline
├── research                    # Jupyter Notebooks for experimentation
├── src                         # Source code for the pipeline and utilities
│   ├── cnnClassifier           # Core package for CNN model and utilities
│   │   ├── components          # Modular components for pipeline stages
│   │   ├── config              # Configuration manager
│   │   ├── constants           # Project constants
│   │   ├── entity              # Entity classes for structured data
│   │   └── pipeline            # Scripts for pipeline stages
├── templates                   # HTML templates for Flask app
├── app.py                      # Flask app for API endpoints
├── Dockerfile                  # Docker configuration
├── dvc.yaml                    # DVC pipeline stages and dependencies
├── main.py                     # Entry point for running the pipeline
└── requirements.txt            # Python dependencies
```

---

## 🧩 Key Features

- **Automated Pipeline**: Uses DVC to manage data and model versioning across stages.
- **Real-Time API**: Flask-based API provides endpoints for both training and prediction, accessible locally or through cloud deployment.
- **Dockerized Deployment**: The application is containerized with Docker for easy deployment on AWS and Azure.
- **Scalable Cloud Deployment**: Integrates AWS EC2 and ECR for a production-ready environment, with the option for Azure deployment.
- **CI/CD Integration**: Automated testing, building, and deployment using GitHub Actions.

---

## 🛠️ Getting Started

### Prerequisites

- **Python 3.12**
- **Conda** for environment management
- **Docker** for containerization
- **AWS Account** with EC2 and ECR access, or Azure for deployment

### Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/abdulghaffaransari/Chicken-Disease-Classification.git
   cd Chicken-Disease-Classification
   ```

2. **Set up Conda Environment**

   ```bash
   conda create -n cnncls python=3.12 -y
   conda activate cnncls
   ```

3. **Install Dependencies**

   ```bash
   pip install -r requirements.txt
   ```

4. **Run the Application**

   ```bash
   python app.py
   ```

5. **Access the Web App**  
   Open your browser and navigate to `http://localhost:80`.

### Running the DVC Pipeline

1. **Initialize DVC**:
   ```bash
   dvc init
   ```

2. **Reproduce Pipeline**:
   ```bash
   dvc repro
   ```

3. **Visualize Pipeline**:
   ```bash
   dvc dag
   ```

---

## 🧩 Flask API Endpoints

1. **Homepage**:
   - **URL**: `/`
   - **Method**: GET
   - **Description**: Renders the home page (`index.html`).

2. **Train Model**:
   - **URL**: `/train`
   - **Method**: POST or GET
   - **Description**: Triggers the DVC pipeline for model training.
   - **Response**: Returns a message indicating successful training.

3. **Predict**:
   - **URL**: `/predict`
   - **Method**: POST
   - **Description**: Accepts a base64-encoded image as input, decodes it, and returns the classification result.
   - **Body**:
     ```json
     { "image": "<base64_encoded_image>" }
     ```
   - **Response**: JSON object with the prediction result.

---

## ⚙️ AWS Deployment Guide

### AWS Services Used

- **EC2**: Hosts the Dockerized Flask application.
- **ECR**: Stores the Docker image for the application.

### Deployment Steps

1. **IAM User with Required Policies**:
   - `AmazonEC2ContainerRegistryFullAccess`
   - `AmazonEC2FullAccess`

2. **Docker Image Build and Push**:
   - The GitHub Actions workflow builds the Docker image and pushes it to ECR.

3. **EC2 Instance Launch**:
   - Launch an EC2 instance with Docker installed.
   - Pull the image from ECR and deploy the containerized app.

4. **Environment Variables (GitHub Secrets)**:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `AWS_REGION`
   - `AWS_ECR_LOGIN_URI`
   - `ECR_REPOSITORY_NAME`

---

## 🔄 CI/CD Pipeline

The GitHub Actions workflow file `.github/workflows/main.yaml` includes:

- **Linting**: Ensures code quality.
- **Unit Tests**: Verifies functionality of individual components.
- **Docker Build and Push**: Builds the Docker image and pushes it to AWS ECR.
- **Continuous Deployment**: Pulls the latest Docker image to EC2 and starts the application.

---

## Logging and Monitoring

- **Logs**: Stored in the `logs` directory for debugging and tracking progress.
- **Monitoring**: Recommended to integrate with monitoring tools like CloudWatch for AWS or Azure Monitor for production environments.

---

## Future Improvements

- **Model Optimization**: Experiment with hyperparameter tuning for better accuracy.
- **Scalability**: Add load balancing for handling multiple requests simultaneously.
- **Enhanced UI**: Develop a more comprehensive web interface for easier image uploads and result visualization.

---

## 📝 License

This project is licensed under the MIT License.

---

## 🤝 Acknowledgments

Thanks to all contributors and open-source libraries that helped in building this project.

---