import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Story extends StatelessWidget {
  final String? name;
  final String? url;
  final Color bgColor;
  final Color ringColor;

  const Story({
    super.key,
    required this.name,
    this.url,
    required this.bgColor,
    required this.ringColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue, // Blue background matching the image
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Outer ring
          Container(
            height: 93,
            width: 93,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ringColor,
              

              // Changed to orange
            ),
            child: Center(
              // Middle transparent blue ring (optional, adjust opacity)
              child: Container(
                height: 85,
                width: 85,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Center(
                  // Inner yellow center
                  child: Container(
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: bgColor,
                       image: const DecorationImage(
                        image: AssetImage('assets/images/iconImage.png'),
                        fit: BoxFit.cover,
                      ), // Yellow center
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$name',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
