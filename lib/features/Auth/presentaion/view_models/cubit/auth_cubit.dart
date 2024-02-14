import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/features/Auth/presentaion/view_models/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  login({required String emailAddress, required String password}) async {
    emit(LoginLoadingState());
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'invalid-credential') {
        emit(LoginFailureState(errorMessage: 'User not found'));
      } else if (ex.code == 'invalid-email') {
        emit(LoginFailureState(errorMessage: 'Invalid email'));
      } else if (ex.code == 'wrong-password') {
        emit(LoginFailureState(errorMessage: 'Wrong password'));
      } else if (ex.code == 'network-request-failed') {
        emit(LoginFailureState(errorMessage: 'No internet connection'));
      } else {
        emit(LoginFailureState(errorMessage: 'something went wrong !'));
      }
    } catch (ex) {
      emit(LoginFailureState(errorMessage: ex.toString()));
    }
  }

  //////////////////////
  register({required String emailAddress, required String password}) async {
    emit(RegisterLoadingState());
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password);
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(RegisterFailureState(errorMessage: 'The password is too week'));
      } else if (ex.code == 'email-already-in-use') {
        emit(RegisterFailureState(errorMessage: 'The account already exists'));
      } else if (ex.code == 'network-request-failed') {
        emit(RegisterFailureState(errorMessage: 'No internet connection'));
      } else if (ex.code == 'invalid-email') {
        emit(RegisterFailureState(errorMessage: 'invalid-email'));
      }
    } catch (ex) {
      emit(RegisterFailureState(errorMessage: ex.toString()));
    }
  }
}
