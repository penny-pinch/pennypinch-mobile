import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/game_icons.dart';
import 'package:iconify_flutter/icons/mdi.dart';

Iconify getApplianceIcon(String name) {
  switch (name) {
    case "Dishwasher":
      {
        return const Iconify(
          Mdi.dishwasher,
          size: 40,
          color: Color(0xff153F6F),
        );
      }
    case "Tumble dryer":
      {
        return const Iconify(
          Mdi.tumble_dryer,
          size: 40,
          color: Color(0xff153F6F),
        );
      }
    case "Washing machine":
      {
        return const Iconify(
          Mdi.washing_machine,
          size: 40,
          color: Color(0xff153F6F),
        );
      }
    case "Electric heater":
      {
        return const Iconify(
          Mdi.radiator,
          size: 40,
          color: Color(0xff153F6F),
        );
      }
    case "Vacuum cleaner":
      {
        return const Iconify(
          GameIcons.vacuum_cleaner,
          size: 40,
          color: Color(0xff153F6F),
        );
      }

    default:
      {
        return const Iconify(
          Mdi.circle,
          size: 40,
          color: Color(0xff153F6F),
        );
      }
  }
}
