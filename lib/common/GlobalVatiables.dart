import 'package:flutter/material.dart';

class GlobalVariables {
  static const baseUrl = 'http://192.168.100.6:1337';
  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Tas Wanita',
      'image': 'assets/images/tas_wanita.jpg',
    },
    {
      'title': 'Tas Pria',
      'image': 'assets/images/tas_pria.jpg',
    },
    {
      'title': 'Tas Sekolah',
      'image': 'assets/images/tas_sekolah.jpg',
    },
    {
      'title': 'Tas Pesta',
      'image': 'assets/images/tas_pesta.jpg',
    },
    {
      'title': 'Tas Anak',
      'image': 'assets/images/tas_anak.jpg',
    },
  ];

  static const List<String> bannerImages = [
    'https://storage.googleapis.com/astro-site/home/new-user.webp',
    'https://storage.googleapis.com/astro-site/home/24jam.webp',
  ];

  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Color.fromARGB(255, 66, 122, 219);
  static var PrimaryColor = Color.fromARGB(255, 66, 122, 219);
  static const unselectedNavBarColor = Colors.black87;
}
