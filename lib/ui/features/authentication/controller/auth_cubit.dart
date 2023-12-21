import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lexi_learn/core/api/api_constant.dart';
import 'package:meta/meta.dart';

import '../models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  String gender = '';
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      getUserData(userId: value.user!.uid);
      ApiConstant.userId = value.user!.uid;
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }

  void logout() {
    emit(LoadingState());
    FirebaseAuth.instance.signOut().then((value) {
      emit(LogoutSuccessState());
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }

  void userRegister(
      {required String email,
      required String password,
      required String name,
      required int age}) {
    emit(LoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      createUser(email: email, name: name, uId: value.user!.uid, age: age);
      ApiConstant.userId = value.user!.uid;
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }

  void createUser({
    required String email,
    required String name,
    required int age,
    required String uId,
  }) {
    UserModel userModel = UserModel(
      name: name,
      email: email,
      age: age,
      gender: gender,
    );
    emit(LoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toJson())
        .then((value) {
      getUserData(userId: uId);
      emit(CreateUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }

  UserModel? userModel;
  void getUserData({required String userId}) {
    emit(LoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data()!);

      print(userModel!.email);

      emit(GetUserDataSuccessState());
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }

  // File? profilePhoto;
  // final picker = ImagePicker();
  //
  // Future<void> getProfileImage() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     profilePhoto = File(pickedFile.path);
  //     emit(PickProfileImageSuccessState());
  //   } else {
  //     print('No Image Selected');
  //     emit(FailureState(error: 'error'));
  //   }
  // }

  // void uploadImage({
  //   String? name,
  //   String? email,
  //   String? phone,
  //   String? address,
  // }) {
  //   firebase_storage.FirebaseStorage.instance
  //       .ref()
  //       .child('users/${Uri.file(profilePhoto!.path).pathSegments.last}')
  //       .putFile(profilePhoto!)
  //       .then((p0) {
  //     p0.ref.getDownloadURL().then((value) {
  //       updateUserData(
  //           name: name,
  //           profileImage: value,
  //           address: address,
  //           phone: phone,
  //           email: email);
  //       emit(UploadProfileImageSuccessState());
  //     });
  //   }).catchError((error) {
  //     emit(FailureState(error: error.toString()));
  //   });
  // }

  void updateUserData({
    String? name,
    String? email,
    String? phone,
    String? address,
    String? profileImage,
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
      gender: address,
      age: 10,
    );
    emit(LoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(ApiConstant.userId)
        .update(model.toJson())
        .then((value) {
      getUserData(userId: ApiConstant.userId);
      emit(UpdateUserDataSuccessState());
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }
}
