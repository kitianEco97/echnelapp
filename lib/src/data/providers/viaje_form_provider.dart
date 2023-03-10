import 'package:flutter/material.dart';
import 'package:echnelapp/src/data/models/models.dart';

class ViajeFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Viaje viaje;

  ViajeFormProvider(this.viaje);

  updateAvailability(bool value) {
    print(value);
    this.viaje.available = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(viaje.name);
    print(viaje.salida);
    print(viaje.available);

    return formKey.currentState?.validate() ?? false;
  }
}
