import 'package:barter/core/extensions/string/validators.dart';

class CreatePasswordState {
  final CreatePasswordStatus? status;
  final String? message;
  final String? password;

  CreatePasswordState({this.status, this.password: "", this.message});

  CreatePasswordState.loading([CreatePasswordState? previousState])
      : status = CreatePasswordStatus.LOADING,
        password = previousState?.password,
        message = previousState?.message;

  CreatePasswordState.error(String error, [CreatePasswordState? previousState])
      : status = CreatePasswordStatus.ERROR,
        message = error,
        password = previousState?.password;

  CreatePasswordState.success(this.message, [CreatePasswordState? previousState])
      : status = CreatePasswordStatus.SUCCESS,
        password = previousState?.password;

  CreatePasswordState copyWith({String? password}) {
    return CreatePasswordState(
      password: password ?? this.password,
      status: this.status,
      message: this.message,
    );
  }

  bool? _hasUpperCase;
  bool? get hasUpperCase {
    _hasUpperCase ??= password!.containsUpper();
    return _hasUpperCase;
  }

  bool? _hasLowerCase;
  bool? get hasLowerCase {
    _hasLowerCase ??= password!.containsLower();
    return _hasLowerCase;
  }

  bool? _hasNumber;
  bool? get hasNumber {
    _hasNumber ??= password!.containsNumber();
    return _hasNumber;
  }

  bool? _hasSpecialChar;
  bool? get hasSpecialChar {
    _hasSpecialChar ??= password!.containsSpecialChar();
    return _hasSpecialChar;
  }

  bool? _hasMinLength;
  bool? get hasMinLength {
    _hasMinLength ??= password!.length >= 8;
    return _hasMinLength;
  }
}

enum CreatePasswordStatus { ERROR, LOADING, SUCCESS }
