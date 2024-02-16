import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/features/Auth/presentaion/view_models/cubit/auth_state.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  GoogleSignInAccount? googleUser;
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

  signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  signWithGoogle() async {
    emit(LoginLoadingState());

    try {
      // Trigger the authentication flow
      googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Emit success state after successful authentication
      emit(LoginSuccessState());
    } catch (error) {
      // Handle authentication failure and emit an error state if needed
      emit(LoginFailureState(errorMessage: error.toString()));
      log(error.toString());
    }
  }
}
