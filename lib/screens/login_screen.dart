import 'package:flutter/material.dart';
import 'package:pictogram/Widgets/reusable_text_widget.dart';
import 'package:pictogram/screens/home_screen.dart';
import 'package:pictogram/screens/register_screen.dart';
import 'package:pictogram/services/auth_methods.dart';
import 'package:pictogram/utils/utility.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  bool _loading = false;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _navigateToRegister() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()),
        (route) => false);
  }

  void _toLogin() async {
    setState(() {
      _loading = true;
    });

    final res = await AuthMethods()
        .loginUser(email: _email.text, password: _password.text);
    if (res == 'Success') {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    } else {
      showSnackBar(context, res.toString());
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Screen',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),
              const Text(
                'Pictogram',
                style: TextStyle(fontSize: 40.0),
              ),
              const SizedBox(
                height: 120.0,
              ),
              ReusableTextWidget(
                hint: 'Enter Email',
                textController: _email,
                isPass: false,
                keyType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 24.0,
              ),
              ReusableTextWidget(
                  hint: 'Enter Password',
                  textController: _password,
                  isPass: true,
                  keyType: TextInputType.text),
              const SizedBox(
                height: 24.0,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Login'),
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                      onPressed: _navigateToRegister,
                      child: const Text(
                        'Register',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
