import 'package:flutter/material.dart';
import 'package:sapi_pmk/model/gejalanfisik_model.dart';
import 'package:sapi_pmk/widgets/app_text.dart';

class GejalaNfisikPage extends StatelessWidget {
  const GejalaNfisikPage({Key? key, required this.gnfisik}) : super(key: key);
  final Gejalanfisik gnfisik;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 10,
                top: 5,
                right: 15,
                bottom: 1,
              ),
              child: Text(
                gnfisik.gejala,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 5,
                left: 10,
                right: 10,
                bottom: 10,
              ),
              child: AppText(
                text: gnfisik.deskripsi,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
