import 'package:flutter/material.dart';

class PertolonganModel {
  int id;
  String judul;
  String deskripsi;

  PertolonganModel(
      {required this.id, required this.judul, required this.deskripsi});
}

List<PertolonganModel> PertolonganList = [
  PertolonganModel(
      id: 1,
      judul: "Tindakan Pertama pada Kasus PMK",
      deskripsi:
          "Jika terdapat hewan yang terkena PMK maka segera melaporkan kasus tersebut kepada dinas yang bertanggung jawab dan segera lakukan disinfektan"),
  PertolonganModel(
      id: 2,
      judul:
          "Pencegahan Penularan dan Penyebaran Virus PMK\n\nBiosekuriti Barang",
      deskripsi:
          "Biosekuriti barang dapat dilakukan dengan dua cara yaitu Disposal dan Dekontaminasi. Disposal adalah pemusnahan barang-barang yang terkontaminasi, sedangkan Dekontaminasi adalah semua barang yang masuk kandang perlu disanitasi dengan melakukan disinfeksi, fumigasi, atau disinari lampu ultraviolet"),
  PertolonganModel(
      id: 3,
      judul: "Biosekuriti Kandang",
      deskripsi:
          "Biosekuriti kandang dapat dilakukan melakukan disinfeksi kandang dan peralatan secara berkala setelah selesai digunakan, dan melakukan disinfeksi lingkungan sekitar kandang secara berkala dan dekontaminasi yakni dengan cara mencuci kandang, peralatan, kendaraan, dan bahan-bahan lain yang memungkinkan bisa menularkan PMK dengan cairan yang mengandung asam atau disinfektan."),
  PertolonganModel(
      id: 4,
      judul: "Biosekuriti pada Karyawan Peternakan",
      deskripsi:
          "Biosekuriti pada karyawan peternakan dilakukan dengan menyemprotkan setiap karyawan yang masuk ke dalam kandang dengan disinfektan, kemudian karyawan yang masuk kadang harus ganti baju lengkap dengan seragam (APD), sepatu boot, dan masker."),
  PertolonganModel(
      id: 5,
      judul: "Biosekuriti Tamu Kunjungan",
      deskripsi:
          "Biosekuriti pada tamu kunjungan dimana tamu yang masuk ke kandang harus ganti baju lengkap dengan seragam lengkap (APD), sepatu boot, dan masker, kemudian tamu masuk ke kandang melalui biosecurity spraying dan harus melakukan celup kaki dan cuci tangan di tempat disinfektan kandang"),
  PertolonganModel(
      id: 6,
      judul: "Biosekuriti kendaraan",
      deskripsi:
          "Biosekuriti pada kendaraan dilakukan dengan menyemprot ban dan bagian bawah kendaraan dengan menggunakan larutan disinfektan atau melalui bak dipping kendaraan."),
  PertolonganModel(
      id: 7,
      judul: "Biosekuriti Ternak",
      deskripsi:
          "1. Setiap ternak yang baru masuk ke lokasi peternakan perlu ditempatkan terlebih dulu di kandang karantika/isolasi selama 14 hari dan dilakukan pengamatan yang intensif terhadap gejala penyakit.\n2. Jika terdapat gejala klinis penyakit, maka segera pisahkan dan dimasukkan ke kandang isolasi dan ditangani lebih lanjut oleh petugas kesehatan hewan dan dilaporkan pada dinas peternakan setempat.\n3. Perlindungan pada zona bebas dengan membatasi gerakan hewan, pengawasan lalu lintas dan pelaksanaan surveilans.\n4. Pemotongan hewan terinfeksi, hewan baru sembuh, dan hewan - hewan yang kemungkinan kontak dengan agen PMK.\n5. Musnahkan bangkai, sampah, serta seluruh produk hewan pada area yang terinfeksi.\n6. Pelarangan pemasukan ternak baru dari daerah tertular.\n7. Untuk peternakan yang dekat daerah tertular maka ada anjuran untuk melaksanakan Vaksin virus aktif yang mengandung adjuvant."),
  PertolonganModel(
      id: 8,
      judul: "Pengobatan dan Pengendalian Ternak",
      deskripsi:
          "Bagi ternak yang telah terinfeksi virus, maka ada beberapa metode alternative pengobatan dan pengendalian dengan cara berikut ini: \n\n1. Pengobatan pada sapi yang terinfeksi.\nMelakukan pemotongan jaringan tubuh hewan yang terinfeksi, Kaki yang sudah terinfeksi bisa diterapi dengan chloramphenicol atau larutan cuprisulfat, Hewan yang terserang penyakit harus karantina yakni dipisahkan dari hewan yang sehat selama masa pengobatan,\n\n2. Pencegahan pada sapi yang sehat.\nHewan yang tidak terinfeksi harus ditempatkan dalam kandang yang kering dan dibiarkan bebas jalan-jalan, Berikan pakan yang cukup untuk meningkatkan sistem kekebalan tubuh hewan yang sehat, Pada kaki hewan ternak yang sehat diolesi larutan Cuprisulfat 5% setiap hari selama satu minggu, kemudian setelah itu terapi dilakukan seminggu sekali sebagai cara yang efektif untuk pencegahan PMK pada ternak sapi."),
];
