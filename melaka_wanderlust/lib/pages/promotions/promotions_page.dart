import 'package:flutter/material.dart';
import 'package:melaka_wanderlust/pages/promotions/membership_promotions.dart';
import 'package:melaka_wanderlust/pages/review/high_reviews.dart';
import 'package:melaka_wanderlust/pages/profile.dart';
import 'package:melaka_wanderlust/pages/promotions/promotion.dart';
import 'package:melaka_wanderlust/pages/wishlist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../components/nav_bar.dart';
import '../home.dart';
import '../tips_advice/tips_and_advice.dart';

class PromotionsScreen extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Promotions '),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          ListTile(
            leading: Image.network('https://cdn-icons-png.flaticon.com/512/1055/1055641.png'),
            title: Text('Membership Promotions'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MembershipPromotionsPage(userMembershipType: '',)),
              );
            },
          ),
          SizedBox(height: 30),
          ListTile(
            leading: Image.network('https://cdn-icons-png.flaticon.com/512/5673/5673350.png'),
            title: Text('Promotions'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PromotionScreen()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 3,
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
              break;
            case 4:
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => TipsAndAdviceScreen(),
                ),
              );
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