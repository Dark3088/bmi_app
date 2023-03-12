import 'dart:ffi';

class InputException implements FormatException {
  @override
  final String message;

  InputException(this.message);

  @override
  String toString() => "Input Exception: $message ";

  @override
  // TODO: implement offset
  int? get offset => throw UnimplementedError();

  @override
  // TODO: implement source
  get source => throw UnimplementedError();
}
