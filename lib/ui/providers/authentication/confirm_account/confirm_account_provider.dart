import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'confirm_account_state.dart';

class ConfirmAccount extends StateNotifier<ConfirmAccountState> {
  ConfirmAccount() : super(ConfirmAccountState());

  void confirm(String pinCode) {}

  void resendPinCodeWithWhatsApp() {}

  void resendPinCodeWithSMS() {}
}
