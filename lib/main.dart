import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget
{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{
  @override
  void initState()
  {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnboardingScreen())));
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: const Image(image: AssetImage('Assets/Images/BMI Logo.jpg'), height: 300),
            ),

            const SizedBox(height: 20),

            const Text(
              'BMI Calculator',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingScreen extends StatefulWidget
{
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
{
  int currentIndex = 0;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: PageView.builder(
        itemCount: 2,
        itemBuilder: (context, index)
        {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('Assets/Animations/Animation - 1725998685894.json'),

                const SizedBox(height: 40),

                currentIndex == 1 ? const Text('The Benefits of Knowing Your BMI', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22)) : const Text('Welcome to BMI Calculator', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22)),

                const SizedBox(height: 20),

                currentIndex == 0 ? const SizedBox.shrink() : const Text('Assess your overall health\nIdentify potential health risks\nSet realistic weight management goals', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15)),
              ],
            ),
          );
        },

        onPageChanged: (index) => setState(() => currentIndex = index),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          if (currentIndex == 1)
          {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
          }

          else
          {
            setState(() => currentIndex++);
          }
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget
{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return const Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            ],
          ),
        ),
      ),
    );
  }
}

// ... signup screen code


class HomeScreen extends StatefulWidget
{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  double bmi = 0.0;
  String bmiCategory = '';

  // ... logic to retrieve BMI and category from shared preferences or Firebase

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your BMI: $bmi',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              'BMI Category: $bmiCategory',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BMICalculatorScreen()),
                );
              },
              child: const Text('Calculate BMI'),
            ),

            ElevatedButton(
              onPressed: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BMIHistoryScreen()),
                );
              },
              child: const Text('View BMI History'),
            ),
          ],
        ),
      ),
    );
  }
}


class BMICalculatorScreen extends StatefulWidget
{
  const BMICalculatorScreen({super.key});

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen>
{
  double height = 0.0;
  double weight = 0.0;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Height input field
            // Weight input field
            ElevatedButton(
              onPressed: ()
              {
                // Calculate BMI and navigate to Home Screen
              },
              child: const Text('Calculate BMI'),
            ),
          ],
        ),
      ),
    );
  }
}

class BMIHistoryScreen extends StatefulWidget
{
  const BMIHistoryScreen({super.key});

  @override
  State<BMIHistoryScreen> createState() => _BMIHistoryScreenState();
}

class _BMIHistoryScreenState extends State<BMIHistoryScreen>
{
  // ... logic to retrieve BMI history from shared preferences or Firebase
  List<dynamic> bmiHistory = [];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI History'),
      ),
      body: ListView.builder(
        itemCount: bmiHistory.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('BMI: ${bmiHistory[index]}'),
            // ... display other relevant information
          );
        },
      ),
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
