import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'create_password_state.dart';

class CreatePassword extends StateNotifier<CreatePasswordState> {
  CreatePassword() : super(CreatePasswordState());

  void createPassword(String password) {}

  void updatePassword(String newValue) {
    state = state.copyWith(password: newValue);
  }
}
