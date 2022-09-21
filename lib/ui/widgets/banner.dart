import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner(this.bannerHeight, {Key? key}) : super(key: key);
  final double bannerHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: bannerHeight,
      child:
          //
          // const ColoredBox(color: Colors.blueGrey,)

          Image.network(
              // "https://thumbs.dreamstime.com/b/dise%C3%B1o-creativo-de-fondo-banner-web-abstracto-azul-moderno-ilustraci%C3%B3n-vectorial-para-la-portada-banners-presentaci%C3%B3n-pancartas-206534202.jpg",
              // "https://media.istockphoto.com/vectors/abstract-blue-square-background-vector-id1150186246?k=20&m=1150186246&s=170667a&w=0&h=jQxHnRljtv7paI08eFdRvJA_jvoQoa0KfJzpk4L6uBk=",
              // "https://static.vecteezy.com/system/resources/previews/003/557/256/original/abstract-blue-and-orange-wave-business-background-free-vector.jpg",
              // "https://media.istockphoto.com/vectors/abstract-red-orange-polygonal-vector-background-vector-id990855930?k=20&m=990855930&s=170667a&w=0&h=3tSax7B6HsRrOmuKs186RI1Ppd262C1Jz60HrBIRt1M=",
              "https://i.pinimg.com/originals/87/21/98/872198c2f62aa608f6d657b61c5e65b6.jpg",
              fit: BoxFit.cover),
    );
  }
}
