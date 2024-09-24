import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'events_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> cards = [
    {
      'image': 'assets/images/webdev.gif',
      'title': 'Web Development',
      'description': 'Focuses on empowering students to build responsive, user-friendly websites and web applications using modern web technologies and frameworks.',
    },
    {
      'image': 'assets/images/cp.gif',
      'title': 'Competitive Programming',
      'description': 'Cultivates competitive programming skills, encouraging students to hone their algorithmic problem-solving abilities, participate in coding competitions, and develop efficient solutions to real-world challenges.',
    },
    {
      'image': 'assets/images/ml.webp',
      'title': 'Machine Learning',
      'description': 'Immerses students in the intricacies of Machine Learning, motivating them to delve into and apply sophisticated algorithms, conduct data analysis, and create predictive models to address intricate problems.',
    },
    {
      'image': 'assets/images/management.gif',
      'title': 'Management',
      'description': 'Provides students with leadership and organizational skills, fostering a community that not only excels in technical expertise but also effectively manages projects, events, and teams.',
    },
    {
      'image': 'assets/images/design.gif',
      'title': 'Design',
      'description': 'Engages students in learning and applying best practices to secure digital systems, prevent cyber threats, and promote online safety.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/gdgc_logo.png',
              fit: BoxFit.contain,
              height: 30,
            ),
            SizedBox(width: 8),
            Text(
              'GDGC VNRVJIET',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
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
              colors: [Colors.lightBlueAccent.shade100, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.lightBlueAccent.shade100, Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile_photo.jpg'),
                      radius: 30,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'K Varun Venkata Sai',
                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'varunketa2004@gmail.com',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.event, color: Colors.black87),
                title: Text(
                  'Upcoming Events',
                  style: TextStyle(color: Colors.black87),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventsPage()),
                  );
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.person, color: Colors.black87),
                title: Text(
                  'Profile',
                  style: TextStyle(color: Colors.black87),
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'What we do, at GDGC VNRVJIET?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: cards.map((card) {
                      final index = cards.indexOf(card);
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        elevation: 4,
                        shadowColor: Colors.grey.withOpacity(0.3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  card['image']!,
                                  height: 120,
                                  width: 120,
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
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: getTitleColor(index),
                                        ),
                                      ),
                                      SizedBox(height: 8),
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
                        ),
                      );
                    }).toList(),
                  ),
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
      Color(0xFFD92929),
    ];
    return colors[index % colors.length];
  }
}
