import 'package:flutter/material.dart';
import 'package:myapp/CreateFoodListing.dart';
import 'package:myapp/NotificationPage.dart';
import 'package:myapp/DonationSummary.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Donation App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DonationScreen(),
    );
  }
}

class DonationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/32_human.jpg'),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 5),
                Text(
                  'Manly Restaurant',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.black,
                      size: 14,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '22 Manly st, Manly, 2095',
                      style: TextStyle(color: Colors.black, fontSize: 9),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.message,
              color: Colors.black,
            ),
            onPressed: () {
              // Handle the onPressed event for the message icon
              // For example, navigate to a chat screen
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Donation Summary',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Food Request',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Welcome To',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  Text(
                    'Meal Bridge',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Image.asset('assets/46519.jpg'), // Add your local image here
                  SizedBox(height: 20.0),
                  Text(
                    "Let's Tackle Food Waste And Ensure No One Goes Hungry.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 40.0),

                ],
              ),
            ),
          ),
        ],
      ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateFoodListing()),
            );
          },
          label: Row(
            children: <Widget>[
              Text('Donate Food', style: TextStyle(
                color: Colors.white, // The text color is set to white
              ),
              ), // The text that appears before the icon
              SizedBox(width: 10),  // Space between text and icon
              Icon(Icons.add, color: Colors.greenAccent),     // The icon
            ],
          ),
          backgroundColor: Colors.black,
        ),

        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Home button
              InkWell(
                onTap: () {
                  // Handle tap
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationPage()),
                  );
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




