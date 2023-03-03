part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
}

class AuthInitial extends AuthState {}

class AuthSucces extends AuthState {
  final SendPhoneModel model;

  AuthSucces({required this.model});
}

class AuthError extends AuthState {}

class AuthLouding extends AuthState {}

class AuthCodeSucces extends AuthState {
  final SendCodeModel model;

  AuthCodeSucces({required this.model});
}