import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final passwordProvider = StateNotifierProvider((_) => Password());

class ConfirmAccountView extends StatefulWidget {
  @override
  _ConfirmAccountViewState createState() => _ConfirmAccountViewState();
}

class _ConfirmAccountViewState extends State<ConfirmAccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm your details"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: ConfirmAccountBody(),
      ),
    );
  }
}

class ConfirmAccountBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // var state = watch(passwordProvider.state);
    return Form(
      child: DefaultTextStyle.merge(
        textAlign: TextAlign.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Enter the 6-digit code sent to email@email.com and +2348131234567.",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            // TODO: Change to pin code fields text field
            TextFormField(),
            const SizedBox(height: 40),
            RaisedButton(
              child: Text(
                "Confirm details",
                style: TextStyle(fontSize: 16, letterSpacing: .5),
              ),
              textColor: Colors.white,
              onPressed: () {},
              elevation: 0,
            ),
            const SizedBox(height: 100),
            const Text(
                "By signing up, you agree to our Terms and Conditions and Privacy Policy."),
          ],
        ),
      ),
    );
  }
}
