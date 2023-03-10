import 'package:echnelapp/src/data/services/viajes_service.dart';
import 'package:flutter/material.dart';
import 'package:echnelapp/src/data/models/models.dart';

class ViajeCardUser extends StatefulWidget {
  final Viaje viaje;

  ViajeCardUser({super.key, required this.viaje});

  @override
  State<ViajeCardUser> createState() => _ViajeCardUserState();
}

class _ViajeCardUserState extends State<ViajeCardUser> {
  ViajesService viajesService = new ViajesService();
  @override
  void initState() {
    this.viajesService.loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            margin: EdgeInsets.only(top: 30, bottom: 50),
            width: double.infinity,
            height: 400,
            decoration: _cardBorders(),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                _BackgroundImage(widget.viaje.picture),
                _TripDetails(
                  title: widget.viaje.name,
                  subTitle: widget.viaje.id!,
                ),
                Positioned(
                    top: 0, right: 0, child: _ExitTag(widget.viaje.salida)),
                // if (viaje.available == true)
                widget.viaje.available == true
                    ? Positioned(top: 0, left: 0, child: _EnCamino())
                    : Positioned(top: 0, left: 0, child: _Estacionado()),
              ],
            ),
          ),
        );
        ;
      },
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 5), blurRadius: 10)
          ]);
}

class _EnCamino extends StatefulWidget {
  @override
  State<_EnCamino> createState() => _EnCaminoState();
}

class _EnCaminoState extends State<_EnCamino> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'En Camino',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      width: 100,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.green.shade300,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
    );
  }
}

class _Estacionado extends StatefulWidget {
  @override
  State<_Estacionado> createState() => _EstacionadoState();
}

class _EstacionadoState extends State<_Estacionado> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Estacionado',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      width: 100,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.red[600],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
    );
  }
}

class _ExitTag extends StatefulWidget {
  final salida;

  const _ExitTag(this.salida);

  @override
  State<_ExitTag> createState() => _ExitTagState();
}

class _ExitTagState extends State<_ExitTag> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '${widget.salida}',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      width: 100,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), bottomLeft: Radius.circular(25))),
    );
  }
}

class _TripDetails extends StatefulWidget {
  final String title;
  final String subTitle;

  const _TripDetails({required this.title, required this.subTitle});

  @override
  State<_TripDetails> createState() => _TripDetailsState();
}

class _TripDetailsState extends State<_TripDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              widget.subTitle,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
}

class _BackgroundImage extends StatefulWidget {
  final String? url;

  const _BackgroundImage(this.url);

  @override
  State<_BackgroundImage> createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<_BackgroundImage> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: widget.url == null
            ? Image(image: AssetImage('assets/no-image.png'))
            : FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(widget.url!, scale: 1.0),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
