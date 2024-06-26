import 'package:get_storage/get_storage.dart';
import 'package:hotel_project/models/auth_model.dart';

class DataStorage {
  final box = GetStorage();

  Future setDataStorage(Auth user) async {
    //user = userFromJson(user);

    box.write('token', user.token.toString());
    box.write('fname', user.fname.toString());
    box.write('lname', user.lname.toString());
    box.write('userid', user.userId.toString());
  }

  void eraseStorage() {
    box.erase();
  }
}
