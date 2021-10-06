import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'signup_state.dart';

class SignUp extends StateNotifier<SignUpState> {
  SignUp() : super(SignUpState());

  /// Attempts to register a user on the platform.
  ///
  /// All fields are required.
  Future<void> signUp(
      {String email,
      String iso2Code,
      String phoneNumber,
      String referralCode}) async {
    state = SignUpState.loading(state); // Update state so button gets disabled

    // TODO: Perform processing of details from API

    state = SignUpState.success("User registered successfully");
    // TODO: Navigate to next page
  }
}
