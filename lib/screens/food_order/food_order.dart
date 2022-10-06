import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/controllers/firestoreController.dart';
import 'package:project/screens/food_order/order_card.dart';
import 'package:project/styles/pallete.dart';
import '../../models/sell.dart';
import '../../utilities/default_box_decoration.dart';

TextEditingController _searchController = TextEditingController();

class FoodOrder extends StatefulWidget {
  const FoodOrder({super.key});

  @override
  State<FoodOrder> createState() => _FoodOrderState();
}

class _FoodOrderState extends State<FoodOrder> {
  @override
  void dispose() {
    super.dispose();
    _searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: defaultBoxDecoration(Pallete.lightGrey),
                child: TextField(
                  controller: _searchController,
                  cursorColor: Pallete.darkGreen,
                  onSubmitted: (value) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: '  Search by Address',
                    suffixIcon: Icon(Icons.search, color: Pallete.darkGreen),
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _searchController.text.isEmpty
                    ? FirestoreController.getStream()
                    : FirestoreController.searchQuery(_searchController.text),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: Text('Loading...'));
                  }

                  return ListView(
                    children: snapshot.data!.docs
                        .map(
                          (DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;
                            return Card(
                              child: ListTile(
                                title: Text(data['Restaurant Name']),
                                subtitle: Text(data['Restaurant Address']),
                                trailing: Text(data['Selling Price']),
                                onTap: () => showDialog(
                                  context: context,
                                  builder: (context) => OrderCard(
                                    sell: Sell(
                                      data['Restaurant Name'],
                                      data['Contact No.'],
                                      data['Restaurant Address'],
                                      data['Food Details'],
                                      data['Selling Price'],
                                      data['time'],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                        .toList()
                        .cast(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
