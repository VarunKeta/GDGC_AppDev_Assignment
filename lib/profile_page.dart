import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String _name = 'K Varun Venkata Sai';
  String _email = 'varunketa2004@gmail.com';
  String _city = 'Hyderabad';
  String _country = 'India';
  String _linkedin = 'https://www.linkedin.com/in/varunketa/';
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profile_photo.jpg'), // Replace with your asset path
            ),
            SizedBox(height: 20),
            _buildProfileField('Name', _name),
            _buildProfileField('Email', _email),
            _buildProfileField('City', _city),
            _buildProfileField('Country', _country),
            _buildProfileField('LinkedIn', _linkedin, isLink: true),
            SizedBox(height: 30),
            _isEditing ? _buildEditProfileForm() : Container(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, String value, {bool isLink = false}) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: isLink
          ? InkWell(
        onTap: () {
          // Handle LinkedIn link click here
        },
        child: Text(
          value,
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        ),
      )
          : Text(
        value,
        style: TextStyle(fontSize: 16),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
    );
  }

  Widget _buildEditProfileForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            initialValue: _name,
            decoration: InputDecoration(labelText: 'Name'),
            onSaved: (value) {
              _name = value!;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: _email,
            decoration: InputDecoration(labelText: 'Email'),
            onSaved: (value) {
              _email = value!;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: _city,
            decoration: InputDecoration(labelText: 'City'),
            onSaved: (value) {
              _city = value!;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your city';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: _country,
            decoration: InputDecoration(labelText: 'Country'),
            onSaved: (value) {
              _country = value!;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your country';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Save Profile'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                setState(() {
                  _isEditing = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Profile Saved'),
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}
