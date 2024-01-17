import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TravelTipsScreenMalay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Travel Tips'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(
                title: 'Pek dengan bijak',
                textColor: Colors.deepOrangeAccent),

            AdviceItemWithVideo(
              tip: '1. Tiga Cara Mudah Kemas Baju Untuk Travel.',
              videoUrl: 'https://www.youtube.com/watch?v=ZB_qbgrI3Ok ',
              textColor: Colors.black,
            ),

            AdviceItemWithVideo(
              tip: '2. Barang Wajib Bawa Semasa Melancong | Macam Mana.',
              videoUrl: 'https://www.youtube.com/watch?v=oFPBGjdycyc   ',
              textColor: Colors.black,
            ),

            SectionTitle(
                title: 'Cara berhati-hati ketika melancong',
                textColor: Colors.deepOrangeAccent),

            AdviceItemWithVideo(
              tip: '1. Tips Keselamatan Ketika Melancong.',
              videoUrl: 'https://www.youtube.com/watch?v=AOYjZbditso  ',
              textColor: Colors.black,
            ),
            AdviceItemWithVideo(
              tip: '2. 12 Perkara First Time Traveller Perlu Tahu!.',
              videoUrl: 'https://www.youtube.com/watch?v=LE_78MM_bTE ',
              textColor: Colors.black,
            ),

            SectionTitle(
                title: 'Melancong dengan bajet murah',
                textColor: Colors.deepOrangeAccent),

            AdviceItemWithVideo(
              tip: '1. Kaki Travel Share Rahsia Travel Murah.',
              videoUrl: 'https://www.youtube.com/watch?v=HaGow71PzrI ',
              textColor: Colors.black,
            ),

            AdviceItemWithVideo(
              tip: '2. Bagaimana Melancong dengan Bajet yang Kecil?? '
                  'Petua dan Cara.',
              videoUrl: 'https://www.youtube.com/watch?v=lekQ-UPVoMI',
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class AdviceItemWithVideo extends StatelessWidget {
  final String tip;
  final String videoUrl;
  final Color textColor;

  AdviceItemWithVideo({
    required this.tip,
    required this.videoUrl,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(videoUrl) ?? '',
                  flags: YoutubePlayerFlags(autoPlay: false, mute: false),
                ),
                showVideoProgressIndicator: true,
              ),
            ),
          ),
          SizedBox(height: 12.0),
          Text(
            tip,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final Color textColor;

  SectionTitle({required this.title, this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: textColor),
      ),
    );
  }
}
