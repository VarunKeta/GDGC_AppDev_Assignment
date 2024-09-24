import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  final List<Map<String, String>> _events = [
    {
      'name': 'Webathon3.O',
      'startDate': 'To be announced',
      'venue': 'VNRVJIET',
      'description': 'Webathon 2024, an exciting marathon of web development, where creativity meets innovation! Whether you\'re a seasoned developer or a passionate beginner, this event is designed to challenge your skills, inspire new ideas, and foster collaboration.',
    },
    {
      'name': 'Tensor Flow',
      'startDate': 'To be announced',
      'venue': 'VNRVJIET',
      'description': 'Join us for an in-depth TensorFlow Workshop, where we will dive into the world of machine learning and deep learning using one of the most powerful frameworks available. This event is perfect for both beginners and advanced practitioners who want to expand their knowledge and skills in TensorFlow.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming GDGC Events'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _events.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _events[index]['name']!,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Date: ${_events[index]['startDate']}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      'Venue: ${_events[index]['venue']}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      _events[index]['description']!,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
