import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sapi_pmk/model/gejala_model.dart';
import 'package:sapi_pmk/model/gejalanfisik_model.dart';
import 'package:sapi_pmk/pages/home.dart';
import 'package:sapi_pmk/pages/navpages/gejala/detail_gejala_fisik.dart';
import 'package:sapi_pmk/pages/navpages/gejala/gnfisik.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sapi_pmk/widgets/app_large_text.dart';

class GejalaPage extends StatefulWidget {
  const GejalaPage({Key? key}) : super(key: key);

  @override
  State<GejalaPage> createState() => _GejalaPageState();
}

class _GejalaPageState extends State<GejalaPage> with TickerProviderStateMixin {
  List<Gejalanfisik> gejala = GejalaList;
  var images = [
    "air_liur_1.jpg",
    "air_liur_2.jpg",
    "air_liur_3.jpeg",
    "gusi_1.jpg",
    "gusi_2.jpg",
    "gusi_4.jpg",
    "kaki_1.jpg",
    "kaki_2.jpg",
    "kaki_3.jpg",
    "lidah_1.jpg",
    "lidah_2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu text
          Container(
            padding: const EdgeInsets.only(top: 40, left: 1),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                    ;
                  },
                  icon: Icon(Icons.arrow_back),
                  iconSize: MediaQuery.of(context).size.height / 25,
                  color: Colors.black,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: AppLargeText(
                    text: "Gejala PMK Pada Sapi",
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
                  Tab(text: "Gejala Fisik"),
                  Tab(text: "Gejala Non Fisik"),
                ]),
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 1),
              height: MediaQuery.of(context).size.height / 1.23,
              width: double.maxFinite,
              child: TabBarView(controller: _tabController, children: [
                _ActivitiesMasonryGrid(images: images),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: AppLargeText(
                            text: 'Gejala-Gejala Non-Fisik PMK',
                          )),
                      Container(
                        height: MediaQuery.of(context).size.height / 1.4,
                        // color: Colors.yellow,
                        child: ListView.builder(
                          itemCount: gejala.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => GejalaNfisikPage(
                            gnfisik: gejala[index],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivitiesMasonryGrid extends StatelessWidget {
  const _ActivitiesMasonryGrid({
    Key? key,
    this.masonryCardHeights = const [200, 250, 300],
    required this.images,
  }) : super(key: key);

  final List<String> images;
  final List<double> masonryCardHeights;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      shrinkWrap: true,
      padding: const EdgeInsets.all(10.0),
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        Gejala gejala = gejalaList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailGejala(gejala)));
          },
          child: Column(
            children: [
              Hero(
                tag: '${gejala.id}_${gejala.judul}',
                child: Container(
                    height: masonryCardHeights[index % 3],
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                          image: AssetImage("img/sapi_pmk/" + gejala.gambar),
                          fit: BoxFit.cover),
                    )),
              ),
            ],
          ),
        );
      },
    );
  }
}
