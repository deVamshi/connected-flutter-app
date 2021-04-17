import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:Connected/models/file_model.dart';

final StorageReference storageRef = FirebaseStorage.instance.ref();
final Firestore firestore = Firestore();

Future<String> uploadFile(pdfFile) async {
  String uniqueId = Uuid().v4();
  StorageUploadTask uploadTask =
      storageRef.child("PDF$uniqueId.pdf").putFile(pdfFile);
  StorageTaskSnapshot storageSnapshot = await uploadTask.onComplete;
  String downloadUrl = await storageSnapshot.ref.getDownloadURL();
  return downloadUrl;
}

getCoreSubjects() async {
  List<dynamic> subNames = [];
  List<dynamic> linkNames = [];
  QuerySnapshot docs = await firestore.collection("coresubs").getDocuments();

  for (var i in docs.documents) {
    for (String j in i.data.values) {
      subNames.add(j.substring(0, j.indexOf("/")));
      linkNames.add(j.substring(j.indexOf("/") + 1));
    }
  }
  print(subNames);
  print(linkNames);
}

getListOfPdfs() async {
  List<FileModel> files = [];

  QuerySnapshot docs = await firestore.collection("indiesubs").getDocuments();
  for (var i in docs.documents) {
    print(i.documentID);
    for (String j in i.data.keys) {
      FileModel model = FileModel(
          mainName: j.substring(0, j.indexOf(",")),
          linkName: j.substring(j.indexOf(",") + 1),
          relatedNumber: i.data[j]);
      print(model);
    
      files.add(model);
      print("shit");
      // pdfNames.add(j.substring(0, j.indexOf(",")));
      // downloadUrls.add(j.substring(j.indexOf(",") + 1));
      // likes.add(i.data[j]);
    }
  }
  return files;
}

likeFunc() async {
  await firestore
      .collection("indiesubs")
      .document("NpeGOjcp4BpuX4cgoySc")
      .updateData({"Network Analysis,durl": FieldValue.increment(1)});
  print("ok");
}

dislikeFunc() async {
  await firestore
      .collection("indiesubs")
      .document("NpeGOjcp4BpuX4cgoySc")
      .updateData({"Network Analysis,durl": FieldValue.increment(-1)});
  print("ok");
}
