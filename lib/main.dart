import 'package:flutter/material.dart';
import 'package:custfyp/login_page.dart';
import 'package:custfyp/create_page.dart';
import 'package:custfyp/dashboard_com.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Teacher's Pet",
      routes: {
        '/createAccount': (context) => const Scaffold(
          body: CreatePage(),
        ),
        '/login': (context) => const Scaffold(
          body: LoginPage(),
        ),
        '/home': (context) => const Scaffold(
          body: Dashboard(),
        ),
      },
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Call the navigate function in initState to navigate after 5 seconds
    navigateToLoginPage(context);
  }

  // Define a function to navigate to the login page after a delay
  void navigateToLoginPage(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF7F00FF),
              Color(0xFFE100FF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Teacher\'s Pet!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.white, // Text color
                ),
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // Indicator color
              ),
            ],
          ),
        ),
      ),
    );
  }
}
