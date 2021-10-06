class PasswordState {
  final PasswordStatus status;
  final bool _hasAttemptedBiometric;
  bool get hasAttemptedBiometric => _hasAttemptedBiometric ?? false;

  final bool _hasSetUpBiometric;
  bool get hasSetUpBiometric => _hasSetUpBiometric ?? false;

  final String message;

  final String password;

  const PasswordState(
      {hasAttemptedBiometric,
      hasSetUpBiometric,
      this.message,
      this.status,
      this.password: ""})
      : _hasAttemptedBiometric = hasAttemptedBiometric,
        _hasSetUpBiometric = hasSetUpBiometric;

  PasswordState.loading([PasswordState previousState])
      : status = PasswordStatus.LOADING,
        password = previousState?.password,
        _hasAttemptedBiometric = previousState?.hasAttemptedBiometric,
        _hasSetUpBiometric = previousState?.hasSetUpBiometric,
        message = previousState?.message;

  PasswordState.error(String error, [PasswordState previousState])
      : status = PasswordStatus.ERROR,
        message = error,
        _hasAttemptedBiometric = previousState?.hasAttemptedBiometric,
        _hasSetUpBiometric = previousState?.hasSetUpBiometric,
        password = previousState?.password;

  PasswordState.success(this.message, [PasswordState previousState])
      : status = PasswordStatus.SUCCESS,
        _hasAttemptedBiometric = previousState?.hasAttemptedBiometric,
        _hasSetUpBiometric = previousState?.hasSetUpBiometric,
        password = previousState?.password;

  PasswordState copyWith(
      {String password, bool hasSetUpBiometric, bool hasAttemptedBiometric}) {
    return PasswordState(
      password: password ?? this.password,
      status: this.status,
      message: this.message,
      hasSetUpBiometric: hasSetUpBiometric ?? this?.hasSetUpBiometric,
      hasAttemptedBiometric:
          hasAttemptedBiometric ?? this.hasAttemptedBiometric,
    );
  }
}

enum PasswordStatus { ERROR, LOADING, SUCCESS }
