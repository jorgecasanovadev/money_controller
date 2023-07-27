// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

enum AuthenticationUIState {
  signIn,
  signUp,
}

class AuthenticationState extends Equatable {
  final bool isLoading;
  final bool isAuthorized;
  final AuthenticationUIState displayUIState;

  const AuthenticationState({
    this.displayUIState = AuthenticationUIState.signUp,
    this.isLoading = false,
    this.isAuthorized = true,
  });

  AuthenticationState copyWith({
    bool? isLoading,
    AuthenticationUIState? displayUIState,
    bool? isAuthorized,
  }) {
    return AuthenticationState(
      isLoading: isLoading ?? this.isLoading,
      isAuthorized: isAuthorized ?? this.isAuthorized,
      displayUIState: displayUIState ?? this.displayUIState,
    );
  }

  @override
  List<Object> get props => [isLoading, isAuthorized, displayUIState];
}
