import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LocalAdviceScreenMalay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Local Advice (Malay)'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(
                'Teroka Makanan Tempatan',
                textColor: Colors.deepOrangeAccent),

            AdviceItemWithVideo(
              tip: '1. Tempat Makan Menarik di Melaka | '
                  'Sarapan, Tengah Hari, Makan Malam Menarik di Melaka.',
              videoUrl: 'https://www.youtube.com/watch?v=VYp70hTd1cs',
              textColor: Colors.black,
            ),

            AdviceItemWithVideo(
              tip: '2. 10 Teratas Tempat Makan Menarik di Melaka.',
              videoUrl: 'https://www.youtube.com/watch?v=GApa9uM6Xtk',
              textColor: Colors.black,
            ),

            SectionTitle(
                'Adat-adat dan Sejarah di Melaka',
                textColor: Colors.deepOrangeAccent),

            AdviceItemWithVideo(
              tip: '1. Sejarah Adat Budaya & Penggunaan '
                  'Bahasa Melayu Melaka di Perairan Asia Tenggara.',
              videoUrl: 'https://www.youtube.com/watch?v=-juGE3axBCM',
              textColor: Colors.black,
            ),

            AdviceItemWithVideo(
              tip: '2. Macam mana ada etnik Portugis di Melaka?.',
              videoUrl: 'https://www.youtube.com/watch?v=BufRD2Eb6kM',
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final Color textColor;

  SectionTitle(this.title, {this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
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
      padding: EdgeInsets.symmetric(vertical: 8.0),
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
                color: textColor),
          ),
        ],
      ),
    );
  }
}
