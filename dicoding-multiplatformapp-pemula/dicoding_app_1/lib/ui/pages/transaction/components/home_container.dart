import 'package:flutter/material.dart';
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
