import 'package:get_storage/get_storage.dart';

import '../tools/constants.dart';

class LocalData {
  final box = GetStorage();
  void writeBackup(int pageNum, List<dynamic> result) {
    if (pageNum == 1) {
      box.write(kResultsKey, result);
    }
  }

  List<dynamic> getBackup() {
    return box.read(kResultsKey);
  }
}
