part of 'pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final String _correctUsername =
      'correct_username'; // Replace with actual username for validation
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  void _validateUsername(BuildContext context) {
    if (_usernameController.text == _correctUsername) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PasswordPage(_passwordController)),
      );
    } else {
      // Show an error message using ScaffoldMessenger
      _scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text('Invalid username')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key:
          _scaffoldMessengerKey, // Assign the GlobalKey to the ScaffoldMessenger
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign in'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                children: [
                  FlutterLogo(size: 50), // Smaller Flutter logo
                  SizedBox(width: 10),
                  Text(
                    'Stormguards',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Email, phone, or Skype',
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 10),
                  Expanded(
                    child: FilledButton(
                      onPressed: () => _validateUsername(context),
                      child: Text('Next'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordPage extends StatelessWidget {
  final TextEditingController _passwordController;

  PasswordPage(this._passwordController);

  void _login(BuildContext context) {
    // Add your login logic here
    context.go("/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              children: [
                FlutterLogo(size: 50), // Smaller Flutter logo
                SizedBox(width: 10),
                Text(
                  'Stormguards',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _login(context),
              child: Text('Sign in'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
