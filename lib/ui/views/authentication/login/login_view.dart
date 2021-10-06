import 'package:barter/ui/providers/authentication/login/login_provider.dart';
import 'package:barter/ui/providers/authentication/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = StateNotifierProvider((_) => Login());

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  TabController? _tabController;
  TextEditingController? _emailController, _phoneNumberController;
  String? _selectedCountry;

  @override
  void initState() {
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _tabController = TabController(length: 2, vsync: this);
    var login = context.read(loginProvider);

    // Add listener to update the state when tabs are changed
    _tabController!.addListener(() {
      var method = _tabController!.index == 0
          ? SignInMethod.PHONE_NUMBER
          : SignInMethod.EMAIL;
      login.updateMethod(method);
    });
    super.initState();
  }

  void _onCountryChange(String value) {
    setState(() {
      _selectedCountry = value;
      print("Rebuilt");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: AppBarTitle(),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kTextTabBarHeight),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.symmetric(horizontal: BorderSide(width: .5)),
            ),
            child: TabBar(
              controller: _tabController,
              // labelStyle: textTheme.bodyText1,
              // labelColor: textTheme.bodyText2.color,
              tabs: [
                Tab(
                  text: "Phone number",
                ),
                Tab(
                  text: "Email",
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: LoginBody(
          emailController: _emailController,
          phoneNumberController: _phoneNumberController,
          onCountryChanged: _onCountryChange,
          selectedCountryIso: _selectedCountry,
        ),
      ),
    );
  }
}

class AppBarTitle extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(loginProvider);

    String text = "Sign in";
    switch (state.method) {
      case SignInMethod.EMAIL:
        text = "What's your email?";
        break;
      case SignInMethod.PHONE_NUMBER:
        text = "What's your number?";
        break;
    }

    return Text(text);
  }
}

class LoginBody extends ConsumerWidget {
  final TextEditingController? emailController, phoneNumberController;
  final ValueChanged<String> onCountryChanged;
  final String? selectedCountryIso;

  LoginBody(
      {Key? key,
      required this.selectedCountryIso,
      required this.emailController,
      required this.phoneNumberController,
      required this.onCountryChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(loginProvider);

    // Build display text string
    String baseText =
        "Whether you're returning or creating a new account. Let's start with your ";
    String additionalText = "details";
    switch (state.method) {
      case SignInMethod.PHONE_NUMBER:
        additionalText = "phone number";
        break;
      case SignInMethod.EMAIL:
        additionalText = "email";
        break;
    }
    final String text = baseText + additionalText + ".";

    // Build text fields
    var emailField = TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: "Enter email address",
      ),
    );
    var phoneNumberField = TextFormField(
      controller: phoneNumberController,
      decoration: InputDecoration(
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
              value: this.selectedCountryIso ?? 'NG',
              items: [
                DropdownMenuItem(child: Text("+234"), value: 'NG'),
                DropdownMenuItem(child: Text("+233"), value: 'GH'),
                DropdownMenuItem(child: Text("+254"), value: 'KE'),
                DropdownMenuItem(child: Text("+1"), value: 'US'),
                DropdownMenuItem(child: Text("+44"), value: 'GB'),
                DropdownMenuItem(child: Text("+256"), value: 'UG'),
              ],
              onChanged: (String? v) {
                if (v != null) onCountryChanged(v);
              },
            ),
          ),
        ),
        labelText: "Enter phone number",
      ),
    );

    var fieldToDisplay = state.method == SignInMethod.PHONE_NUMBER
        ? phoneNumberField
        : emailField;

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
          const SizedBox(height: 20.0 * 2),
          fieldToDisplay,
          const SizedBox(height: 20),
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
