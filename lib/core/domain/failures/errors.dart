class UnexpectedError extends Error {
  UnexpectedError(this.message);

  final String message;

  @override
  String toString() {
    const explanation =
        'Encountered a failure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $message');
  }
}
