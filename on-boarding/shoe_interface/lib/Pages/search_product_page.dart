import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoe_interface/Components/product_card.dart';
import 'package:shoe_interface/Pages/home_page.dart';

class SearchProductPage extends StatefulWidget {
  const SearchProductPage({super.key});

  @override
  State<SearchProductPage> createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  double priceRange = 60.0;

  final List<Product> products = [
    Product(
      title: "Derby Leather Shoes",
      description: "A classic and versatile footwear option.",
      category: "Men's shoe",
      price: 120.0,
      image: "assets/images/shoe.jpg",
    ),
    Product(
      title: "Casual Sneakers",
      description: "Comfortable sneakers for everyday wear.",
      category: "Men's shoe",
      price: 80.0,
      image: "assets/images/shoe.jpg",
    ),
  ];

  @override
  void initState() {
    super.initState();
    searchController.text = "Leather";
  }

  @override
  void dispose() {
    searchController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              '/home',
              
            );
          },
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF3F51F3), size: 20),
        ),
        title: Text(
          "Search Product",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF3E3E3E),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Bar Section
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF666666),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFFFFFFF),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xFFD9D9D9)),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 9,
                      ),
                      suffixIcon: Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF3F51F3),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                // Filter Icon
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xFF4F46E5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.filter_list, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          // Product Results
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  // Product Cards
                  ...products.map(
                    (product) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/details',
                            arguments: product,
                          );
                        },
                        child: ProductCard(product: product),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Filter Section
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Category Filter
                        Text(
                          "Category",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color(0xFF000000),
                          ),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          controller: categoryController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFF8F8F8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xFFD9D9D9)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        // Price Filter
                        Text(
                          "Price",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color(0xFF000000),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.zero,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Color(0xFF3F51F3),
                              inactiveTrackColor: Color(0xFFD9D9D9),
                              thumbColor: Color(0xFF3F51F3),
                              overlayColor: Color(0xFF3F51F3).withOpacity(0.2),
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 12,
                              ),
                              trackHeight: 5,
                            ),
                            child: Slider(
                              value: priceRange,
                              min: 0,
                              max: 100,
                              onChanged: (value) {
                                setState(() {
                                  priceRange = value;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        // Apply Button
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              print("Apply Filters");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF3F51F3),
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "APPLY",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xFFFFFFFF),
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
          ),
        ],
      ),
    );
  }
}
