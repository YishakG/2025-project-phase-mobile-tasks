import 'package:flutter/material.dart';

import 'features/product/presentation/Pages/add_product_page.dart';
import 'features/product/presentation/Pages/details_page.dart';
import 'features/auth/presentation/pages/home_page_main.dart';
import 'features/product/presentation/Pages/product_page.dart';
import 'features/product/presentation/Pages/search_product_page.dart';
import 'features/auth/presentation/pages/sign_in_page.dart';
import 'features/auth/presentation/pages/sign_up_page.dart';
import 'features/auth/presentation/pages/splash_screen.dart';

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
            page = const HomePageMain();
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
          case '/signin':
            page = const SignInPage();
          case '/signup':
            page = const SignUpPage();
          case '/splash':
            page = const SplashScreen();
          case '/product':
            page = ProductPage();

          default:
            page = const SplashScreen();
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
