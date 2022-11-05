import 'package:flutter/material.dart';

class ApplianceCard extends StatelessWidget {
  ApplianceCard({super.key, required this.appliance});
  Map appliance;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      child: ListTile(
        tileColor: const Color.fromRGBO(164, 177, 191, 0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Container(
            margin: const EdgeInsets.only(top: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  appliance['name'],
                  style: const TextStyle(
                    letterSpacing: 1.2,
                    color: Color(0xff153F6F),
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                  color: Color(0xff153F6F),
                ),
              ],
            )),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                  width: 140,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    child: LinearProgressIndicator(
                      value: appliance['consumption'] / 4.0,
                      backgroundColor: Color(0xffF5F5F5),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        appliance['consumption'] > 2
                            ? Color.fromARGB(255, 159, 40, 31)
                            : appliance['consumption'] > 1
                                ? Color(0xffDBAC06)
                                : Color.fromARGB(255, 204, 236, 22),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                        left: 25,
                      ),
                      child: Text(
                        "${appliance['consumption']} kW",
                        style: const TextStyle(
                            color: Color(0xff153F6F),
                            fontWeight: FontWeight.w700),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
