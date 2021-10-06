import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create an account"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SignUpBody(
            // emailController: _emailController,
            // phoneNumberController: _phoneNumberController,
            // onCountryChanged: _onCountryChange,
            // selectedCountryIso: _selectedCountry,
            ),
      ),
    );
  }
}

class SignUpBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: "Email address"),
          ),
          const SizedBox(height: 24),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Phone number",
              prefixIcon: Center(
                widthFactor: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide()),
                  ),
                  margin: const EdgeInsets.only(right: 8),
                  child: DropdownButton(
                    isDense: true,
                    underline: SizedBox(),
                    value: "NG",
                    items: [
                      DropdownMenuItem(child: Text("+234"), value: 'NG'),
                      DropdownMenuItem(child: Text("+233"), value: 'GH'),
                      DropdownMenuItem(child: Text("+254"), value: 'KE'),
                      DropdownMenuItem(child: Text("+1"), value: 'US'),
                      DropdownMenuItem(child: Text("+44"), value: 'GB'),
                      DropdownMenuItem(child: Text("+256"), value: 'UG'),
                    ],
                    onChanged: (dynamic _) {},
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          TextFormField(
            decoration: InputDecoration(labelText: "Referral code (optional)"),
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
