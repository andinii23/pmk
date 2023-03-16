import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sapi_pmk/model/penyebaran_model.dart';
import 'package:sapi_pmk/widgets/app_large_text.dart';
import 'package:sapi_pmk/widgets/app_text.dart';

class PenyebaranPage extends StatelessWidget {
  const PenyebaranPage({Key? key, required this.penyebaranModel})
      : super(key: key);
  final PenyebaranModel penyebaranModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: AppLargeText(
              text: penyebaranModel.judul,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: AppText(
              text: penyebaranModel.deskripsi,
            ),
          )
        ],
      ),
    );
  }
}
