import 'package:flutter/material.dart';
import 'package:realestate_project/widgets/property_item.dart';

class FullListScreen extends StatefulWidget {
  final List<Map<String, dynamic>> allItems;
  final String title;

  const FullListScreen({
    super.key,
    required this.allItems,
    required this.title,
  });

  @override
  _FullListScreenState createState() => _FullListScreenState();
}

class _FullListScreenState extends State<FullListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: widget.allItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: PropertyItem(
              data: widget.allItems[index],
              onFavoriteToggle: (itemData, isFavorited) {
                // Dummy function
              },
            ),
          );
        },
      ),
    );
  }
}
