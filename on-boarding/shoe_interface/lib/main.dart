import 'package:flutter/material.dart';
import 'features/product/presentation/Pages/add_product_page.dart';
import 'features/product/presentation/Pages/details_page.dart';
import 'features/product/presentation/Pages/home_page.dart';
import 'features/product/presentation/Pages/search_product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/search': (context) => const SearchProductPage(),
        '/add_product': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          if (args == null || args is Product?) {
            return AddProductPage(product: args as Product?);
          }
          return HomePage(); // fallback
        },
        '/details': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          if (args is Product) {
            return DetailsPage(product: args);
          }
          return HomePage(); // fallback
        },
      },
    );
  }
}
