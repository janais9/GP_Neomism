import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:neomsim/core/network/failure.dart';
import 'package:neomsim/core/routes/common_import.dart';
import 'package:neomsim/features/auth/data/models/user_model.dart';
import '../../my_app.dart';
import '../widgets/session_expired_dialog.dart';
import 'helper_function.dart';

class FirebaseHelper {
  static FirebaseFirestore? _firestore;
  static FirebaseAuth? _auth;
  static FirebaseStorage? _storage;

  // Initialize Firebase instances
  static init() {
    _firestore = FirebaseFirestore.instance;
    _auth = FirebaseAuth.instance;
    _storage = FirebaseStorage.instance;
  }

  // Ensure FirebaseFirestore is initialized
  static FirebaseFirestore get firestoreInstance {
    if (_firestore == null) {
      throw Exception(
          "Firestore has not been initialized. Call FirebaseHelper.init()");
    }
    return _firestore!;
  }

  // Ensure FirebaseAuth is initialized
  static FirebaseAuth get authInstance {
    if (_auth == null) {
      throw Exception(
          "FirebaseAuth has not been initialized. Call FirebaseHelper.init()");
    }
    return _auth!;
  }

  // Get Firebase token for authenticated user
  static Future<String> _getFirebaseToken() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return await user.getIdToken() ?? '';
    } else {
      throw ServerFailure('User is not authenticated.');
    }
  }

  static Future<String> uploadFile({
    required File file,
    required String userId,
    required String folderName,
  }) async {
    try {
      // Generate a unique file name
      String fileName =
          'business_images/$folderName/${DateTime.now().millisecondsSinceEpoch}_$userId.jpg';

      // Upload the file to Firebase Storage
      TaskSnapshot snapshot = await _storage!.ref(fileName).putFile(file);

      // Get the download URL after upload is complete
      String downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }

  // Get data from Firestore based on query
  static Future<QuerySnapshot<Map<String, dynamic>>> getData({
    required String collection,
    String whereField = '',
    dynamic whereValue,
    bool needFilter = false,
  }) async {
    try {
      // log('needFilter && (whereField.isNotEmpty && whereValue.isNotEmpty) ${needFilter && (whereField.isNotEmpty && whereValue.isNotEmpty)}');
      QuerySnapshot<Map<String, dynamic>> snapshot;
      if (needFilter && (whereField.isNotEmpty && whereValue != null)) {
        snapshot = await firestoreInstance
            .collection(collection)
            .where(whereField, isEqualTo: whereValue)
            .get();
      } else {
        snapshot = await firestoreInstance.collection(collection).get();
      }
      return snapshot;
    } on FirebaseException catch (e) {
      _logFirebaseError(e);
      throw ServerFailure.fromFirebaseException(e);
    } catch (e) {
      if (e is ServerFailure) throw ServerFailure(e.message);
      _logGenericObject(e);
      throw ServerFailure('An unknown error occurred: $e');
    }
  }

  static Future<void> postData({
    required String collection,
    required Map<String, dynamic> data,
    String? doc,
    bool updateUserImage = false,
  }) async {
    try {
      String id = firestoreInstance.collection(collection).doc().id;

      log('finallllllll data $data');
      await firestoreInstance.collection(collection).doc(doc ?? id).set({
        'id': id,
        ...data,
      });
    } on FirebaseException catch (e) {
      _logFirebaseError(e);
      if (e.code == 'permission-denied') {
        _handleTokenExpiry();
      }
      throw ServerFailure.fromFirebaseException(e);
    } on Exception catch (e) {
      _logGenericException(e);
      throw ServerFailure(e.toString());
    } catch (e) {
      _logGenericObject(e);
      throw ServerFailure('An unknown error occurred: $e');
    }
  }

  // Delete a document from Firestore
  static Future<void> deleteData({
    required String collection,
    required String documentId,
  }) async {
    try {
      // Delete document from Firestore
      await firestoreInstance.collection(collection).doc(documentId).delete();
    } on FirebaseException catch (e) {
      _logFirebaseError(e);
      if (e.code == 'permission-denied') {
        _handleTokenExpiry();
      }
      throw ServerFailure.fromFirebaseException(e);
    } on Exception catch (e) {
      _logGenericException(e);
      throw ServerFailure(e.toString());
    } catch (e) {
      _logGenericObject(e);
      throw ServerFailure('An unknown error occurred: $e');
    }
  }

  // Update data in Firestore
  static Future<void> putData({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
    bool updateUserImage = false,
  }) async {
    try {
      final String token = await _getFirebaseToken();
      // Update document in Firestore
      List<String> keyList = data.keys.toList();
      for (int i = 0; i < keyList.length; i++) {
        if (keyList[i].contains('image') &&
            data[keyList[i]] != null &&
            data[keyList[i]].toString().isNotEmpty) {
          String url = await uploadFile(
            file: File(data[keyList[i]]),
            folderName: collection,
            userId: _auth?.currentUser?.uid ?? '',
          );
          data[keyList[i]] = url;
        }
      }
      if (updateUserImage) {
        AppController.instance.saveUser(UserModel.fromJson(data));
      }
      await firestoreInstance
          .collection(collection)
          .doc(documentId)
          .update(data);
    } on FirebaseException catch (e) {
      _logFirebaseError(e);
      if (e.code == 'permission-denied') {
        _handleTokenExpiry();
      }
      throw ServerFailure.fromFirebaseException(e);
    } on Exception catch (e) {
      _logGenericException(e);
      throw ServerFailure(e.toString());
    } catch (e) {
      _logGenericObject(e);
      throw ServerFailure('An unknown error occurred: $e');
    }
  }

  // Handle token expiry by showing a dialog
  static void _handleTokenExpiry() {
    final BuildContext? context = navigatorKey.currentState?.overlay?.context;
    if (context != null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SessionExpiredDialog(
            title: S.of(context).sessionExpire,
            content: S.of(context).pleaseLogin,
            onLogout: () => logoutFunction(context),
          );
        },
      );
    }
  }

  // Log Firebase errors for debugging
  static void _logFirebaseError(FirebaseException exception) {
    log('FirebaseError: ${exception.message}');
    log('FirebaseError Code: ${exception.code}');
  }

  // Log server failure errors
  static void _logServerFailure(ServerFailure failure) {
    log('ServerFailure: ${failure.message}');
  }

  // Log generic exceptions
  static void _logGenericException(Exception exception) {
    log('Exception: ${exception.toString()}');
  }

  // Log any non-exception errors (e.g., errors that are of type `Object`)
  static void _logGenericObject(Object object) {
    log('Unknown Object Error: ${object.toString()}');
  }
}
