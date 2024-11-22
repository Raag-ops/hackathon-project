part of 'app navigation bloc.dart';

/// Represents the state of AppNavigation in the application.
// ignore_for_file: must_be_immutable
class AppNavigationState extends Equatable {
AppNavigationState({this.appNavigationModelObjf});
AppNavigationModel? appNavigationModelObj;

@override
List<Object?> get props => [appNavigationModelObj];
AppNavigationState copyWith({AppNavigationModel? appNavigationModelObj}) {
return AppNavigationState(
  appNavigationModelObj:
  appNavigationModelObj ?? this.appNavigationModelObj,
);
}
}
