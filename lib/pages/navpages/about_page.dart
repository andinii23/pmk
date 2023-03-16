import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sapi_pmk/pages/home.dart';
import 'package:sapi_pmk/widgets/app_large_text.dart';
import 'package:sapi_pmk/widgets/app_text.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: AppLargeText(
                  text: 'Tentang Aplikasi',
                  size: MediaQuery.of(context).size.height / 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 5,
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Image.asset(
                      'img/tentangapk.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 1.05,
                      child: SingleChildScrollView(
                        child: Text(
                          "DePMK App merupakan Aplikasi Pendeteksian Gejala Awal Penyakit Mulut dan Kuku. Dimana aplikasi ini dapat melakukan pendeteksian terhadap gejala awal PMK melalui gambar dan beberapa pertanyaan yang berkaitan dengan gejala non-fisik PMK. Aplikasi ini juga menyediakan informasi mengenai gejala-gejala PMK seperti gejala fisik dan gejala non-fisik yang dialami sapi PMK. Aplikasi ini juga memberikan informasi mengenai penyebaran PMK dan tindakan pertama pada kasus serta bagaimana cara mencegah penularan dan penyebaran virus PMK kepada peternak.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            letterSpacing: 0.5,
                            wordSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height / 4.5,
                      padding: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width / 1.06,
                      decoration: BoxDecoration(
                        color: Color(0xFF016CA3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                  'Dinas Pertanian dan Ketahanan Pangan Kota Jambi',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.call,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 20),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.6,
                                        child: AppText(
                                          text: '+6285263683744',
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.home,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 20),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.6,
                                        child: AppText(
                                          text:
                                              'Jl. Kapten Pattimura No.Km 10, Kenali Besar, Kec. Kota Baru, Kota Jambi, Jambi 36128',
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   child: Text("DePMK Copyright 2022"),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
