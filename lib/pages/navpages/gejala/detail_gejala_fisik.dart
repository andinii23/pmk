import 'package:flutter/material.dart';
import 'package:sapi_pmk/model/gejala_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:sapi_pmk/pages/navpages/gejala/gejala.dart';
import 'package:sapi_pmk/widgets/app_large_text.dart';
import 'package:sapi_pmk/widgets/app_text.dart';

class DetailGejala extends StatelessWidget {
  final Gejala gejala;
  DetailGejala(this.gejala);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Hero(
              tag: '${gejala.id}_${gejala.judul}',
              child: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("img/sapi_pmk/" + gejala.gambar),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
              left: 5,
              top: 40,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(50)),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GejalaPage()));
                        ;
                      },
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 4,
              child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          AppLargeText(
                            text: gejala.judul,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          AppLargeText(text: "Ciri-Ciri", size: 20),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 1,
                            width: MediaQuery.of(context).size.width / 1.15,
                            child: SingleChildScrollView(
                              child: AppText(
                                  text: gejala.deskripsi,
                                  color: Colors.black.withOpacity(0.8),
                                  size: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
