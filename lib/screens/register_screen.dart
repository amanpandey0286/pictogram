import 'package:flutter/material.dart';
import 'package:pictogram/Widgets/reusable_text_widget.dart';
import 'package:pictogram/services/auth_methods.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _bio;

  @override
  void initState() {
    _name = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _bio = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _bio.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Screen'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
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
              height: 24.0,
            ),
            SizedBox(
              width: 120,
              child: Stack(
                children: [
                  const CircleAvatar(
                    minRadius: 60.0,
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blueAccent),
                      child: IconButton(
                        iconSize: 20,
                        onPressed: () {},
                        icon: const Icon(Icons.add_a_photo_rounded),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 36.0,
            ),
            ReusableTextWidget(
                hint: 'Enter Your Name',
                textController: _name,
                isPass: false,
                keyType: TextInputType.name),
            const SizedBox(
              height: 16.0,
            ),
            ReusableTextWidget(
                hint: 'Enter Your Email',
                textController: _email,
                isPass: false,
                keyType: TextInputType.emailAddress),
            const SizedBox(
              height: 16.0,
            ),
            ReusableTextWidget(
                hint: 'Enter Bio',
                textController: _bio,
                isPass: false,
                keyType: TextInputType.text),
            const SizedBox(
              height: 16.0,
            ),
            ReusableTextWidget(
                hint: 'Enter Password',
                textController: _password,
                isPass: true,
                keyType: TextInputType.text),
            const SizedBox(
              height: 24.0,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Register')),
            Flexible(
              flex: 2,
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already a user?'),
                TextButton(
                    onPressed: () {
                      AuthMethods().registerUser(
                          email: _email.text,
                          password: _password.text,
                          name: _name.text,
                          bio: _bio.text);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      )),
    );
  }
}
