import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  final List<Map<String, String>> _events = [
    {
      'name': 'Webathon3.O',
      'startDate': 'To be announced',
      'venue': 'VNRVJIET',
      'description': 'Webathon 2024, an exciting marathon of web development...',
    },
    {
      'name': 'Tensor Flow',
      'startDate': 'To be announced',
      'venue': 'VNRVJIET',
      'description': 'Join us for an in-depth TensorFlow Workshop...',
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
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _notifyAboutEvent(context, _events[index]['name']!);
                          },
                          child: Text('Notify me'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _registerForEvent(context, _events[index]['name']!);
                          },
                          child: Text('Register now'),
                        ),
                      ],
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

  void _notifyAboutEvent(BuildContext context, String eventName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Notification'),
          content: Text('You will be notified about $eventName.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _registerForEvent(BuildContext context, String eventName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Register for $eventName'),
          content: Text('Thank you for registering for $eventName.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
