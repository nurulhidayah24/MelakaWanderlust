import 'package:flutter/material.dart';
import 'package:melaka_wanderlust/pages/promotions/promotions_page.dart';
import 'package:melaka_wanderlust/pages/review/high_reviews.dart';
import 'package:melaka_wanderlust/pages/tips_advice/local_advice.dart';
import 'package:melaka_wanderlust/pages/tips_advice/local_advice_malay.dart';
import 'package:melaka_wanderlust/pages/profile.dart';
import 'package:melaka_wanderlust/pages/tips_advice/travel_tips_malay.dart';
import 'package:melaka_wanderlust/pages/tips_advice/travel_tips.dart';
import 'package:melaka_wanderlust/pages/promotions/promotion.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/nav_bar.dart';
import '../home.dart';
import '../wishlist.dart';

class TipsAndAdviceScreen extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Tips and advice '),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Travel Tips (English)'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TravelTipsScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Local advice (English)'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LocalAdviceScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Travel Tips (Malay)'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TravelTipsScreenMalay()),
              );
            },
          ),
          ListTile(
            title: Text('Local advice (Malay)'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LocalAdviceScreenMalay()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 4,
        onTap: (index) async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          emailController.text = prefs.getString('username')!;
          switch (index) {
            case 0:
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
              break;
            case 1:
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HighRatedLocationsPage(),
                ),
              );
              break;
            case 2:
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>
                      WishlistPage(username: emailController.text),
                ),
              );
              break;
            case 3:
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => PromotionsScreen(),
                ),
              );
            case 4:
              break;
            case 5:
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
              break;
          }
        },
      ),
    );
  }
}