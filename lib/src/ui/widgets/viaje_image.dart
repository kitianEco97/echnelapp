import 'dart:io';

import 'package:flutter/material.dart';

class ViajeImage extends StatelessWidget {
  final String? url;

  const ViajeImage({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 450,
        // ClipRRect: le da border radius a los elementos internos
        child: Opacity(
          opacity: 0.9,
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45), topRight: Radius.circular(45)),
              child: getImage(url)),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 5))
          ]);

  Widget getImage(String? picture) {
    if (picture == null) return Image(image: AssetImage('assets/no-image.png'));

    if (picture.startsWith('http'))
      return FadeInImage(
        placeholder: AssetImage('assets/jar-loading.gif'),
        image: NetworkImage(this.url!),
        fit: BoxFit.cover,
      );

    return Image.file(
      File(picture),
      fit: BoxFit.cover,
    );
  }
}
