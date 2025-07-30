import 'package:flutter/material.dart';
import '../Pages/add_product_page.dart';
import '../Pages/details_page.dart';
import '../Pages/home_page.dart';
import '../Pages/search_product_page.dart';

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
      initialRoute: '/home',
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case '/home':
            page = HomePage();
            break;
          case '/add_product':
            page = AddProductPage(product: settings.arguments as Product?);
            break;
          case '/details':
            page = DetailsPage(product: settings.arguments as Product);
            break;
          case '/search':
            page = const SearchProductPage();
            break;
          default:
            page = HomePage();
        }

        // Use default MaterialPageRoute without custom transitions
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => page,
        );
      },
    );
  }
}
