import 'package:get/get.dart';

class MovieDetailMiddleware extends GetMiddleware {
  @override
  void onPageDispose() {
    print('Route Details disposed');
    Get.offNamed('home');
  }
}
