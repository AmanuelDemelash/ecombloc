abstract class Usecase<Type, Props> {
  Future<Type> call(Props? props);
}
