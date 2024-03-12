import 'package:flutter/material.dart';

class SavedSuggestionsScreen extends StatefulWidget {
  const SavedSuggestionsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SavedSuggestionsScreenState createState() => _SavedSuggestionsScreenState();
}

class _SavedSuggestionsScreenState extends State<SavedSuggestionsScreen> {
  final List<String> _savedSuggestions = [
    'Dota 2',
    'Phasmophobia',
    'Terraria',
    'The Forest',
    'Lethal Company',
    'Left 4 Dead 2'
  ];
  final Set<String> _selectedItems = <String>{}; // Tracks selected items

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Suggestions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _selectedItems.isNotEmpty
                ? _showDeleteConfirmationDialog
                : _showNoItemSelectedSnackbar,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _savedSuggestions.length,
        itemBuilder: (BuildContext context, int index) {
          final item = _savedSuggestions[index];
          return ListTile(
            title: Text(item),
            trailing: _selectedItems.contains(item)
                ? const Icon(Icons.check)
                : null, // Checkmark for selected items
            onTap: () {
              setState(() {
                if (_selectedItems.contains(item)) {
                  _selectedItems.remove(item); // Deselect
                } else {
                  _selectedItems.add(item); // Select
                }
              });
            },
          );
        },
      ),
    );
  }

  void _showDeleteConfirmationDialog() {
    // Generate a message with the names of the selected items.
    final String selectedItemNames = _selectedItems
        .join(', '); // Concatenates all selected item names with a comma.
    final String dialogContent =
        'Are you sure you want to delete the selected items?\n$selectedItemNames';

    showDialog(
      context: context,
      barrierDismissible: false, // Prevents dialog dismissal on outside tap
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Items'),
          content: SingleChildScrollView(
            // Ensures dialog content is scrollable if it gets too long
            child: Text(dialogContent),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () => Navigator.of(context).pop(), // Dismiss dialog
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                setState(() {
                  _savedSuggestions
                      .removeWhere((item) => _selectedItems.contains(item));
                  _selectedItems.clear(); // Clear selection
                });
                Navigator.of(context).pop(); // Dismiss dialog
                Navigator.of(context).pop(); // Go back to the previous screen
              },
            ),
          ],
        );
      },
    );
  }

  void _showNoItemSelectedSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('No Item Selected'),
      ),
    );
  }
}
