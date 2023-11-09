import 'package:flutter/material.dart';
import 'package:pemmob_app/utils/constants.dart';

class InboxScreen extends StatelessWidget {
  InboxScreen({super.key});

  final titles = [
    "Zaky",
    "Dapeng",
    "Mahzuz",
    "Pa Yusuf",
    "Ploy",
    "Azkoi",
    "Abang galon",
    "Andi",
    "Jamal",
    "Azriel",
    "Himpunan",
    "Proker",
    "Pa Galih",
    "Bu Dewi",
  ];
  final subtitles = [
    "Tispen dong bang",
    "p libas",
    "Caw?",
    "Kapan nih bimbingan?",
    "kawan",
    "kawan",
    "A pesen galon ke kamar 14b",
    "Ke rinjani ga bang?",
    "Big Data kumaha?",
    "Tipsen Kus",
    "Ges hari ini rapat ya",
    "Jangan lupa minta nomor surat",
    "All... Untuk Pemorgraman Mobile silahkan diperhatikan untuk utsnya..",
    "silahkan jika mau bimbingan kabari saya",
  ];
  final icons = [
    Icons.ac_unit,
    Icons.access_alarm,
    Icons.access_time,
    Icons.access_time,
    Icons.access_time,
    Icons.access_time,
    Icons.access_time,
    Icons.access_time,
    Icons.access_time,
    Icons.access_time,
    Icons.access_time,
    Icons.access_time,
    Icons.access_time,
    Icons.access_time,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kSubBackgroundColor,
          elevation: 0,
          title: const Center(
            child: Text(
              'List View Menu',
              style: TextStyle(
                  color: kTextColorBlack,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('${titles[index]} pressed!'),
                        ));
                      },
                      title: Text(titles[index]),
                      subtitle: Text(subtitles[index]),
                      leading: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                      trailing: Icon(icons[index])));
            }));
  }
}
