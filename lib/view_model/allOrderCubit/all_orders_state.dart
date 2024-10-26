
abstract class AllOrdersState {}

final class AllOrdersInitial extends AllOrdersState {}

final class ChangePasswordVisableState extends AllOrdersState {}

final class LoadingAllOrdersState extends AllOrdersState {}

final class SuccessAllOrdersState extends AllOrdersState {}

final class FailureAllOrdersState extends AllOrdersState {
  final String message;
  FailureAllOrdersState({required this.message});
}
