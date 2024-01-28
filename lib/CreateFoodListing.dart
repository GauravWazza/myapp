import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Food Listing',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: CreateFoodListing(),
    );
  }
}

class CreateFoodListing extends StatefulWidget {
  @override
  _CreateFoodListingState createState() => _CreateFoodListingState();
}

class _CreateFoodListingState extends State<CreateFoodListing> {
  bool isPickupOnly = false;
  bool isDeliveryAvailable = false;
  String foodType = 'veg'; // 'veg' or 'non-veg'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Food Listing'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            // Handle back action
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Food Item Name :',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Quantity :',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Expiration Date :',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Location :',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Contact Information :',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Description :',
                border: OutlineInputBorder(),
              ),
            ),
            CheckboxListTile(
              title: Text('Pickup Only: Food item can only be picked up by the recipient.'),
              value: isPickupOnly,
              onChanged: (bool? value) {
                setState(() {
                  isPickupOnly = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              title: Text('Delivery Available: Food item can be delivered to the recipient.'),
              value: isDeliveryAvailable,
              onChanged: (bool? value) {
                setState(() {
                  isDeliveryAvailable = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: 'veg',
                  groupValue: foodType,
                  onChanged: (String? value) {
                    setState(() {
                      foodType = value!;
                    });
                  },
                ),
                const Text('VEG', style:TextStyle(color: Colors.green)),
                Radio(
                  value: 'non-veg',
                  groupValue: foodType,
                  onChanged: (String? value) {
                    setState(() {
                      foodType = value!;
                    });
                  },
                ),
                const Text('NON-VEG', style:TextStyle(color: Colors.red)),
              ],
            ),
            ElevatedButton(
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.greenAccent, // Neon-like text color
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                // Handle form submission
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Button background color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}