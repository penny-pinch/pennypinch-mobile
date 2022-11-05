import 'package:flutter/material.dart';
import 'package:pennypinch/screens/appliances/appliance_card.dart';
import 'package:pennypinch/services/firestore_services.dart';
import 'package:pennypinch/shared/loader.dart';

class AppliancesScreen extends StatelessWidget {
  AppliancesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: FirestoreService().getAppliances(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('$snapshot.error'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          } else if (snapshot.hasData) {
            var appliances = snapshot.data!;
            if (appliances.isEmpty) {
              return Center(
                child: Column(children: const [
                  SizedBox(
                    height: 240,
                  ),
                  Icon(Icons.folder_off_outlined),
                  Text("No appliances")
                ]),
              );
            }

            return Container(
              margin: const EdgeInsets.only(
                top: 2,
              ),
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                children: appliances
                    .map((appliance) => ApplianceCard(appliance: appliance))
                    .toList(),
              ),
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
