import 'package:get/get.dart';
import 'package:fahiz_portfolio/model/certificate_model.dart';

class CertificationController extends GetxController {
  var hovers = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();
    hovers.assignAll(List.generate(certificateList.length, (_) => false));
  }

  void onHover(int index, bool value) {
    hovers[index] = value;
  }
}
