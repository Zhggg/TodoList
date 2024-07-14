// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:todolist/services/base_firestore.dart';

// class FirestoreService extends BaseFireStoreService {
//   final _firestoreInstance = FirebaseFirestore.instance;

//   @override
//   Future addDataToFirestore(
//       Map<String, dynamic> data, String collectionName, String docName) async {
//     try {
//       await _firestoreInstance
//           .collection(collectionName)
//           .doc(docName)
//           .set(data);
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }

//   @override
//   Future getDataToFirestore(String collectionName, String docName) async {
//     try {
//       final data = await _firestoreInstance
//           .collection(collectionName)
//           .doc(docName)
//           .get();
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }

//   @override
//   Future updateUserData(String uid, Map<String, dynamic> data) async {
//     try {
//       await _firestoreInstance.collection('user').doc(uid).update(data);
//       print('User data updated successfully');
//     } catch (e) {
//       print('Failed to update user data: $e');
//       throw Exception('Failed to update user data: $e');
//     }
//   }

//   @override
//   Future updateDataToFirestore(
//       Map<String, dynamic> data, String collectionName, String docName) async {
//     try {
//       await _firestoreInstance
//           .collection(collectionName)
//           .doc(docName)
//           .update(data)
//           .then(
//             (value) => print(
//               'User Updated',
//             ),
//           )
//           .catchError((error) => print('Failed to update user: $error'));
//     } catch (e) {
//       print(e);
//       throw Exception(e.toString());
//     }
//   }

//   @override
//   Future<bool> isUserExistsFirestore(String email) async {
//     try {
//       final querySnapshot = await _firestoreInstance
//           .collection('user')
//           .where('email', isEqualTo: email)
//           .get();
//       print("Number of documents found: ${querySnapshot.docs.length}");
//       return querySnapshot.docs.isNotEmpty;
//     } catch (e) {
//       print("Error in isUserExistsFirestore: $e");
//       return false;
//     }
//   }

//   @override
//   Future<bool> checkingCorrectEmailWithPassword(
//       String email, String password) async {
//     try {
//       final querySnapshot = await _firestoreInstance
//           .collection('user')
//           .where('email', isEqualTo: email)
//           .where('password', isEqualTo: password)
//           .get();
//       return querySnapshot.docs.isNotEmpty;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }
  
//   @override
//   Future getDataToFirestore(String collectionName, String docName) {
//     // TODO: implement getDataToFirestore
//     throw UnimplementedError();
//   }
// }