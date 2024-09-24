import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'events_page.dart';

class HomePage extends StatelessWidget {
  // Card data similar to your React component
  final List<Map<String, String>> cards = [
    {
      'image':
      'https://global.discourse-cdn.com/business6/uploads/codeorgforum/original/2X/5/5850a08813648555f34c29bea7b6d1de15f01655.gif',
      'title': 'Web Development',
      'description':
      'Focuses on empowering students to build responsive, user-friendly websites and web applications using modern web technologies and frameworks.',
      'path': '/web-development',
    },
    {
      'image':
      'https://cdn.dribbble.com/users/330915/screenshots/3587000/10_coding_dribbble.gif',
      'title': 'Competitive Programming',
      'description':
      'Cultivates competitive programming skills, encouraging students to hone their algorithmic problem-solving abilities, participate in coding competitions, and develop efficient solutions to real-world challenges.',
      'path': '/competitive-programming',
    },
    {
      'image':
      'https://connect.ignatiuz.com/hs-fs/hubfs/AI%20and%20Deep%20Learning.gif?width=1000&name=AI%20and%20Deep%20Learning.gif',
      'title': 'Machine Learning',
      'description':
      'Immerses students in the intricacies of Machine Learning, motivating them to delve into and apply sophisticated algorithms, conduct data analysis, and create predictive models to address intricate problems.',
      'path': '/machine-learning',
    },
    {
      'image':
      'https://mir-s3-cdn-cf.behance.net/project_modules/hd/ea5d0476339699.5c6694d453222.gif',
      'title': 'Management',
      'description':
      'Provides students with leadership and organizational skills, fostering a community that not only excels in technical expertise but also effectively manages projects, events, and teams.',
      'path': '/management',
    },
    {
      'image':
      'https://cdn.dribbble.com/users/3943049/screenshots/14032596/media/9e39cf22d33b4d2b77e9f270f2f06f6e.gif',
      'title': 'Design',
      'description':
      'Engages students in learning and applying best practices to secure digital systems, prevent cyber threats, and promote online safety.',
      'path': '/design',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.network(
              'https://cdn-images-1.medium.com/max/578/1*vZVM7utCuRiZ6-HDsNeYUA@2x.png',
              fit: BoxFit.contain,
              height: 40,
            ),
            SizedBox(width: 8),
            Text(
              'GDGC VNRVJIET',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                ),
              ),
              ListTile(
                title: Text(
                  'Upcoming Events',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventsPage()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Profile',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'What we do, at GDSC VNRVJIET:',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            ...cards.map((card) {
              final index = cards.indexOf(card);
              return Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.network(
                        card['image']!,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              card['title']!,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: getTitleColor(index),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              card['description']!,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            SizedBox(height: 20),
            Text(
              'Join us, at GDSC.',
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Discover amazing events and connect with like-minded people.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Color getTitleColor(int index) {
    const colors = [
      Color(0xFF0F71F2),
      Color(0xFF318C07),
      Color(0xFFF2A20C),
      Color(0xFFD92929)
    ];
    return colors[index % colors.length];
  }
}
