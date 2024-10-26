abstract class HomeState {}

final class InitHomeState extends HomeState {}

final class CheckconnectionState extends HomeState {}
//Permisssions
final class PermissionDeniedState extends HomeState {}

final class PermissionPermanentlyDeniedState extends HomeState {}

final class RequestPermissionState extends HomeState {}

//Init MapController
final class GoogleMapControllerInitializedState extends HomeState {}

//Enable Location
final class RequestEnableLocationState extends HomeState {}

//Get Location Success
final class RequestGetLocationSuccessState extends HomeState {}
//Get Location Failure
final class RequestGetLocationFailureState extends HomeState {
  final String message;
  RequestGetLocationFailureState({required this.message});
}

//Move To My Location Success
final class MoveToCurrentLocationState extends HomeState{}
//Move To My Location Failure
final class LocationNotAvailableState extends HomeState{}

//change Type Map
final class ChangeMapTypeSucess extends HomeState{}