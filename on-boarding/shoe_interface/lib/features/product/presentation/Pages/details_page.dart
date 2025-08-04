import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

class DetailsPage extends StatefulWidget {
  final Product product;
  const DetailsPage({super.key, required this.product});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int selectedSize = 41;
  List<int> sizes = [39, 40, 41, 42, 43, 44];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Back button and product image
          Container(
            clipBehavior: Clip.antiAlias,
            height: 250,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    // margin: EdgeInsets.only(top: 40),
                    child: Image.asset(
                      widget.product.image,
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
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: 
                          () =>
                              Navigator.pushReplacementNamed(context, '/name'),
                      icon: const Icon(
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
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category and Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product.category,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFAAAAAA),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '(4.0)',
                          style: GoogleFonts.sora(
                            fontSize: 16,
                            color: const Color(0xFFAAAAAA),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                // Product name and Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product.title,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: const Color(0xFF3E3E3E),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\$${widget.product.price}',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: const Color(0xFF3E3E3E),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Size selection
                Text(
                  'Size:',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: const Color(0xFF3E3E3E),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
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
                              margin:  const EdgeInsets.only(right: 12),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? const Color(0xFF3F51F3)
                                        : const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color:
                                      isSelected
                                          ? const Color(0xFF3F51F3)
                                          : const Color(0xFFFFFFFF),
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
                const SizedBox(height: 20),
                // Product Description
                Text(
                  widget.product.description,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xFF666666),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // Bottom action buttons
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // Handle delete action
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFFFF1313)),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'DELETE',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xFFFF1313),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/add_product',
                              arguments: widget.product,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3F51F3),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'UPDATE',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xFFFFFFFF),
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
