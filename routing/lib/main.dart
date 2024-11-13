import 'package:flutter/material.dart';

void main() => runApp(UserProfileApp());

class UserProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => UserProfileCard(),
        '/contact': (context) => ContactInfo(),
      },
    );
  }
}

class UserProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile Card'),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(16.0),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150'), // Replace with actual image
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'John Doe',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Software Developer',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, '/contact'); // Navigates to ContactInfo
                      },
                      child: Icon(Icons.email, color: Colors.blue),
                    ),
                    Icon(Icons.phone, color: Colors.blue),
                    Icon(Icons.location_on, color: Colors.blue),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Information of the User',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 15), // Added only height for spacing
            Text(
              'Email',
              style: TextStyle(
                fontSize: 24,
                textBaseline: TextBaseline.ideographic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
