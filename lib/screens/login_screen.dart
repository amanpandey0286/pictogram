import 'package:flutter/material.dart';
import 'package:pictogram/Widgets/reusable_text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _email;
  late final TextEditingController _password;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
                child: Container(),
                flex: 2,
              ),
              Text(
                'Pictogram',
                style: TextStyle(fontSize: 40.0),
              ),
              SizedBox(
                height: 120.0,
              ),
              ReusableTextWidget(
                hint: 'Enter Email',
                textController: _email,
                isPass: false,
                keyType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 24.0,
              ),
              ReusableTextWidget(
                  hint: 'Enter Password',
                  textController: _password,
                  isPass: true,
                  keyType: TextInputType.text),
              SizedBox(
                height: 24.0,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Login'),
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {},
                      child: Text(
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
