import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:melaka_wanderlust/pages/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MembershipPromotionsPage extends StatefulWidget {
  final String userMembershipType;


  MembershipPromotionsPage({required this.userMembershipType});

  @override
  _MembershipPromotionsPageState createState() => _MembershipPromotionsPageState();
}

class _MembershipPromotionsPageState extends State<MembershipPromotionsPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? username = '';

  void changeMembership(String newMembershipType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Membership Change'),
          content: Text(
              'Are you sure you want to change your membership to $newMembershipType?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () async {
                // Update the user's membership type in Firestore
                await _firestore.collection('users').doc(username).update(
                    {'membershipType': newMembershipType});

                // Navigate to the user's profile page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Membership Promotion'),
        backgroundColor: Colors.orange,


      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('promotions').orderBy(
            'title', descending: false).snapshots(),
        // Modified to get all promotions
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Text('No promotions available.');
          }

          // Grouping promotions by membership type
          Map<String, List<DocumentSnapshot>> groupedPromotions = {};
          for (var doc in snapshot.data!.docs) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            String membershipType = data['membershipType'];
            groupedPromotions[membershipType] =
                groupedPromotions[membershipType] ?? [];
            groupedPromotions[membershipType]!.add(doc);
          }


          return ListView(
            children: groupedPromotions.entries.map((entry) {
              String membershipType = entry.key;
              List<DocumentSnapshot> docs = entry.value;

              return Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(
                      10.0),
                ),

                child: ExpansionTile(
                  title: Text(membershipType,
                    style: TextStyle(
                      color: Colors.orange, // Change the color here
                      fontSize: 35, // Change font size here
                    ),
                  ),
                  children: [
                    ...docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data = document.data() as Map<
                          String,
                          dynamic>;
                      return PromotionTile(
                        title: data['title'],
                        description: data['description'],
                        imageUrl: data['imageUrl'],
                      );
                    }).toList(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: Text('Change to $membershipType'),
                        onPressed: () => changeMembership(membershipType),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          onPrimary: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class PromotionTile extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  PromotionTile({required this.title, required this.description, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: imageUrl.isNotEmpty ? Image.network(imageUrl,
          height: 100,
          width: 100,
          fit: BoxFit.cover, ) : null,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            Text(
              description,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),

      ),
    );
  }
}
