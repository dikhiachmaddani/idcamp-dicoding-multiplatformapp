import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../widgets/button_link.dart';
import '../components/list_card.dart';

class HomeCointainerWidget extends StatelessWidget {
  final List<Map<String, String>> data = [
    {
      'title': 'Beli Minuman',
      'type': 'Pengeluaran',
      'amount': 'Rp. 1.000.000',
      'date': '13 September 2001',
    },
    {
      'title': 'Bayar Listrik',
      'type': 'Pengeluaran',
      'amount': 'Rp. 500.000',
      'date': '14 September 2001',
    },
    {
      'title': 'Gaji Bulanan',
      'type': 'Pemasukan',
      'amount': 'Rp. 5.000.000',
      'date': '15 September 2001',
    },
  ];

  HomeCointainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      width: double.infinity,
      padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonLinkWidget(
                  title: "Pengeluaran",
                  icon: FontAwesomeIcons.arrowRightFromBracket,
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 225,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize
                                  .min, // This ensures the modal adjusts based on its content
                              children: <Widget>[
                                const Text('Tambahkan Pengeluaran',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                                const SizedBox(
                                    height: 20), // Space between title and form
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 10),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                            labelText: 'Deskripsi',
                                            labelStyle:
                                                const TextStyle(fontSize: 10)),
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Deskripsi tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                        width: 10), // Space between fields
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 10),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                            labelText: 'Nominal',
                                            labelStyle:
                                                const TextStyle(fontSize: 10)),
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Nominal tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                    height:
                                        10), // Space between form and button
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Submit'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
              ButtonLinkWidget(
                  title: "Pemasukan",
                  icon: FontAwesomeIcons.rightToBracket,
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 225,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize
                                  .min, // This ensures the modal adjusts based on its content
                              children: <Widget>[
                                const Text('Tambahkan Pemasukan',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                                const SizedBox(
                                    height: 20), // Space between title and form
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 10),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                            labelText: 'Deskripsi',
                                            labelStyle:
                                                const TextStyle(fontSize: 10)),
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Deskripsi tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                        width: 10), // Space between fields
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 10),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                            labelText: 'Nominal',
                                            labelStyle:
                                                const TextStyle(fontSize: 10)),
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Nominal tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                    height:
                                        10), // Space between form and button
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Submit'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
              ButtonLinkWidget(
                  title: "Scan Struk",
                  icon: FontAwesomeIcons.barcode,
                  onTap: () => Navigator.pushNamed(context, '/comingsoon'))
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    Text(
                      "Latest Transactions",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/transaction'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "See Details",
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const FaIcon(
                          FontAwesomeIcons.chevronRight,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: data.map((item) {
                return ListCardWidget(
                  title: item['title']!,
                  type: item['type']!,
                  amount: item['amount']!,
                  date: item['date']!,
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 300,
          ),
        ],
      ),
    );
  }
}
