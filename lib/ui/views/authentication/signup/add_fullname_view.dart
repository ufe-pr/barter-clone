import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final passwordProvider = StateNotifierProvider((_) => Password());

class AddFullNameView extends StatefulWidget {
  @override
  _AddFullNameViewState createState() => _AddFullNameViewState();
}

class _AddFullNameViewState extends State<AddFullNameView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create an account"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: AddFullNameBody(),
      ),
    );
  }
}

class AddFullNameBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // var state = watch(passwordProvider.state);
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Kindly enter your First and Last name",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 30),
          TextFormField(
            decoration: InputDecoration(labelText: "Full name"),
          ),
          const SizedBox(height: 40),
          RaisedButton(
            child: Text(
              "Continue",
              style: TextStyle(fontSize: 16, letterSpacing: .5),
            ),
            textColor: Colors.white,
            onPressed: () {},
            elevation: 0,
          ),
        ],
      ),
    );
  }
}
