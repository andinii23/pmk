import 'package:flutter/material.dart';

class Gejalanfisik {
  int id;
  String gejala;
  String deskripsi;

  Gejalanfisik(
      {required this.id, required this.gejala, required this.deskripsi});
}

List<Gejalanfisik> GejalaList = [
  Gejalanfisik(
      id: 1,
      gejala: "1. Demam Tinggi",
      deskripsi:
          "Sapi yang terkena PMK biasanya mengalami luka lepuh di area lidah, bibir, mulut, gusi, selaput lendir pipi, langit-langit mulut, dan hidung. Akibat dari parahnya luka lepuh tersebut menyebabkan demam hingga 40-41 derajat celcius pada sapi yang terkena PMK."),
  Gejalanfisik(
      id: 2,
      gejala: "3. Mengalami Penurunan Nafsu Makan dan Berat Badan",
      deskripsi:
          "Sapi yang terkena PMK akan mengalami penurunan berat badan dikarenakan demam dan luka lepuh yang dialami akibat PMK membuat hewan stres dan kehilangan nafsu makan. Pada sapi usia muda, kondisi ini akan menyebabkan pertumbuhan dan perkembangannya terganggu. Bahkan berdasarkan WOAH (World Organisation for Animal Health) sapi yang berusia muda lebih rentan mengalami kematian akibat PMK dibandingkan dengan sapi dewasa."),
  Gejalanfisik(
      id: 3,
      gejala: "4. Sapi Sering Menggeretakkan Gigi dan Menggosokkan Lidah",
      deskripsi:
          "Sapi sering menggeretakkan gigi dan lidah dikarenakan menahan sakit akibat luka lepuh yang berada pada area lidah, bibir, mulut, gusi, selaput lendir pipi, dan langit-langit pada mulut sapi"),
  Gejalanfisik(
      id: 4,
      gejala: "5. Sapi Sering Menendangkan Kaki ",
      deskripsi:
          "Sapi sering menendangkan kaki dikarenakan luka pada sela antar kuku kaki sapi"),
];
