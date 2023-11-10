import 'package:flutter/material.dart';

class FavouritPage extends StatelessWidget {
  const FavouritPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(23.0),
      child: Column(
        children: [
          Text(
            'Watch List',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
