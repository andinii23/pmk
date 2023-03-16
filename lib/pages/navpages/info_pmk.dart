import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sapi_pmk/model/penyebaran_model.dart';
import 'package:sapi_pmk/model/pertologan_model.dart';
import 'package:sapi_pmk/pages/home.dart';
import 'package:sapi_pmk/pages/navpages/infopmk/penyebaran.dart';
import 'package:sapi_pmk/pages/navpages/infopmk/pertologan.dart';
import 'package:sapi_pmk/widgets/app_large_text.dart';

class InfoPmkPage extends StatefulWidget {
  const InfoPmkPage({Key? key}) : super(key: key);

  @override
  State<InfoPmkPage> createState() => _InfoPmkPageState();
}

class _InfoPmkPageState extends State<InfoPmkPage>
    with TickerProviderStateMixin {
  List<PenyebaranModel> penyebaran = PenyebaranList;
  List<PertolonganModel> pertolongan = PertolonganList;

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40, left: 1),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  icon: Icon(Icons.arrow_back),
                  iconSize: MediaQuery.of(context).size.height / 25,
                  color: Colors.black,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  margin: const EdgeInsets.only(left: 20),
                  child: AppLargeText(
                    text: "Informasi PMK",
                    size: MediaQuery.of(context).size.height / 28,
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          //tabbar
          Container(
            child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.green,
                tabs: [
                  Tab(text: "Penyebaran"),
                  Tab(text: "Pertolongan Pertama"),
                ]),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              height: MediaQuery.of(context).size.height / 1.6,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage("img/penyebaran_pmk.jpg"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 1.55,
                          child: ListView.builder(
                            // shrinkWrap: true,
                            itemCount: penyebaran.length,
                            // scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) => PenyebaranPage(
                              penyebaranModel: penyebaran[index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage("img/pertolongan.jpg"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 1.55,
                          // color: Colors.red,
                          child: ListView.builder(
                            itemCount: pertolongan.length,
                            itemBuilder: (context, index) => PertolonganPage(
                              pertolonganModel: pertolongan[index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
