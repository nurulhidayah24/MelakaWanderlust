import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PromotionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: EventPages.months.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Promotions'),
          backgroundColor: Colors.orange,
          bottom: TabBar(
            isScrollable: true,
            tabs: EventPages.months.map((MonthEvents month) {
              return Tab(text: month.month);
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: EventPages.months.map((MonthEvents month) {
            return month;
          }).toList(),
        ),
      ),
    );
  }
}

class EventPages extends StatelessWidget {

  static final List<MonthEvents> months = [
    MonthEvents(
      month: 'January',
      events: [
        EventItem(
          imageName: 'jan1.png',
          eventName: 'Event 1',
          eventDate: '2-7 January 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        EventItem(
          imageName: 'jan2.png',
          eventName: 'Event 2',
          eventDate: '8-11 January 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
      ],
    ),
    MonthEvents(
      month: 'February',
      events: [
        EventItem(
          imageName: 'feb1.png',
          eventName: 'Event 1',
          eventDate: '9 February-12 Mac 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        EventItem(
          imageName: 'feb2png.png',
          eventName: 'Event 2',
          eventDate: '27Feb - 3 Mac 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        EventItem(
          imageName: 'feb3.png',
          eventName: 'Event 3',
          eventDate: '28 February - 3 Mac 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        EventItem(
          imageName: 'feb4.png',
          eventName: 'Event 4',
          eventDate: '2-4 February 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        EventItem(
          imageName: 'feb5.png',
          eventName: 'Event 5',
          eventDate: '20 February 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        EventItem(
          imageName: 'feb6png.png',
          eventName: 'Event 6',
          eventDate: '25 February 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
      ],
    ),

    MonthEvents(
      month: 'April',
      events: [
        EventItem(
          imageName: 'Apr1.png',
          eventName: 'Event 1',
          eventDate: '13 April 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        EventItem(
          imageName: 'Apr2.png',
          eventName: 'Event 2',
          eventDate: '22-28 April 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        // Add more EventItem widgets for April as needed
      ],
    ),
    MonthEvents(
      month: 'May',
      events: [
        EventItem(
          imageName: 'may1.png',
          eventName: 'Event 1',
          eventDate: '10-12 May 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        EventItem(
          imageName: 'may2.png',
          eventName: 'Event 2',
          eventDate: '24-26 May 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        // Add more EventItem widgets for May as needed
      ],
    ),
    MonthEvents(
      month: 'June',
      events: [
        EventItem(
          imageName: 'jun1.png',
          eventName: 'Event 1',
          eventDate: '1-2 June 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        EventItem(
          imageName: 'jun2.png',
          eventName: 'Event 2',
          eventDate: '1-9 June 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        EventItem(
          imageName: 'jun3.png',
          eventName: 'Event 3',
          eventDate: '27-30 June 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        // Add more EventItem widgets for June as needed
      ],
    ),
    MonthEvents(
      month: 'July',
      events: [
        EventItem(
          imageName: 'jul1.png',
          eventName: 'Event 1',
          eventDate: '5-7 July 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        EventItem(
          imageName: 'jul2.png',
          eventName: 'Event 2',
          eventDate: '26-28 July 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        EventItem(
          imageName: 'jul3.png',
          eventName: 'Event 3',
          eventDate: '27-28 July 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        EventItem(
          imageName: 'jul4.png',
          eventName: 'Event 4',
          eventDate: '28 July 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        // Add more EventItem widgets for July as needed
      ],
    ),
    MonthEvents(
      month: 'August',
      events: [
        EventItem(
          imageName: 'aug1.png',
          eventName: 'Event 1',
          eventDate: '3-4 August 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        EventItem(
          imageName: 'aug2.png',
          eventName: 'Event 2',
          eventDate: '10-11 August 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        EventItem(
          imageName: 'aug3.png',
          eventName: 'Event 3',
          eventDate: 'August 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        // Add more EventItem widgets for August as needed
      ],
    ),
    MonthEvents(
      month: 'September',
      events: [
        EventItem(
          imageName: 'sep1.png',
          eventName: 'Event 1',
          eventDate: '14-15 September 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        EventItem(
          imageName: 'sep2.png',
          eventName: 'Event 2',
          eventDate: '27-29 September  2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        // Add more EventItem widgets for September as needed
      ],
    ),
    MonthEvents(
      month: 'October',
      events: [
        EventItem(
          imageName: 'oct1.png',
          eventName: 'Event 1',
          eventDate: 'October 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        EventItem(
          imageName: 'oct2.png',
          eventName: 'Event 2',
          eventDate: '26-27 October 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        // Add more EventItem widgets for October as needed
      ],
    ),
    MonthEvents(
      month: 'November',
      events: [
        EventItem(
          imageName: 'nov1.png',
          eventName: 'Event 1',
          eventDate: '9 November 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        EventItem(
          imageName: 'nov2.png',
          eventName: 'Event 2',
          eventDate: '23-24 November 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        // Add more EventItem widgets for November as needed
      ],
    ),
    MonthEvents(
      month: 'December',
      events: [
        EventItem(
          imageName: 'dec1.png',
          eventName: 'Event 1',
          eventDate: '21-22 December 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        EventItem(
          imageName: 'dec2.png',
          eventName: 'Event 2',
          eventDate: '25-31 December 2024',
          eventLink: 'https://www.visitmelaka.com.my/index.php/download/calendar-of-events',
        ),
        // Add more EventItem widgets for December as needed
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Build your widget here using the 'months' list
    return Container(); // You may replace this with your implementation
  }
}

class MonthEvents extends StatelessWidget {
  final String month;
  final List<EventItem> events;

  MonthEvents({required this.month, required this.events});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            month,
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Column(
            children: events,
          ),
          Divider(), // Add a divider between months for better separation
        ],
      ),
    );
  }
}

class EventItem extends StatelessWidget {
  final String imageName;
  final String eventName;
  final String eventDate;
  final String eventLink;

  EventItem({
    required this.imageName,
    required this.eventName,
    required this.eventDate,
    required this.eventLink,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'lib/images/promotions/$imageName',
            height: 100,
            width: 500,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventName,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Date: $eventDate',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () async {
                    final uri = Uri.parse(eventLink);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Error'),
                          content: Text('Could not launch $eventLink'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                  ),
                  child: Text('View more Details'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

