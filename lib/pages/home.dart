import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sapi_pmk/pages/navpages/about_page.dart';
import 'package:sapi_pmk/pages/navpages/deteksi/dfisik/camera_page.dart';
import 'package:sapi_pmk/pages/navpages/gejala/gejala.dart';
import 'package:sapi_pmk/pages/navpages/info_pmk.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.7,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/banner2.jpg"), fit: BoxFit.cover)),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0)),
                    color: Colors.white),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      '--_ MENU _--',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2.9,
                            width: MediaQuery.of(context).size.width / 1.05,
                            child: SingleChildScrollView(
                                child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _cardMenu(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CameraPage()));
                                      },
                                      title: 'Deteksi PMK',
                                      icon: 'img/search2.png',
                                    ),
                                    _cardMenu(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    GejalaPage()));
                                      },
                                      title: 'Gejala PMK',
                                      icon: 'img/diagnosis.png',
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _cardMenu(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    InfoPmkPage()));
                                      },
                                      title: 'Informasi PMK',
                                      icon: 'img/prevention.png',
                                    ),
                                    _cardMenu(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AboutPage()));
                                      },
                                      title: 'Tentang Aplikasi',
                                      icon: 'img/about2.png',
                                    ),
                                  ],
                                ),
                              ],
                            )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: 15,
              child: Container(
                height: MediaQuery.of(context).size.width / 2,
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            'DePMK APP',
                            style: TextStyle(
                                fontFamily: 'vavrela',
                                fontSize:
                                    MediaQuery.of(context).size.height / 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 9),
                    Container(
                      padding: EdgeInsets.all(1),
                      color: Colors.black12,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        'Aplikasi pendeteksi gejala awal penyakit mulut \ndan kuku pada sapi',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 40,
                          color: Colors.white,
                          fontFamily: 'nunito',
                          letterSpacing: 0.5,
                          wordSpacing: 0.5,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cardMenu({
    required String title,
    required String icon,
    VoidCallback? onTap,
    Color fontColor = Colors.black,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Expanded(
        child: Container(
          margin: const EdgeInsets.only(top: 20, left: 24, right: 24),
          padding: const EdgeInsets.symmetric(vertical: 20),
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade600,
                blurRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Image.asset(
                icon,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height / 12,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: fontColor,
                  fontSize: MediaQuery.of(context).size.height / 50,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
