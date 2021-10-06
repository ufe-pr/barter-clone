import 'package:barter/ui/providers/authentication/create_password/create_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createPasswordProvider = StateNotifierProvider((_) => CreatePassword());

class CreatePasswordView extends StatefulWidget {
  @override
  _CreatePasswordViewState createState() => _CreatePasswordViewState();
}

class _CreatePasswordViewState extends State<CreatePasswordView> {
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
        title: Text("Create account"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: CreatePasswordBody(
          passwordVisible: _passwordVisible,
          togglePasswordVisibility: _togglePassword,
        ),
      ),
    );
  }
}

class CreatePasswordBody extends ConsumerWidget {
  final bool passwordVisible;
  final VoidCallback togglePasswordVisibility;

  CreatePasswordBody(
      {Key key, this.passwordVisible, this.togglePasswordVisibility})
      : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var state = watch(createPasswordProvider.state);
    var provider = context.read(createPasswordProvider);
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            obscureText: !this.passwordVisible,
            onChanged: provider.updatePassword,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(this.passwordVisible
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: togglePasswordVisibility,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _ValidationConditionWidget(
            condition: "One uppercase character",
            conditionMet: state.hasUpperCase,
          ),
          _ValidationConditionWidget(
            condition: "One lowercase character",
            conditionMet: state.hasLowerCase,
          ),
          _ValidationConditionWidget(
            condition: "One number",
            conditionMet: state.hasNumber,
          ),
          _ValidationConditionWidget(
            condition: "One special character",
            conditionMet: state.hasSpecialChar,
          ),
          _ValidationConditionWidget(
            condition: "At least 8 characters",
            conditionMet: state.hasMinLength,
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

class _ValidationConditionWidget extends StatelessWidget {
  final bool conditionMet;
  final String condition;

  const _ValidationConditionWidget(
      {Key key, @required this.conditionMet, @required this.condition})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 24,
            child: Icon(
              conditionMet ? Icons.check_circle : Icons.radio_button_off,
              color: conditionMet ? Colors.green.shade900 : Colors.black,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(condition)),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 16),
    );
  }
}
