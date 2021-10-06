class SignUpState {
  final SignUpStatus? status;

  final String? message;

  final String? email;
  final String? referralCode;
  final String? phoneNumber;
  final String? iso2Code;

  const SignUpState(
      {this.message,
      this.status,
      this.email: "",
      this.referralCode: "",
      this.phoneNumber: "",
      this.iso2Code: "NG"});

  SignUpState.loading([SignUpState? previousState])
      : status = SignUpStatus.LOADING,
        email = previousState?.email,
        referralCode = previousState?.referralCode,
        phoneNumber = previousState?.phoneNumber,
        message = previousState?.message,
        iso2Code = previousState?.iso2Code;

  SignUpState.error(String error, [SignUpState? previousState])
      : status = SignUpStatus.ERROR,
        message = error,
        email = previousState?.email,
        referralCode = previousState?.referralCode,
        phoneNumber = previousState?.phoneNumber,
        iso2Code = previousState?.iso2Code;

  SignUpState.success(String message, [SignUpState? previousState])
      : status = SignUpStatus.SUCCESS,
        message = message,
        email = previousState?.email,
        referralCode = previousState?.referralCode,
        phoneNumber = previousState?.phoneNumber,
        iso2Code = previousState?.iso2Code;

  SignUpState copyWith(
      {String? email,
      String? phoneNumber,
      String? referralCode,
      String? iso2Code}) {
    return SignUpState(
      message: this.message,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      referralCode: referralCode ?? this.referralCode,
      iso2Code: iso2Code ?? this.iso2Code,
      status: this.status,
    );
  }
}

enum SignUpStatus { ERROR, LOADING, SUCCESS }
