import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vibecheck/views/homepage/model/user.dart';

class FireStoreHelper {
  FireStoreHelper._();

  static final FireStoreHelper fireStoreHelper = FireStoreHelper._();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addLiveUser(User user) async {
    await _firestore.collection('liveUsers').doc(user.userId).set({
      'nickname': user.nickName,
      'userId': user.userId,
      'actualTime': user.time,
    });
  }

  Future<List<User>> fetchAllLiveUser() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
        .collection('liveUsers')
        .orderBy('actualTime', descending: false)
        .get();

    List<QueryDocumentSnapshot> documents = querySnapshot.docs;

    List<User> fetchedLiveUser = documents
        .map(
          (e) => User(
            nickName: e['nickname'],
            userId: e['userId'],
            time: e['actualTime'],
          ),
        )
        .toList();

    return fetchedLiveUser;
  }
}
