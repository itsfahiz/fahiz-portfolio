import 'package:fahiz_portfolio/model/acheivement_model.dart';
import 'package:get/get.dart';

class AchievementController extends GetxController {
  var hovers = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();
    hovers.assignAll(List.generate(achievementList.length, (_) => false));
  }

  void onHover(int index, bool value) {
    hovers[index] = value;
  }
}
