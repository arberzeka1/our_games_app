# our_games_task

Our Game Task
# Crispy Bacon

## Description

This project is a mobile application that showcases a list of games and provides additional features such as pagination, detailed game information, and a filter for specifying price ranges. The application utilizes the Dio library and follows the BLoC pattern for managing data flow and state management. One notable feature of the app is its offline functionality, allowing users to access previously loaded games even when offline. This is achieved using the Hive package, a local database that offers fast performance compared to other alternatives.

## Features

- Game List: The main screen displays a list of games, with pagination functionality to load additional games in batches of 25 items.

- Game Details: Tapping on a game from the list opens a detailed page, providing more information about the selected game.

- Price Filter: Users can filter the list of games by specifying a price range, allowing for easy customization based on their preferences.

- Offline Support: The application can be used offline, as it leverages the Hive package to store game data locally. This ensures that previously loaded games are accessible even without an internet connection.

## Technologies and Patterns Used

- Dio: The Dio library is used for making HTTP requests and handling API communication. It provides a convenient way to fetch game data from a remote server.

- BLoC Pattern: The BLoC (Business Logic Component) pattern is employed for managing the data flow and state management within the application. This architectural pattern promotes separation of concerns and improves code organization.

- Hive: Hive is a local database package used to store game data on the user's device. It offers faster performance compared to other local database options, making it an ideal choice for this project's requirements.



## Acknowledgments

- [Dio Library](https://pub.dev/packages/dio)
- [BLoC Pattern](https://bloclibrary.dev/)
- [Hive Package](https://pub.dev/packages/hive)