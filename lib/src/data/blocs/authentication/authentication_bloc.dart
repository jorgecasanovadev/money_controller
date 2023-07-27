import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      // { required this.sessionBloc,
      // required this.internetConnectionBloc, }
      )
      : super(const AuthenticationState()) {
    on<AuthenticationEvent>((event, emit) {
      emit(
        state.copyWith(
          isLoading: event.isLoading,
          isAuthorized: event.isAuthorized,
          displayUIState: event.displayUIState,
        ),
      );
    });

    on<OnInitAuthenticationEvent>((event, emit) {
      // emit(const AuthenticationState());
      emit(
        state.copyWith(
          isLoading: false,
          isAuthorized: false,
          displayUIState: AuthenticationUIState.signIn,
        ),
      );
    });

    on<OnForceLogoutEvent>(
      (event, emit) {
        emit(
          state.copyWith(
            isLoading: false,
            isAuthorized: false,
            displayUIState: AuthenticationUIState.signUp,
          ),
        );
      },
    );
  }

  //{"route":"/home","newUser": "true"}
}
