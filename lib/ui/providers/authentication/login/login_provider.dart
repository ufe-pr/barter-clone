import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login_state.dart';

class Login extends StateNotifier<SignInState> {
  Login() : super(SignInState());

  Future<void> signIn(
      {String iso2Code, String phoneNumber, String email}) async {
    switch (state.method) {
      case SignInMethod.PHONE_NUMBER:
        _signInWithPhoneNumber(iso2Code, phoneNumber);
        break;
      case SignInMethod.EMAIL:
        _signInWithEmail(email);
        break;
      default:
        state = SignInState.error(
            "Something happened. Please close the app and try again", state);
    }
  }

  void updateMethod(SignInMethod method) {
    state = state.copyWith(method: method);
  }

  Future<void> _signInWithPhoneNumber(
      String iso2Code, String phoneNumber) async {
    state = SignInState.loading(state);

    // TODO: Perform processing of details from API

    state = SignInState.success("User signed in successfully");
    // TODO: Navigate to next page // Update state so button gets disabled
  }

  Future<void> _signInWithEmail(String email) async {
    state = SignInState.loading(state);

    // TODO: Perform processing of details from API

    state = SignInState.success("User signed in successfully");
    // TODO: Navigate to next page // Update state so button gets disabled
  }
}
