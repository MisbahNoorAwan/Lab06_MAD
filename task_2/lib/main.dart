import 'package:flutter/material.dart';
import 'list.dart';

const Color pastelPink = Color(0xFFFFCAD4);
const Color pastelMint = Color(0xFFB8F2E6);
const Color pastelLavender = Color(0xFFCBAACB);
const Color pastelPeach = Color(0xFFFFDCB8);
const Color pastelSkyBlue = Color(0xFFA1CFFF);
const Color pastelYellow = Color(0xFFFDFD96);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation and Actions',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: pastelLavender, // AppBar background and FloatingActionButton
          onPrimary: Color.fromARGB(255, 50, 49,
              49), // AppBar title and icon color, ensure it's visible on `primary`
          secondary:
              Color.fromARGB(255, 50, 49,
              49), // Used for floating action button when it needs to contrast with `primary`
          onSecondary: Color.fromARGB(255, 255, 255,
              255), // For text/icons on `secondary`, white for contrast
          surface: Color.fromARGB(255, 255, 255,
              255), // Cards, Sheets, Menus background color, using white for light theme
          onSurface: Color.fromARGB(255, 50, 49,
              49), // Text/icons on `surface`, dark for contrast with light `surface`
          background: Colors
              .white, // Scaffold's background color, white for light theme
          onBackground: Color.fromARGB(255, 50, 49,
              49), // Text color in Scaffold, dark for readability on white background
          error: Colors.red, // Default unchanged, used for indicating errors
          onError: Colors.white, // Text/icons on `error`, white for contrast
        ),

        // Optionally customize the AppBarTheme if needed
        appBarTheme: const AppBarTheme(
          color: pastelLavender, // Custom AppBar color
          iconTheme: IconThemeData(
              color: Color.fromARGB(255, 50, 49, 49)), // AppBar icon theme
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 50, 49, 49), // AppBar title color
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default TextTheme.
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0),
          displayMedium: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          displaySmall: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SavedSuggestionsScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            // Shape definition
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(0), // Rounded corners with radius of 20
            ),
          ),
          child: const Text('Go to Saved Suggestions'),
        ),
      ),
    );
  }
}
