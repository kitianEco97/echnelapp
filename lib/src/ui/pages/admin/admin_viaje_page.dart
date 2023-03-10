import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:echnelapp/src/data/services/services.dart';
import 'package:echnelapp/src/data/providers/providers.dart';
import 'package:echnelapp/src/ui/herlpers/helpers.dart';
import 'package:echnelapp/src/ui/widgets/widgets.dart';

class AdminViajePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viajeService = Provider.of<ViajesService>(context);

    return ChangeNotifierProvider(
      create: (_) => ViajeFormProvider(viajeService.selectedViaje!),
      child: _ViajePageBody(viajeService: viajeService),
    );
  }
}

class _ViajePageBody extends StatelessWidget {
  const _ViajePageBody({
    Key? key,
    required this.viajeService,
  }) : super(key: key);

  final ViajesService viajeService;

  @override
  Widget build(BuildContext context) {
    final viajeForm = Provider.of<ViajeFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Stack(
              children: [
                ViajeImage(url: viajeService.selectedViaje!.picture),
                Positioned(
                    top: 60,
                    left: 20,
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          size: 40,
                          color: Colors.white,
                        ))),
                Positioned(
                    top: 60,
                    right: 20,
                    child: IconButton(
                        onPressed: () async {
                          final picker = new ImagePicker();
                          final PickedFile? pickedFile = await picker.getImage(
                              source: ImageSource.camera, imageQuality: 100);
                          // source: ImageSource.gallery,
                          // imageQuality: 100);
                          if (pickedFile == null) {
                            print('no selecciono nada');
                            return;
                          }
                          viajeService
                              .updateSelectedProductImage(pickedFile.path);
                        },
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          size: 40,
                          color: Colors.white,
                        ))),
              ],
            ),
            _ViajeForm(),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: viajeService.isSaving
            ? CircularProgressIndicator(
                color: Colors.white,
              )
            : Icon(Icons.save_outlined),
        onPressed: viajeService.isSaving
            ? null
            : () async {
                if (!viajeForm.isValidForm()) return;

                final String? imageUrl = await viajeService.uploadImage();

                if (imageUrl != null) viajeForm.viaje.picture = imageUrl;

                viajeService.saveOrCreateViaje(viajeForm.viaje);
              },
      ),
    );
  }
}

class _ViajeForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viajeForm = Provider.of<ViajeFormProvider>(context);
    final viaje = viajeForm.viaje;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
            key: viajeForm.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                SizedBox(height: 10),
                TextFormField(
                  initialValue: viaje.name,
                  onChanged: (value) => viaje.name = value,
                  validator: (value) {
                    if (value == null || value.length < 1) {
                      return 'El nombre es obligatorio';
                    }
                  },
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Nombre del viaje', labelText: 'Nombre: '),
                ),
                SizedBox(height: 30),
                TextFormField(
                  initialValue: ':' + viaje.salida,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\:?\d{0,2}'))
                  ],
                  onChanged: (value) => viaje.salida = value,
                  // onChanged: (value) {
                  //   if (double.tryParse(value) == null) {
                  //     viaje.salida = 0;
                  //   } else {
                  //     viaje.salida = double.parse(value);
                  //   }
                  //   viaje.salida = value;
                  // },
                  validator: (value) {
                    if (value == null || value.length < 1) {
                      return 'La salida es obligatoria';
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Hora Salida', labelText: 'Salida: '),
                ),
                SizedBox(height: 30),
                SwitchListTile(
                    value: viaje.available,
                    title: Text('En camino'),
                    activeColor: Colors.indigo,
                    onChanged: viajeForm.updateAvailability),
                SizedBox(height: 30),
              ],
            )),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset(0, 5),
              blurRadius: 5)
        ]);
  }
}
