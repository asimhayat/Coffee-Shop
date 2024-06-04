import 'package:flutter/material.dart';
import 'package:coffeeshop/widgets/searchbar.dart';

class HeaderParts extends StatefulWidget {
  const HeaderParts({super.key});

  @override
  State<HeaderParts> createState() => _HeaderPartsState();
}

class _HeaderPartsState extends State<HeaderParts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const itemstab(),
        SizedBox(
          height: 5,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
