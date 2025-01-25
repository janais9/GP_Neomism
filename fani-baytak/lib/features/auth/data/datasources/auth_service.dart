import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neomsim/core/helpers/constant.dart';
import 'package:neomsim/core/helpers/firebase_helper.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/features/auth/data/models/user_model.dart';
import 'package:neomsim/features/auth/domain/entities/user_entity.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Register user by email and password
  Future<UserModel> registerUser({
    required String firstName,
    required String lastName,
    String? image,
    required String email,
    required String? password,
    required UserType type, // admin, customer
    required String mobileNumber,
    required Gender gender, // male, female
  }) async {
    try {
      UserModel userModel = UserModel(
        firstName: firstName,
        lastName: lastName,
        image: image,
        email: email,
        type: type,
        mobileNumber: mobileNumber,
        gender: gender,
      );
      // Create a user in FirebaseAuth
      if (password != null) {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        userModel = userModel.copyWith(
          id: userCredential.user!.uid,
        );

        // Prepare user data to store in Firestore

        // Store additional user data in Firestore
        await FirebaseHelper.postData(
          collection: userCollection,
          data: userModel.toJson(),
          doc: userCredential.user!.uid,
          updateUserImage: true,
        );
        AppController.instance.setLoggedIn(true);

        await userCredential.user!.updateDisplayName('$firstName $lastName');
      } else {
        await FirebaseHelper.putData(
          collection: userCollection,
          documentId: FirebaseAuth.instance.currentUser?.uid ?? '',
          data: userModel.toJson(),
          updateUserImage: true,
        );
      }
      return userModel;

      // Optionally, you can also update Firebase Auth profile
    } on FirebaseAuthException catch (e) {
      throw Exception('Registration failed: ${e.message}');
    }
  }

  Future<UserModel> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      // Create a user in FirebaseAuth
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store additional user data in Firestore
      DocumentSnapshot<Map<String, dynamic>> result = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      UserModel userModel = UserModel.fromJson(result.data() ?? {});
      return userModel;
    } on FirebaseAuthException catch (e) {
      throw Exception('Registration failed: ${e.message}');
    }
  }
}
