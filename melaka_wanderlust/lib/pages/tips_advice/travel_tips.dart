import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TravelTipsScreen extends StatelessWidget {
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
                'Pack Smartly',
                textColor: Colors.deepOrangeAccent),

            AdviceItemWithVideo(
              tip: '1. How To Pack Light For A Long Trip.',
              videoUrl: 'https://www.youtube.com/watch?v=Eqc4A3J5rWg&t=12s ',
              textColor: Colors.black,
            ),

            AdviceItemWithVideo(
              tip: '2. Don\'t forget essential items like '
                  'chargers, medications, and toiletries.',
              videoUrl: 'https://www.youtube.com/watch?v=KNhLjhjZj3w',
              textColor: Colors.black,
            ),

            SectionTitle(
                'Stay Safe',
                textColor: Colors.deepOrangeAccent),

            AdviceItemWithVideo(
              tip: '1. How to Keep Valuables Safe While Traveling.',
              videoUrl: 'https://www.youtube.com/watch?v=sTJg5EsDdQE',
              textColor: Colors.black,
            ),

            AdviceItemWithVideo(
              tip: '2. How Can I Stay Safe When Travelling Alone?'
                  ' | Solo Travel Safety Tips.',
              videoUrl: 'https://www.youtube.com/watch?v=tG-TD4iVhag ',
              textColor: Colors.black,
            ),

            SectionTitle(
                'Travel on a Budget',
                textColor: Colors.deepOrangeAccent),

            AdviceItemWithVideo(
              tip: '1. Top 10 Budget Hotels in Melaka.',
              videoUrl: 'https://www.youtube.com/watch?v=88CwmwmQAxY',
              textColor: Colors.black,
            ),

            AdviceItemWithVideo(
              tip: '2. Take advantage of free or low-cost '
                  'activities and attractions.',
              videoUrl: 'https://www.youtube.com/watch?v=VBgA73L9aR4',
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

  SectionTitle(
      this.title,
      {this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: textColor,
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
