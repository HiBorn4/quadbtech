import 'package:flutter/material.dart';

import '../model/show.dart';

class DetailsScreen extends StatelessWidget {
  final Show show;

  const DetailsScreen({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: show.imageUrl != null
                  ? Image.network(
                      show.imageUrl!,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      color: Colors.grey,
                      child: const Center(
                        child: Icon(Icons.image, size: 50),
                      ),
                    ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    show.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (show.genres.isNotEmpty)
                    Wrap(
                      spacing: 8,
                      children: show.genres
                          .map((genre) => Chip(
                                label: Text(genre),
                                backgroundColor: Colors.red,
                              ))
                          .toList(),
                    ),
                  const SizedBox(height: 16),
                  Text(
                    show.summary ?? 'No summary available',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  if (show.rating != null)
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        const SizedBox(width: 8),
                        Text(
                          '${show.rating}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}