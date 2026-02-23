import 'package:flutter/material.dart';
import 'package:portfolio/portfolio_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFF0A1A1D);
    const primaryCyan = Color(0xFF00D2FF);

    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryCyan,
          brightness: Brightness.dark,
        ).copyWith(
          primary: primaryCyan,
          onPrimary: bgColor,
          surface: const Color(0xFF0E2529),
        ),
        useMaterial3: true,
      ),
      home: const PortfolioScreen(),
    );
  }
}
