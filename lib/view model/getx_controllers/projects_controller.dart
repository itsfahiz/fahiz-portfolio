import 'package:fahiz_portfolio/model/project_model.dart';
import 'package:get/get.dart';

class ProjectController extends GetxController {
  var hovers = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();
    hovers.assignAll(List.generate(projectList.length, (index) => false));
  }

  void onHover(int index, bool value) {
    hovers[index] = value;
  }
}
