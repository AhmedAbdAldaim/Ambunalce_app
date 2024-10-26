import 'package:ambulance/data/model/order_abunalce_model.dart';

abstract class AmbunalceRequestState {}

final class AmbunalceRequestInitial extends AmbunalceRequestState {}

final class ChangeServiceTypeState extends AmbunalceRequestState {}
final class ChangeStatusTypeState extends AmbunalceRequestState {}
final class ChangeSectorTypeState extends AmbunalceRequestState {}

final class LoadingAmbunalceRequestState extends AmbunalceRequestState {}

final class SuccessAmbunalceRequestState extends AmbunalceRequestState {
  final OrderAmbunlaceModel model;
  SuccessAmbunalceRequestState(this.model);
}

final class FailureAmbunalceRequestState extends AmbunalceRequestState {
  final String message;
  FailureAmbunalceRequestState({required this.message});
}
