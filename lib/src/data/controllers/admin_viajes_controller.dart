import 'package:get/get.dart';
import 'package:echnelapp/src/data/models/models.dart';
import 'package:echnelapp/src/data/services/services.dart';

class AdminViajesController extends GetxController {
  final viajes = <Viaje>[];
  final viajesService = Get.find<ViajesService>();

  AdminViajesController() {
    getViajes();
  }

  Future getViajes() async {
    // final articles = await viajesService.loadProducts();

    // viajes.addAll(articles);
    update();
  }
}
