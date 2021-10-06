import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'password_state.dart';

class Password extends StateNotifier<PasswordState> {
  Password() : super(PasswordState());

  /// Signs the user in with the provided password.
  Future<void> loginWithPassword(String password) async {
    // Update state so button gets disabled
    state = PasswordState.loading(state);

    // TODO: Perform processing of details from API

    state = PasswordState.success("Signed in.");
    // TODO: Navigate to next page
  }

  /// Attempts to sign the user in using biometric details.
  ///
  /// Does nothing if user hasn't set up biometric security.
  Future<void> loginWithBiometric() async {
    if (!state.hasSetUpBiometric) return;
    // Update state so button gets disabled
    state = PasswordState.loading(state);

    // TODO: Perform processing of details from API

    state = PasswordState.success("Signed in.");
    // TODO: Navigate to next page
  }

  /// Initializes the state. Sets [hasSetUpBiometric].
  Future<void> initialize() async {}
}
