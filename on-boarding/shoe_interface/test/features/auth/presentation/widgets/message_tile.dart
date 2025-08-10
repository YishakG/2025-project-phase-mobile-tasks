import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(3), // This controls the border thickness
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black, // Change to your preferred border color
                width: 3.0, // Border thickness
              ),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.yellow[200],
              radius: 24, // You can increase this if needed
              backgroundImage: const AssetImage(
                'assets/images/iconImage.png',
              ), // <-- Your PNG path
            ),
          ),
          const SizedBox(width: 13.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'John Abraham',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF000E08),
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '2 min ago',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF797C7B),
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Hey! Can you join the meeting?',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF797C7B),
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
