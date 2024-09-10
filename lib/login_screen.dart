import 'package:flutter/material.dart';
import 'package:testing/home_screen.dart';
import 'package:testing/validator.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //elevation: 0,
        //surfaceTintColor: Colors.transparent,
        forceMaterialTransparency: true,
        centerTitle: true,
        title: const Text('Login Screen'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                key: const ValueKey('email_id'),
                decoration: const InputDecoration(hintText: 'Enter Email Id'),
                validator: (value) => Validator.validateEmail(value ?? " "),
              ),
              TextFormField(
                controller: _passwordController,
                key: const ValueKey('password'),
                decoration:
                    const InputDecoration(hintText: 'Enter your password'),
                validator: (value) => Validator.validatePassword(value ?? " "),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                // This for simple login screen testing
                // onPressed: () {
                //   _formKey.currentState?.validate();
                // },

                // This is for Integration testing
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
