import 'package:get/get.dart';

import '../../shared/services/local_storage/i_local_storage.dart';
import '../../shared/services/local_storage/local_storage_service.dart';
import 'search_controller.dart';

class SearchBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILocalStorageService>(() => LocalStorageService());
    Get.lazyPut(
      () => SearchController(Get.find<ILocalStorageService>()),
    );
  }
}
