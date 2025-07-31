abstract class Failure {
  final String message;
  const Failure(this.message);
}

class GeneralFailure extends Failure {
  GeneralFailure(super.message);
}
