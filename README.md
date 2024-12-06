# Rice Leaf Disease Detection and Remedies Suggestions Mobile App using Flutter and Firebase

## Overview

The **Rice Leaf Disease Detection and Remedies Suggestions Mobile App** is built using **Flutter** and **Firebase**. It allows users to upload images of rice leaves, detects any diseases, and suggests potential remedies. The app connects to an API that communicates with the **web app**, ensuring smooth integration between both platforms.

## Features

- **Disease Detection**: Users can upload images of rice leaves to identify diseases.
- **Remedy Suggestions**: Based on the detected disease, the app provides relevant remedies and care instructions.
- **Firebase Integration**: The app uses Firebase for authentication, user data storage, and image uploading.
- **Web App API Connection**: The mobile app interacts with an API connected to the web app for disease detection and remedies suggestions.

## Getting Started

Follow the steps below to set up and run this project on your local machine.

### Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK**: Follow the installation guide [here](https://docs.flutter.dev/get-started/install).
- **Firebase account**: Set up a Firebase project by following the instructions in the Firebase documentation.
- **Android Studio or VS Code**: Recommended IDEs for Flutter development.

### Setup Firebase for the Mobile App

1. **Create a Firebase Project**:
   - Go to the [Firebase Console](https://console.firebase.google.com/).
   - Click **Add Project** and follow the setup instructions.

2. **Enable Firebase Authentication**:
   - In the Firebase console, go to **Authentication** and enable the preferred sign-in method (email/password, Google, etc.).

3. **Enable Firebase Firestore**:
   - Go to **Firestore Database** and set up your database.

4. **Enable Firebase Storage**:
   - Go to **Storage** to enable image upload functionality.

5. **Add Firebase SDK to Your Flutter Project**:
   - Open the `pubspec.yaml` file in your Flutter project and add dependencies for Firebase:
   
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     firebase_core: ^1.10.0
     firebase_auth: ^3.3.4
     cloud_firestore: ^3.1.5
     firebase_storage: ^10.3.5

6.**Configure Firebase for iOS and Android**:
- Follow the **Firebase documentation**for setting up Firebase for both iOS and Android.

## Setting Up the API Connection

The mobile app communicates with an API connected to the web app for disease detection. To set up the API connection:

### Configure API Endpoint:
Set the API URL in the Flutter app to connect to the web app API.

### Add Network Requests:
Use Flutter's `http` package to make API requests to the backend. Add this to the `pubspec.yaml` file:

## The web app API processes the image, detects any disease, and returns a response with disease details and recommended remedies.
Displaying Results:

- The mobile app displays the detected disease and remedy suggestions to the user.

## Technologies Used
- Flutter: Used to build the mobile app.
- Firebase: Used for user authentication, cloud storage, and Firestore database.
- Dart: The programming language used to build the app.
- API: Interacts with a web-based API for disease detection.
Contributing
- Feel free to contribute to this project by submitting issues or pull requests. Here’s how you can contribute:

## Fork the repository.
- Create a new branch (git checkout -b feature-name).
- Make your changes and commit them (git commit -m 'Add feature').
- Push your changes (git push origin feature-name).
- Create a pull request.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

For further questions or suggestions, feel free to reach out or create an issue in the repository. **Happy coding!**
