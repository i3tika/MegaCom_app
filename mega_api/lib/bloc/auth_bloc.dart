import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


import '../auth_repo.dart';
import '../models/send_code_models.dart';
import '../models/send_phone_models.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.repo}) : super(AuthInitial()) {
    on<SendPhoneEvent>((event, emit) async {
      try {
        final model = await repo.sendPhone(phoneName: event.phoneNumber);
        emit(AuthSucces(model: model));
      } catch (e) {
        emit(AuthError());
      }
    });
    on<SendCodeEvent>((event, emit) async {
      try {
        final model = await repo.sendCode(code: event.code);
        emit(AuthCodeSucces(model: model));
      } catch (e) {
        emit(AuthError());
      }
    });
  }
  final AuthRepo repo;
}
