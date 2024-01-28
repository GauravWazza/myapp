import 'package:flutter/material.dart';
import 'package:myapp/NotificationPage.dart';
import 'package:myapp/CreateFoodListing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Donation Summary',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DonationSummary(),
    );
  }
}

class DonationSummary extends StatelessWidget {
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
      body: SingleChildScrollView(
    child: Column(
    children: <Widget>[
        SizedBox(height: 20),
    IntrinsicHeight(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
    SummaryCard(
    color: Colors.purple,
    icon: Icons.money,
    title: 'Total Donations',
    value: '3',
    ),
    SummaryCard(
    color: Colors.blue,
    icon: Icons.people,
    title: 'Meal Served To People',
    value: '60+',
    ),
    ],
    ),
    ),
    SizedBox(height: 20),
    FoodListing(),
    ],
    ),
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

class SummaryCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String value;

  const SummaryCard({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: <Widget>[
            Icon(icon, size: 50, color: Colors.white),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              value,
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Current Food Listing',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Date: 28-1-2024'),
            SizedBox(height: 16),
            Text('Food Item: Chicken Burger'),
            Text('Quantity: 30 Servings'),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    // Handle viewing details
                  },
                  child: Text('View All Details'),
                ),
                TextButton(
                  onPressed: () {
                    // Handle editing details
                  },
                  child: Text('Edit Details'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}