import 'package:flutter/material.dart';
import 'package:myapp/DonationSummary.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationPage(),
    );
  }
}

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Handle back button press
              Navigator.of(context).pop();
            },
          ),
          titleSpacing: 0.0, // Reduces the default spacing
          title: Text('Notification', style: TextStyle(fontSize: 20.0)),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                // Handle menu button press
              },
            ),
          ],
        ),
      body: ListView(
        children: <Widget>[
          NotificationTile(
            logo: 'assets/6724545.jpg', // Replace with your asset image
            title: 'Variety - The Children’s Charity NSW & ACT',
            message: 'has expressed interest in your food donation listing for chicken burger.',
            timeAgo: '5 min ago',
            showButtons: true,
          ),
          NotificationTile(
            logo: 'assets/89.jpeg', // Replace with your asset image
            title: 'Congratulations!',
            message: 'Your food listing for chicken burger has been successfully created. Start making a difference by sharing your unused food with those in need.',
            timeAgo: '10 min ago',
            showButtons: false,
          ),
        ],
      ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Home button
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.home, color: Colors.white),
                    Text('Home', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              // My Donation button
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DonationSummary()),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.person, color: Colors.white),
                    Text('My Donation', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              // Notification button
              InkWell(
                onTap: () {

                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.notifications, color: Colors.white),
                    Text('Notifications', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String logo;
  final String title;
  final String message;
  final String timeAgo;
  final bool showButtons;

  const NotificationTile({
    Key? key,
    required this.logo,
    required this.title,
    required this.message,
    required this.timeAgo,
    this.showButtons = false,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(logo),
              ),
              title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(message),
              trailing: Text(timeAgo, style: TextStyle(color: Colors.grey)),
            ),
            if (showButtons) Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    // Handle Accept action
                  },
                  child: Text('Accept'),
                  style: TextButton.styleFrom(
                    primary: Colors.greenAccent,
                    backgroundColor: Colors.black,
                  ),
                ),
                SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    // Handle Decline action
                  },
                  child: Text('Decline'),
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}