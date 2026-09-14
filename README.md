# DriveVault 🚗

DriveVault is a small Flutter Web car gallery created as a practical CI/CD learning project.

The application is intentionally kept small so the main focus is on understanding Git, GitHub, CI, CD, testing, deployment, and rollback.

## 🚘 Project Features

- Responsive Flutter Web interface
- Premium dark automotive design
- Car search
- Car category filtering
- Favorite car interaction
- Three featured cars
- Simple and lightweight application

## 🛠️ Technologies

- Flutter
- Dart
- Git
- GitHub
- GitHub Actions

## 💻 Run Locally

Clone the repository:

~~~bash
git clone https://github.com/midhung-kurup/drivevault.git
cd drivevault
~~~

Install dependencies:

~~~bash
flutter pub get
~~~

Run the web application:

~~~bash
flutter run -d chrome
~~~

## 🧪 Local Validation

The application is currently validated locally using:

~~~bash
flutter analyze
flutter test
flutter build web
~~~

All three checks currently pass successfully.

## 🔄 CI/CD Roadmap

This project is being developed as a practical CI/CD learning exercise.

### CI

The CI pipeline will automatically:

1. Checkout the source code
2. Set up Flutter
3. Install dependencies
4. Run static analysis
5. Run automated tests
6. Build the Flutter Web application

### CD

The CD pipeline will:

1. Build the production Web application
2. Deploy the application
3. Make the updated version available online

### Rollback

A rollback exercise will demonstrate how to return the application to a previously working version using Git.

## 📌 Project Status

- [x] Flutter application created
- [x] Responsive car gallery
- [x] Search and category filtering
- [x] Favorite interaction
- [x] Three featured cars
- [x] Git repository initialized
- [x] GitHub repository created
- [x] Initial version pushed to GitHub
- [x] Flutter analysis passing
- [x] Flutter tests passing
- [x] Flutter Web build passing
- [ ] CI workflow
- [ ] CD workflow
- [ ] Deployment
- [ ] CI failure exercise
- [ ] Rollback exercise