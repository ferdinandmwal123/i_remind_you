import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bloc/bloc.dart';
import 'package:i_remind_you/domain/auth/i_auth_facade.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final IAuthFacade iAuthFacade;
  SignInBloc(this.iAuthFacade) : super(SignInState.initial());

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    yield* event.map(signInWithGooglePressed: (e) async* {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );
      final signIn = await iAuthFacade.signInWithGoogle();
      yield state.copyWith(
        isSubmitting: false,
        authFailureOrSuccessOption: some(signIn),
      );
    });
  }
}
