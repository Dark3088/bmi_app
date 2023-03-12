class InputException implements FormatException {
  @override
  final String message;

  InputException(this.message);

  @override
  String toString() => "Input Exception: $message ";

  @override
  int? get offset => throw UnimplementedError();

  @override
  get source => throw UnimplementedError();
}
