import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:prueba_maquillajes/utils/drawer.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Container(
        width: size.width > 680 ? 61.2 : size.width * 0.09,
        height: size.width > 680 ? 61.2 : size.width * 0.09,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Image(
            color: Colors.teal,
            width: size.width > 680 ? 47.6 : size.width * 0.07,
            image: AssetImage('assets/iconoWhatsapp.png'),
          ),
          onPressed: () {
            _launchURL();
          },
        ),
      ),
      drawer: MenuDesplegable(),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: tituloAppbar(context),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        elevation: 0,
      ),
      body: SingleChildScrollView(child: body(context)),
    );
  }

  Widget tituloAppbar(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'data',
          style: TextStyle(
              color: Colors.black,
              fontSize: size.width > 400 ? 16 : size.width * 0.04),
        ),
        SizedBox(
          width: size.width < 297 ? size.width * 0.02 : size.width * 0.03,
        ),
        Text(
          'Inicio',
          style: TextStyle(
              color: Colors.black,
              fontSize: size.width > 400 ? 16 : size.width * 0.04),
        ),
        SizedBox(
          width: size.width < 297 ? size.width * 0.02 : size.width * 0.03,
        ),
        Text(
          'Paletas',
          style: TextStyle(
              color: Colors.black,
              fontSize: size.width > 400 ? 16 : size.width * 0.04),
        ),
        SizedBox(
          width: size.width < 297 ? size.width * 0.02 : size.width * 0.03,
        ),
        Text(
          'Polvos',
          style: TextStyle(
              color: Colors.black,
              fontSize: size.width > 400 ? 16 : size.width * 0.04),
        ),
        SizedBox(
          width: size.width < 297 ? size.width * 0.02 : size.width * 0.03,
        ),
        Text(
          'Labiales',
          style: TextStyle(
              color: Colors.black,
              fontSize: size.width > 400 ? 16 : size.width * 0.04),
        ),
      ],
    );
  }

  Widget body(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        containerGris(context),
        SizedBox(
          height: size.width * 0.03,
        ),
        divisor(context),
        SizedBox(
          height: size.width * 0.03,
        ),
        listaBases(context),
        divisor(context),
        SizedBox(
          height: size.width * 0.03,
        ),
        listaPaletas(context),
        divisor(context),
        SizedBox(
          height: size.width * 0.03,
        ),
        listaBrochas(context),
        divisor(context),
        SizedBox(
          height: size.width * 0.03,
        ),
        listaLabiales(context),
        divisor(context),
        SizedBox(
          height: size.width * 0.03,
        ),
        listaTintas(context)
      ],
    );
  }

  Widget divisor(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.96,
      height: size.width < 402 ? 1 : 1.5,
      color: Color.fromRGBO(241, 243, 245, 1),
    );
  }

  Widget listaPaletas(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return listaGeneral(context,
        productos: [
          productos(
            context,
            nombre: 'Paleta minima',
            precio: '10000',
            //  tamanno: true,
            //tamannoNum: 0.5,
            imagen: 'assets/paletaMinima.png',
          ),
          productos(context,
              tamanno: true,
              tamannoNum: 0.135,
              nombre: 'Paleta Pequenna',
              precio: '10000',
              imagen: 'assets/paletapequenna2.png'),
          productos(context,
              imagen: 'assets/paletaTriangulo.png',
              precio: '10000',
              nombre: 'Paleta Triangulo',
              tamanno: true,
              tamannoNum: 0.11),
          productos(
            context,
            nombre: 'Paleta Grande',
            imagen: 'assets/paletaMasGrande.png',
            precio: '10000',
          )
        ],
        titulo: 'Paletas');
  }

  Widget listaBases(
    BuildContext context,
  ) {
    return listaGeneral(context,
        productos: [
          productos(
            context,

            imagen: 'assets/base.png',
            nombre: 'Base OG',
            precio: '10000',
            // nombre': 'Base OG', 'precio': '10000'}),
          ),
          productos(
            context,
            imagen: 'assets/base2.png',
            nombre: 'Base OG',
            precio: '10000',
          ),
        ],
        titulo: 'Bases');
  }

  Widget listaBrochas(BuildContext context) {
    return listaGeneral(context, titulo: 'Brochas', productos: [
      productos(context,
          imagen: 'assets/brocha.png',
          nombre: 'Brocha Grande',
          precio: '10000'),
      productos(context,
          imagen: 'assets/brochas.png',
          nombre: 'Brochas',
          precio: '10000',
          tamanno: true,
          tamannoNum: 0.19),
    ]);
  }

  Widget listaLabiales(BuildContext context) {
    return listaGeneral(context, titulo: 'Labiales', productos: [
      productos(context,
          imagen: 'assets/labiales.png',
          nombre: 'Labial',
          precio: '10000',
          tamanno: true,
          tamannoNum: 0.3),
    ]);
  }

  Widget listaTintas(BuildContext context) {
    return listaGeneral(context, titulo: 'Tintas', productos: [
      productos(context,
          imagen: 'assets/tinta.png',
          nombre: 'Tinta x14',
          precio: '10000',
          tamanno: true,
          tamannoNum: 0.19),
    ]);
  }

  _launchURL() async {
    const url = 'https://wa.me/+573218068185';
    // const url =
    // 'https://api.whatsapp.com/send?phone=573016430128&text=Hola%2C%20*MOSERCON*%20Necesito%20Info%20MOSERCON%20%E2%80%93%20Moto%20Servicio%20de%20Confianza%20https%3A%2F%2Fwww.mosercon.com.co';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  alertVerImagen(BuildContext context, {String imagen, Text titulo}) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: titulo,
            content: Image(
              colorBlendMode: BlendMode.multiply,
              image: AssetImage(imagen),
            ),
          );
        });
  }

  Widget listaGeneral(BuildContext context,
      {List<Widget> productos, String titulo}) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
            child: Container(
                width: size.width * 0.96,
                child: Text(
                  titulo ?? 'Bases',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width < 464
                        ? 464 * 0.03
                        : size.width > 1025
                            ? 1025 * 0.03
                            : size.width * 0.03,
                    color: Colors.teal,
                  ),
                ))),
        SizedBox(
          height: size.width * 0.01,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: productos ??
                  [
                    Container(),
                  ]),
        ),
      ],
    );
  }

  Widget productos(
    BuildContext context, {
    String imagen,
    bool tamanno = false,
    double tamannoNum,
    Function ontap,
    String nombre,
    String precio,
  }) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Container(
            color: Colors.transparent,
            width: size.width < 464 ? 464 * 0.2 : size.width * 0.2,
            // height: size.width < 428
            //     ? 428 * 0.3
            //     : size.width > 1150
            //         ? 1150 * 0.3
            //         : size.width * 0.3,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    return alertVerImagen(context, imagen: imagen ?? '');
                  },
                  child: CircleAvatar(
                      child: Center(
                        child: Image(
                          width: tamanno == false
                              ? size.width < 464
                                  ? 464 * 0.12
                                  : size.width > 1150
                                      ? 1150 * 0.12
                                      : size.width * 0.12
                              : size.width < 464
                                  ? 464 * tamannoNum
                                  : size.width > 1150
                                      ? 1150 * tamannoNum
                                      : size.width * tamannoNum,
                          image: AssetImage(
                            imagen ?? 'assets/maquillaje.png',
                          ),
                        ),
                      ),
                      // assets/maquillaje.png
                      // backgroundImage: AssetImage(imagen ?? 'assets/maquillaje.png'),
                      // backgroundImage: AssetImage(imagen ?? 'assets/maquillaje.png'),
                      radius: size.width < 464
                          ? 464 * 0.09
                          : size.width > 1150
                              ? 1150 * 0.09
                              : size.width * 0.09,
                      backgroundColor: Colors.grey[200]),
                ),
                SizedBox(
                  height: size.width < 428 ? 428 * 0.01 : size.width * 0.01,
                ),
                Container(
                  width: size.width * 0.2,
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        nombre ?? 'maquillaje de ',
                        textAlign: TextAlign.center,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: size.width < 428
                                ? 428 * 0.03
                                : size.width > 811
                                    ? 811 * 0.03
                                    : size.width * 0.03),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$' + precio ?? '\$50.000',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                                fontSize: size.width < 428
                                    ? 428 * 0.03
                                    : size.width > 811
                                        ? 811 * 0.03
                                        : size.width * 0.03),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: size.width * 0.03)
      ],
    );
  }

  Widget containerGris(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: size.width * 0.96,
                      height: size.width > 900 ? 900 * 0.03 : size.width * 0.03,
                      color: Colors.transparent,
                    ),
                    Container(
                      width: size.width * 0.96,
                      height: size.width > 900 ? 900 * 0.25 : size.width * 0.25,
                      color: Color.fromRGBO(241, 243, 245, 1),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  size.width > 765
                                      ? 'Tu pagina web de maquillaje'
                                      : 'Tu pagina confiable',
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width > 613
                                          ? 613 * 0.055
                                          : size.width * 0.055),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  size.width > 765
                                      ? 'Con la mejor calidad'
                                      : 'la mejor calidad',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: size.width > 613
                                          ? 613 * 0.04
                                          : size.width * 0.04),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    size.width > 765
                                        ? 'Y el mejor precio'
                                        : 'y el mejor precio',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: size.width > 613
                                            ? 613 * 0.04
                                            : size.width * 0.04))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  // color: Colors.white,
                  width: size.width * 0.96,
                  height: size.width > 900 ? 900 * 0.28 : size.width * 0.28,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image(
                        image: AssetImage('assets/mujer2-removebg-preview.png'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class Productos extends StatelessWidget {
  final Map datos;
  final String imagen;
  final bool tamanno;
  final double tamannoNum;
  final String nombre;
  final String precio;
  const Productos(
      {Key key,
      this.nombre,
      this.precio,
      this.imagen,
      this.tamanno = false,
      this.tamannoNum,
      this.datos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Container(
            color: Colors.transparent,
            width: size.width < 464 ? 464 * 0.2 : size.width * 0.2,
            // height: size.width < 428
            //     ? 428 * 0.3
            //     : size.width > 1150
            //         ? 1150 * 0.3
            //         : size.width * 0.3,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    return alertVerImagen(
                      context,
                      imagen: imagen ?? '',
                    );
                  },
                  child: CircleAvatar(
                      child: Center(
                        child: Image(
                          width: tamanno == false
                              ? size.width < 464
                                  ? 464 * 0.12
                                  : size.width > 1150
                                      ? 1150 * 0.12
                                      : size.width * 0.12
                              : size.width < 464
                                  ? 464 * tamannoNum
                                  : size.width > 1150
                                      ? 1150 * tamannoNum
                                      : size.width * tamannoNum,
                          image: AssetImage(
                            imagen ?? 'assets/maquillaje.png',
                          ),
                        ),
                      ),
                      // assets/maquillaje.png
                      // backgroundImage: AssetImage(imagen ?? 'assets/maquillaje.png'),
                      // backgroundImage: AssetImage(imagen ?? 'assets/maquillaje.png'),
                      radius: size.width < 464
                          ? 464 * 0.09
                          : size.width > 1150
                              ? 1150 * 0.09
                              : size.width * 0.09,
                      backgroundColor: Colors.grey[200]),
                ),
                SizedBox(
                  height: size.width < 428 ? 428 * 0.01 : size.width * 0.01,
                ),
                Container(
                  width: size.width * 0.2,
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        nombre ?? 'maquillaje de ',
                        textAlign: TextAlign.center,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: size.width < 428
                                ? 428 * 0.03
                                : size.width > 811
                                    ? 811 * 0.03
                                    : size.width * 0.03),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$' + precio ?? '\$50.000',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                                fontSize: size.width < 428
                                    ? 428 * 0.03
                                    : size.width > 811
                                        ? 811 * 0.03
                                        : size.width * 0.03),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: size.width * 0.03)
      ],
    );
  }

  alertVerImagen(BuildContext context, {String imagen, Text titulo}) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: titulo,
            content: Image(
              colorBlendMode: BlendMode.multiply,
              image: AssetImage(imagen),
            ),
          );
        });
  }
}
