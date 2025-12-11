# Restaurants Social Mobile App

A Flutter mobile application that combines social networking features with restaurant discovery using Google Maps API and Firebase. Users can discover nearby restaurants, select their dining preferences, and see where their friends are eating.

## Features

### Main Screen
- **Two Tab Navigation**: Switch between Restaurants and Friends tabs
- **Material Design UI**: Modern and intuitive user interface
- **Bottom Navigation Bar**: Easy navigation between major sections

### Restaurants Tab
- **Google Maps Integration**: View a map with your current location
- **Geolocation**: Automatically detect user's current location
- **Restaurant Discovery**: Browse nearby restaurants on the map
- **Restaurant Selection**: Select a restaurant you plan to visit
- **12-Hour Selection Validity**: Restaurant selections automatically expire after 12 hours
- **Expiration Prompts**: Users are prompted to select a new restaurant when previous selection expires

### Friends Tab
- **Friends List**: View your added friends and their current restaurant selections
- **Contact Integration**: Add friends directly from phone contacts
- **Real-time Updates**: See when friends update their restaurant selections
- **Friend Management**: Manage your friends list easily

## Technical Stack

### Framework
- **Flutter**: Cross-platform mobile development framework
- **Dart**: Programming language for Flutter

### Key Dependencies
- **google_maps_flutter**: Google Maps integration for displaying restaurant locations
- **firebase_core**: Firebase initialization and core services
- **firebase_auth**: User authentication and account management
- **firebase_database**: Real-time database for storing user and restaurant data
- **geolocator**: Location services for user geolocation
- **contacts_service**: Contact management for adding friends
- **provider**: State management solution

### Services
- **Google Maps API**: Location-based restaurant discovery
- **Firebase Realtime Database**: Cloud database for user data synchronization
- **Firebase Authentication**: Secure user login and registration

## Project Structure

```
lib/
├── main.dart                 # Application entry point and main UI structure
├── services/
│   ├── firebase_service.dart # Firebase operations and authentication
│   └── restaurant_model.dart # Data models for restaurants and users
├── models/                   # Data structures and models
├── screens/                  # UI screens and pages
├── widgets/                  # Reusable UI components
android/                       # Android-specific configuration
ios/                          # iOS-specific configuration
pubspec.yaml                  # Flutter dependencies and project configuration
```

## Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK
- Android Studio / Xcode
- Google Maps API Key
- Firebase Project Setup

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Subbarao2005/restaurants-social-app.git
   cd restaurants-social-app
   ```

2. **Get dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Create a Firebase project at https://console.firebase.google.com
   - Download and add configuration files (google-services.json for Android, GoogleService-Info.plist for iOS)
   - Enable Firebase Authentication and Realtime Database

4. **Add Google Maps API Key**
   - Get API key from Google Cloud Console
   - Add key to AndroidManifest.xml and Info.plist

5. **Run the application**
   ```bash
   flutter run
   ```

## Usage

### User Registration
1. Launch the app
2. Create an account with email and password
3. Firebase will handle authentication

### Discovering Restaurants
1. Navigate to the "Restaurants" tab
2. Your current location will be automatically detected
3. View nearby restaurants on the map
4. Tap on a restaurant marker for details
5. Click "Go Here" button to select the restaurant

### Managing Friends
1. Navigate to the "Friends" tab
2. Click "Add Friend" to import from contacts
3. Selected contacts will be added as friends
4. View all friends and their current restaurant selections
5. Real-time updates show when friends change their selections

### Selection Expiration
- Restaurant selections remain valid for 12 hours
- After 12 hours, you'll be prompted to select a new restaurant
- Previous selections are archived in the database

## Database Schema

### Users Collection
```
users/
  {userId}/
    email: string
    displayName: string
    photoUrl: string
    createdAt: timestamp
    selected_restaurant:
      id: string
      name: string
      timestamp: ISO8601 string
    friends:
      {friendId}: true
```

### Restaurants Collection
```
restaurants/
  {restaurantId}/
    id: string
    name: string
    address: string
    latitude: number
    longitude: number
    rating: number
    cuisine: string
```

## API Integration

### Google Maps API
- **Places API**: Search for nearby restaurants
- **Maps API**: Display restaurant locations on map
- **Geocoding API**: Convert coordinates to addresses

## Architecture

### Services Layer
- `FirebaseService`: Handles all Firebase operations including authentication, database reads/writes, and 12-hour expiration logic
- `restaurant_model.dart`: Defines data models for Restaurant and User entities with JSON serialization

### UI Layer
- `main.dart`: Main application structure with bottom navigation
- `RestaurantsTab`: Google Maps integration and restaurant selection
- `FriendsTab`: Friends list and management

## Development

### Adding New Features
1. Create new service classes in `lib/services/`
2. Create UI screens in `lib/screens/`
3. Create reusable widgets in `lib/widgets/`
4. Update models in `restaurant_model.dart` as needed

### Testing
- Use `flutter test` for unit and widget tests
- Test Firebase operations with Firebase Emulator
- Test location services with Android Emulator or iOS Simulator

## Troubleshooting

### Common Issues

**Location not detected**
- Ensure location permissions are granted in app settings
- Check that GPS is enabled on device
- Verify Geolocator package is properly initialized

**Firebase connection failed**
- Verify Firebase configuration files are correctly placed
- Check internet connectivity
- Ensure Firebase project is properly set up

**Google Maps not displaying**
- Verify API key is correctly configured
- Check that API key has Maps and Places enabled
- Ensure AndroidManifest.xml and Info.plist are updated

## Contributing

Contributions are welcome! Please follow these steps:
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is open source and available under the MIT License.

## Author

**Subbarao2005** - Created as part of DevProjects by Codementor

## Acknowledgments

- Google Maps Platform for location services
- Firebase for backend infrastructure
- Flutter community for excellent documentation and resources
- DevProjects for the project specification

## Future Enhancements

- [ ] Real-time chat with friends
- [ ] Restaurant reviews and ratings
- [ ] Photo sharing from restaurants
- [ ] Reservation system integration
- [ ] Restaurant recommendation algorithm
- [ ] User profiles with preferences
- [ ] Push notifications for friend updates
- [ ] Offline mode support

## Support

For issues, questions, or suggestions, please open an issue on GitHub.
