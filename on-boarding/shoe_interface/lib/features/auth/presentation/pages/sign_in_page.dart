import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ECOM',
                style: GoogleFonts.caveatBrush(
                  fontWeight: FontWeight.w400,
                  fontSize: 48,
                  color: const Color(0xFF3F51F3),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Sign into your account',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: const Color(0xFF000000),
                ),
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: const Color(0xFF6F6F6F),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: const Color(0xFF888888),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFFAFAFA),
                      hintText: 'ex: jon.smith@email.com',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Password',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: const Color(0xFF6F6F6F),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: const Color(0xFF888888),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFFAFAFA),
                      hintText: '*******',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: double.infinity, // Makes the button full width
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle sign-in logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                          0xFF3D50FF,
                        ), // Customize color to match your image
                        foregroundColor: Colors.white, // Text color
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            20,
                          ), // Rounded corners
                        ),
                        elevation: 0, // Flat look (remove shadow)
                      ),
                      child: Text(
                        'SIGN IN',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 180),
                  Row(
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF888888),
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'SIGNUP',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: const Color(0xFF3F51F3),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
