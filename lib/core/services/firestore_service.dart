import 'package:cloud_firestore/cloud_firestore.dart';

import 'database_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({required String path, required data, String? documentId}) async {
    if(documentId != null){
      await firestore.collection(path).doc(documentId).set(data);
    }else{
      await firestore.collection(path).add(data);

    }

  }

  @override
  Future<Map<String,dynamic>> getData({required String path, required String uId}) async {
  var data =  await firestore.collection(path).doc(uId).get();
  return  data.data() as Map<String,dynamic> ;
  }

  @override
  Future<bool> checkIfDataExists({required String path, required String uId}) async {
    return await firestore.collection(path).doc(uId).get().then((value) => value.exists);
  }

}
