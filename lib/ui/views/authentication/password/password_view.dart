import 'package:barter/ui/providers/authentication/password/password_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordProvider = StateNotifierProvider((_) => Password());

class PasswordView extends StatefulWidget {
  @override
  _PasswordViewState createState() => _PasswordViewState();
}

class _PasswordViewState extends State<PasswordView> {
  bool _passwordVisible = false;

  void _togglePassword() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter password"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: PasswordBody(
          passwordVisible: _passwordVisible,
          togglePasswordVisibility: _togglePassword,
        ),
      ),
    );
  }
}

class PasswordBody extends ConsumerWidget {
  final bool? passwordVisible;
  final VoidCallback? togglePasswordVisibility;

  PasswordBody({Key? key, this.passwordVisible, this.togglePasswordVisibility})
      : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // var state = watch(passwordProvider.state);
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            obscureText: !this.passwordVisible!,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(this.passwordVisible!
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: togglePasswordVisibility,
              ),
            ),
          ),
          const SizedBox(height: 40),
          RaisedButton(
            child: Text(
              "Log In",
              style: TextStyle(fontSize: 16, letterSpacing: .5),
            ),
            textColor: Colors.white,
            onPressed: () {},
            elevation: 0,
          ),
          const SizedBox(height: 10),
          FlatButton(
            onPressed: () {},
            child: Text("Forgot password"),
          ),
        ],
      ),
    );
  }
}
