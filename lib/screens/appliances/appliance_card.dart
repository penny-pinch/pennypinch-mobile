import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pennypinch/helpers/get_appliance_icon.dart';

class ApplianceCard extends StatefulWidget {
  ApplianceCard({super.key, required this.appliance, required this.showAlert});
  Map appliance;
  Function showAlert;

  @override
  State<ApplianceCard> createState() => _ApplianceCardState();
}

class _ApplianceCardState extends State<ApplianceCard> {
  late Widget alertWidget;
  bool showblur = false;

  @override
  Widget build(BuildContext context) {
    return GFCard(
      boxFit: BoxFit.cover,
      gradient: LinearGradient(
        colors: [
          Color(0xFFE0E1E5),
          Color.fromARGB(255, 224, 225, 229),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      titlePosition: GFPosition.start,
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      title: GFListTile(
        avatar: getApplianceIcon(widget.appliance['name']),
        title: Text(
          widget.appliance['name'],
          style: GoogleFonts.mulish(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xff00082e)),
        ),
        subTitle: Text(
          "${widget.appliance['consumption']}KW",
          style: const TextStyle(
            wordSpacing: 2,
            fontSize: 12,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
      buttonBar: GFButtonBar(
        children: <Widget>[
          GFButton(
            onPressed: () {},
            fullWidthButton: true,
            icon: const Icon(
              Icons.add,
              color: Color(0xff00082e),
            ),
            color: Color(0xff00082e),
            shape: GFButtonShape.pills,
            type: GFButtonType.outline,
            text: "Schedule",
            textStyle: GoogleFonts.mulish(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xff00082e)),
            textColor: Color(0xff00082e),
          ),
          GFButton(
            onPressed: () {
              widget.showAlert(widget.appliance);
            },
            icon: const Icon(
              Icons.electric_bolt,
              color: Color(0xffffbe33),
            ),
            color: Color(0xff00082e),
            shape: GFButtonShape.pills,
            fullWidthButton: true,
            type: GFButtonType.outline,
            text: "Run now",
            textStyle: GoogleFonts.mulish(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xff00082e)),
            textColor: Color(0xff00082e),
          ),
        ],
      ),
    );
  }
}
