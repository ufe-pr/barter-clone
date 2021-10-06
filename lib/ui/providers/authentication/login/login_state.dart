class SignInState {
  final SignInStatus status;
  final SignInMethod method;

  final String message;

  final String email;
  final String phoneNumber;
  final String iso2Code;

  const SignInState(
      {this.message,
      this.status,
      this.method: SignInMethod.PHONE_NUMBER,
      this.email: "",
      this.phoneNumber: "",
      this.iso2Code: "NG"});

  SignInState.loading([SignInState previousState])
      : status = SignInStatus.LOADING,
        email = previousState?.email,
        method = previousState?.method,
        phoneNumber = previousState?.phoneNumber,
        message = previousState?.message,
        iso2Code = previousState?.iso2Code;

  SignInState.error(String error, [SignInState previousState])
      : status = SignInStatus.ERROR,
        method = previousState?.method,
        message = error,
        email = previousState?.email,
        phoneNumber = previousState?.phoneNumber,
        iso2Code = previousState?.iso2Code;

  SignInState.success(this.message, [SignInState previousState])
      : status = SignInStatus.SUCCESS,
        method = previousState?.method,
        email = previousState?.email,
        phoneNumber = previousState?.phoneNumber,
        iso2Code = previousState?.iso2Code;

  SignInState copyWith(
      {String email,
      String phoneNumber,
      SignInMethod method,
      String iso2Code}) {
    return SignInState(
      message: this.message,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      method: method ?? this.method,
      iso2Code: iso2Code ?? this.iso2Code,
      status: this.status,
    );
  }
}

enum SignInMethod { EMAIL, PHONE_NUMBER }

enum SignInStatus { ERROR, LOADING, SUCCESS }
