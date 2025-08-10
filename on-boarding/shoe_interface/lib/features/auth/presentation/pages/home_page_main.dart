import 'package:flutter/material.dart';

import '../widgets/message_tile.dart';
import '../widgets/story.dart';

class HomePageMain extends StatelessWidget {
  const HomePageMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          padding: const EdgeInsets.all(16),
          onPressed: () {},
          icon: const Icon(Icons.search, size: 40, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex: 1, // Reduced space for Story section
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Story(
                    name: 'Adil',
                    ringColor: Color(0xFFD1960C),
                    bgColor: Color(0xFFFBE8A8),
                  ),
                  Story(
                    name: 'Adil',
                    ringColor: Color(0xFFD1960C),
                    bgColor: Color(0xFFFBE8A8),
                  ),
                  Story(
                    name: 'Adil',
                    ringColor: Color(0xFFD1960C),
                    bgColor: Color(0xFFFBE8A8),
                  ),
                  Story(
                    name: 'Adil',
                    ringColor: Color(0xFFD1960C),
                    bgColor: Color(0xFFFBE8A8),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  
                ),
                child: const SingleChildScrollView(
                  child: Column(
                    children: [
                      MessageTile(),
                      SizedBox(height: 20),
                      MessageTile(),
                      SizedBox(height: 20),
                      MessageTile(),
                      SizedBox(height: 20),
                      MessageTile(),
                      SizedBox(height: 20),
                      MessageTile(),
                      SizedBox(height: 20),
                      MessageTile(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
