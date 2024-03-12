import 'package:flutter/material.dart';

class SavedSuggestionsScreen extends StatefulWidget {
  const SavedSuggestionsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SavedSuggestionsScreenState createState() => _SavedSuggestionsScreenState();
}

class _SavedSuggestionsScreenState extends State<SavedSuggestionsScreen> {
  // Sample list of items. Ideally, this list would be passed from the first screen or managed globally.
  final List<String> _savedSuggestions = ['Dota 2', 'Phasmophobia', 'Terraria', 'The Forest', 'Lethal Company', 'Left 4 Dead 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Suggestions'),
      ),
      body: ListView.builder(
        itemCount: _savedSuggestions.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_savedSuggestions[index]),
            onTap: () => _showConfirmationDialog(context, index),
          );
        },
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, int index) {
    // Disabling barrierDismissible will prevent the dialog from closing when tapping outside of it.
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Remove Item'),
          content: const Text('Do you want to remove this item?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss dialog
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                setState(() {
                  _savedSuggestions.removeAt(index);
                });
                Navigator.of(context).pop(); // Dismiss dialog
              },
            ),
          ],
        );
      },
    );
  }
}
