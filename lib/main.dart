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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
// Validate name and password here
                String name = _nameController.text;
                String password = _passwordController.text;

                if (name.isNotEmpty && password.isNotEmpty) {
                // Authenticate user and navigate to BMI calculator
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BMICalculatorScreen()),
                );
                } else {
                // Show error message or handle invalid credentials
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please enter a valid name and password')),
                );
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),

                );
              },
              child: Text('New Account'),
            ),
          ],
        ),
      ),
    );
  }
}




class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

final TextEditingController _usernameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _emailController = TextEditingController();

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Register'),
    ),
    body: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () {
// Validate username, password, and email here
              String username = _usernameController.text;
              String password = _passwordController.text;
              String email = _emailController.text;

              if (username.isNotEmpty
              && password.isNotEmpty && email.isNotEmpty) {
              // Register user and navigate to login screen
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              );
              } else {
              // Show error message or handle invalid credentials
              ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Please enter valid username, password, and email')),
              );
              }
            },
            child: Text('Continue'),
          ),
          SizedBox(height: 16.0),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back to Your Account'),
          ),
        ],
      ),
    ),
  );
}


// ... signup screen code



class GenderSelectionScreen extends StatefulWidget {
  @override
  _GenderSelectionScreenState createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gender Selection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => selectedGender = 'male'),
                  child: Text('Male'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => selectedGender = 'female'),
                  child: Text('Female'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedGender.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BMIInputScreen(
                        selectedGender: selectedGender,
                      ),
                    ),
                  );
                } else {
                  // Show a message indicating that gender selection is required
                }
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}


class BMIInputScreen extends StatefulWidget {
  final String selectedGender;

  const BMIInputScreen({Key? key, required this.selectedGender}) : super(key: key);

  @override
  _BMIInputScreenState createState() => _BMIInputScreenState();
}

class _BMIInputScreenState extends State<BMIInputScreen> {
  double bodyMass = 0.0;
  double bodyHeight = 0.0;

  final List<double> bodyMassOptions = [40, 50, 60, 70, 80, 90, 100];
  final List<double> bodyHeightOptions = [150, 160, 170, 180, 190, 200];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Input'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField<double>(
              value: bodyMass,
              onChanged: (value) => setState(() => bodyMass = value!),
              items: bodyMassOptions.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Body Mass (kg)'),
            ),
            DropdownButtonFormField<double>(
              value: bodyHeight,
              onChanged: (value) => setState(() => bodyHeight = value!),
              items: bodyHeightOptions.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Body Height (cm)'),
            ),
            ElevatedButton(
              onPressed: () {
                if (bodyMass > 0 && bodyHeight > 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BMIResultScreen(
                        bodyMass: bodyMass,
                        bodyHeight: bodyHeight,
                      ),
                    ),
                  );
                } else {
                  // Show a message indicating that both body mass and height are required
                }
              },
              child: Text('Calculate BMI'),
            ),
          ],
        ),
      ),
    );
  }
}


class BMIResultScreen extends StatelessWidget {
  final double bodyMass;
  final double bodyHeight;

  const BMIResultScreen({Key? key, required this.bodyMass, required this.bodyHeight}) : super(key: key);

  double calculateBMI() {
    final heightInMeters = bodyHeight / 100;
    return bodyMass / (heightInMeters * heightInMeters);
  }

  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Normal';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    final bmi = calculateBMI();
    final category = getBMICategory(bmi);

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your BMI is: ${bmi.toStringAsFixed(2)}'),
            Text('BMI Category: $category'),
          ],
        ),
      ),
    );
  }
}