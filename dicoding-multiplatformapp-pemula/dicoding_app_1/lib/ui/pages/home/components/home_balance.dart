
import 'package:flutter/material.dart';

class HomeBalanceWidget extends StatelessWidget {
  const HomeBalanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 29),
            child: Text(
              "Total Balance",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xFF676C71)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              "Rp. 2.000.000",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
