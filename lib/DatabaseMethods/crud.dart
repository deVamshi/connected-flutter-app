import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

final StorageReference storageRef = FirebaseStorage.instance.ref();

Future<String> uploadFile(pdfFile) async {
  String uniqueId = Uuid().v4();

  StorageUploadTask uploadTask =
      storageRef.child("PDF$uniqueId.pdf").putFile(pdfFile);
  StorageTaskSnapshot storageSnapshot = await uploadTask.onComplete;
  String downloadUrl = await storageSnapshot.ref.getDownloadURL();
  return downloadUrl;
}
