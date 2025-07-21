import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int selectedSize = 41;
  List<int> sizes = [39, 40, 41, 42, 43, 44];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Back button and product image
          Container(
            clipBehavior: Clip.antiAlias,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    // margin: EdgeInsets.only(top: 40),
                    child: Image.asset(
                      "assets/images/shoe.jpg",
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Back Button
                Positioned(
                  top: 40,
                  left: 24,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                        color: Color(0xFF3F51F3),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Product Details (MOVED OUTSIDE THE STACK)
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category and Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Men's Shoe",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFAAAAAA),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(
                          "(4.0)",
                          style: GoogleFonts.sora(
                            fontSize: 16,
                            color: Color(0xFFAAAAAA),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5),
                // Product name and Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Derby Leather",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: Color(0xFF3E3E3E),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "\$120",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Color(0xFF3E3E3E),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Size selection
                Text(
                  "Size:",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Color(0xFF3E3E3E),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        sizes.map((size) {
                          bool isSelected = size == selectedSize;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 12),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? Color(0xFF3F51F3)
                                        : Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color:
                                      isSelected
                                          ? Color(0xFF3F51F3)
                                          : Color(0xFFFFFFFF),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  size.toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color:
                                        isSelected
                                            ? Colors.white
                                            : Colors.black,

                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ),
                SizedBox(height: 20),
                // Product Description
                Text(
                  "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // Bottom action buttons
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // Handle delete action
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Color(0xFFFF1313)),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "DELETE",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Color(0xFFFF1313),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle update action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF3F51F3),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "UPDATE",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
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
