part of 'authentication_bloc.dart';

class AuthenticationEvent extends Equatable {
  const AuthenticationEvent({
    this.isLoading,
    this.isAuthorized,
    this.displayUIState,
  });
  final bool? isLoading;
  final bool? isAuthorized;
  final AuthenticationUIState? displayUIState;

  @override
  List<Object> get props => [];
}

class OnForceLogoutEvent extends AuthenticationEvent {
  const OnForceLogoutEvent();
}

class OnInitAuthenticationEvent extends AuthenticationEvent {
  const OnInitAuthenticationEvent();
}
