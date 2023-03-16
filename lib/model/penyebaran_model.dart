import 'package:flutter/material.dart';

class PenyebaranModel {
  int id;
  String judul;
  String deskripsi;

  PenyebaranModel(
      {required this.id, required this.judul, required this.deskripsi});
}

List<PenyebaranModel> PenyebaranList = [
  PenyebaranModel(
      id: 1,
      judul: "Penyebaran PMK",
      deskripsi:
          "Penyakit mulut dan kuku (PMK) juga dikenal sebagai Foot and Mouth Disease (FMD) Jenis penyakit ini disebabkan dari virus tipe A dari keluarga Picornaviridae, genus Apthovirus yakni Aphtaee epizootecae. Masa inkubasi dari penyakit 1-14 hari yakni masa sejak hewan tertular penyakit hingga timbul gejala. Angka kesakitan ini bisa mencapai 100% dan angka kematian tinggi ada pada hewan muda. Penyakit mulut dan kuku (PMK) menular dengan cepat. Virus masuk ke dalam tubuh hewan melalui mulut atau hidung dan virus memperbanyak diri pada sel-sel epitel di daerah nasofaring (bagian atas tenggorokan atau faring yang terletak di belakangan hidung). Virus PMK kemudian masuk ke dalam darah dan memperbanyak diri pada kelenjar limfoglandula dan sel-sel epitel di daerah mulut dan kaki yang mengakibatkan luka atau lepuh. Penularan PMK dari hewan sakit ke hewan lain terutama hewan yang peka dapat terjadi dengan dua cara yaitu secara langsung dan secara tidak langsung.\n\nPenularan secara langsung terjadi karena adanya kontak langsung dengan hewan sakit, kontak dengan air liur dan leleran hidung, Sisa makanan atau sampah yang terkontaminasi produk hewan seperti daging dan tulang dari hewan tertular, serta hewan karier (tempat persinggahan organisme penyebab infeksi). Sedangkan penularan secara tidak langsung terjadi karena kontak dengan bahan atau alat yang terkontaminasi virus PMK, seperti petugas, kendaraan, pakan ternak, dan virus ini juga tersebar melalui udara, angin, daerah beriklim khusus (mencapai 60 km di darat dan 300 km di laut).\n\nPenularan secara langsung terjadi karena adanya kontak langsung dengan hewan sakit, kontak dengan air liur dan leleran hidung, Sisa makanan atau sampah yang terkontaminasi produk hewan seperti daging dan tulang dari hewan tertular, serta hewan karier (tempat persinggahan organisme penyebab infeksi). Sedangkan penularan secara tidak langsung terjadi karena kontak dengan bahan atau alat yang terkontaminasi virus PMK, seperti petugas, kendaraan, pakan ternak, dan virus ini juga tersebar melalui udara, angin, daerah beriklim khusus (mencapai 60 km di darat dan 300 km di laut)."),
];
