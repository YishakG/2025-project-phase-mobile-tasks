import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/girlsImage.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Image.asset(
              'assets/images/bluetheme.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 130,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(bottom: 20) ,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/Ecom.png', // Make sure this matches your file name
                      width: 150, // Adjust based on design
                    ),
                  ),
               Text('ECOMMERCE APP',
               style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 40,
                  color: Colors.white,
               ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
