import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  // Text controllers for Name, Email, and Message
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  String _selectedDomain = 'Web Development'; // Default selected domain

  // FAQ data
  final List<Map<String, dynamic>> _faqData = [
    {
      'question': 'What is GDGC?',
      'answer': 'GDGC is a student-run club focusing on development, programming, and management skills through workshops and events.',
      'expanded': false,
    },
    {
      'question': 'How can I join the club?',
      'answer': 'You can join by attending our events and signing up through the registration forms provided during our sessions.',
      'expanded': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    // Pre-fill name and email with existing data (this can be replaced with actual login info)
    _nameController.text = 'K Varun Venkata Sai';
    _emailController.text = 'varunketa2004@gmail.com';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Contact Form
            Text(
              'Get in Touch',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildTextField('Name', _nameController),
            _buildTextField('Email', _emailController),
            _buildDropdownField(),
            _buildMessageField(),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _submitForm();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button background color
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Submit'),
              ),
            ),
            SizedBox(height: 40),

            // FAQ Section
            Center(
              child: Text(
                'FAQs',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _faqData[index]['expanded'] = !_faqData[index]['expanded'];
                });
              },
              children: _faqData.map<ExpansionPanel>((item) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text(
                        item['question'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                  body: ListTile(
                    title: Text(item['answer']),
                  ),
                  isExpanded: item['expanded'],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build a Text Field with label
  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  // Function to build the domain dropdown field
  Widget _buildDropdownField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField<String>(
        value: _selectedDomain,
        decoration: InputDecoration(
          labelText: 'Domain',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (String? newValue) {
          setState(() {
            _selectedDomain = newValue!;
          });
        },
        items: [
          'General',
          'Web Development',
          'App Development',
          'Competitive Programming',
          'Design',
          'Machine Learning',
          'Management',
          'Cybersecurity',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  // Function to build the message field
  Widget _buildMessageField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: _messageController,
        maxLines: 5,
        decoration: InputDecoration(
          labelText: 'Message',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  // Function to handle form submission
  void _submitForm() {
    String name = _nameController.text;
    String email = _emailController.text;
    String domain = _selectedDomain;
    String message = _messageController.text;

    // For now, we'll just show a dialog with the entered info
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Form Submitted'),
          content: Text(
            'Name: $name\nEmail: $email\nDomain: $domain\nMessage: $message',
          ),
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
