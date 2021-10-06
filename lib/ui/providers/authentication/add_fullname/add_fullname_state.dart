class AddFullNameState {
  final AddFullNameStatus? status;

  final String? message;

  final String? fullName;

  const AddFullNameState(
      {hasAttemptedBiometric,
      hasSetUpBiometric,
      this.message,
      this.status,
      this.fullName: ""});

  AddFullNameState.loading([AddFullNameState? previousState])
      : status = AddFullNameStatus.LOADING,
        fullName = previousState?.fullName,
        message = previousState?.message;

  AddFullNameState.error(String error, [AddFullNameState? previousState])
      : status = AddFullNameStatus.ERROR,
        message = error,
        fullName = previousState?.fullName;

  AddFullNameState.success(this.message, [AddFullNameState? previousState])
      : status = AddFullNameStatus.SUCCESS,
        fullName = previousState?.fullName;

  AddFullNameState copyWith({String? password}) {
    return AddFullNameState(
      fullName: password ?? this.fullName,
      status: this.status,
      message: this.message,
    );
  }
}

enum AddFullNameStatus { ERROR, LOADING, SUCCESS }
