import 'package:get/get.dart';

abstract class RoutingAdapter {
  static Future<T?>? navTo<T>({
    required String route,
    dynamic args,
    Map<String, String>? params,
  }) async =>
      Get.toNamed(route, arguments: args, parameters: params);

  static Future<T?>? killAndNavTo<T>({
    required String route,
    dynamic transferedData,
    dynamic args,
    Map<String, String>? params,
  }) async =>
      Get.offAndToNamed(route, arguments: args, parameters: params, result: transferedData);

  static Future<T?>? killAllAndNavTo<T>({
    required String route,
    dynamic transferedData,
    dynamic args,
    Map<String, String>? params,
  }) async =>
      Get.offAndToNamed(route, arguments: args, parameters: params, result: transferedData);
}
