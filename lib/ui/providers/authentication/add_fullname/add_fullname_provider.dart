import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'add_fullname_state.dart';

class AddFullName extends StateNotifier<AddFullNameState> {
  AddFullName() : super(AddFullNameState());

  void updateName(String name) {}
}
