# Vehicle Management App

A vehicle management android application built using Flutter. This project provides a comprehensive solution for managing vehicle  data, booking, services, and maintenance schedules.

## Features
- **User Hierarchy**: Admin, Driver and User each have 3 different homepages for reflecting their work.
- **Authentications**: User authentication and navigation to homepage based on their role.
- **Vehicle Booking**: Users can raise a booking request for a vehicle by filling a form.
- **Vehicle Data Management**: Add, edit, and track vehicle details.
- **Refueling and maintenance**: Drivers can raise a refueling or maintenance request by providing necessary details.

## Technologies Used

- **Flutter**: For Android application development.
- **Firebase**: Backend support for data storage and user authentication.
- **Google Maps**: To ease the booking process for users by picking a location or searching by keyword on map.
- **REST**: For using REST Api services (e.g. google directions api for searching route between two places)

### Prerequisites

- Flutter SDK
- Dart Programming Language

## Note
You will need to make the following files -
- `.env` contains PLACES_API_KEY=YOUR_GOOGLEMAPS_API_KEY
- `android/secrets.properties` contains MAPS_API_KEY=YOUR_GOOGLEMAPS_API_KEY

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## License

This project is licensed under the [GNU GENERAL PUBLIC LICENSE](LICENSE).

