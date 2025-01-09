import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SmallDropdownWidget extends StatefulWidget {
  const SmallDropdownWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SmallDropdownWidgetState createState() => _SmallDropdownWidgetState();
}

class _SmallDropdownWidgetState extends State<SmallDropdownWidget> {
  String _selectedItem = "Kantong Utama";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 160,
        child: DropdownButtonFormField<String>(
          icon: const Padding(
            padding: EdgeInsets.only(right: 8),
            child: FaIcon(
              FontAwesomeIcons.angleDown,
              size: 10,
            ),
          ),
          value: _selectedItem,
          onChanged: (String? value) {
            setState(() {
              _selectedItem = value!;
            });
          },
          isExpanded: true,
          style: const TextStyle(fontSize: 16.0, color: Colors.black),
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
            fillColor: Colors.white,
            filled: true,
          ),
          items: [
            'Kantong Utama',
            'Kantong Jajan',
            'Kantong Investasi',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 8.0,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: const BoxDecoration(
                        color: Color(0xFF154617),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.star,
                        size: 10,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      value,
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
