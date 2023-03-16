import 'package:flutter/material.dart';
import 'package:sapi_pmk/model/pertologan_model.dart';
import 'package:sapi_pmk/widgets/app_large_text.dart';
import 'package:sapi_pmk/widgets/app_text.dart';

class PertolonganPage extends StatelessWidget {
  const PertolonganPage({Key? key, required this.pertolonganModel})
      : super(key: key);
  final PertolonganModel pertolonganModel;

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
              text: pertolonganModel.judul,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: AppText(
              text: pertolonganModel.deskripsi,
            ),
          )
        ],
      ),
    );
  }
}
