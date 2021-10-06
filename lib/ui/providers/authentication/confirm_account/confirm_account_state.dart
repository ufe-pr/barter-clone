class ConfirmAccountState {
  final ConfirmAccountStatus? status;

  final String? message;

  final String? pinCode;

  const ConfirmAccountState({this.message, this.status, this.pinCode: ""});

  ConfirmAccountState.loading([ConfirmAccountState? previousState])
      : status = ConfirmAccountStatus.LOADING,
        pinCode = previousState?.pinCode,
        message = previousState?.message;

  ConfirmAccountState.error(String error, [ConfirmAccountState? previousState])
      : status = ConfirmAccountStatus.ERROR,
        message = error,
        pinCode = previousState?.pinCode;

  ConfirmAccountState.success(this.message, [ConfirmAccountState? previousState])
      : status = ConfirmAccountStatus.SUCCESS,
        pinCode = previousState?.pinCode;

  ConfirmAccountState copyWith({String? password}) {
    return ConfirmAccountState(
      pinCode: password ?? this.pinCode,
      status: this.status,
      message: this.message,
    );
  }
}

enum ConfirmAccountStatus { ERROR, LOADING, SUCCESS }
