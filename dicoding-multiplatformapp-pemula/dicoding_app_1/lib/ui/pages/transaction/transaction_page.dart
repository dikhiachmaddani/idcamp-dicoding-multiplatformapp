import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'components/home_container.dart';
import 'components/home_balance.dart';
import 'components/small_dropdown.dart';

class TransactionPage extends ConsumerStatefulWidget {
  const TransactionPage({super.key});

  @override
  ConsumerState<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends ConsumerState<TransactionPage> {
  final ScrollController _scrollController = ScrollController();
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40),
    _SalesData('Jun', 12),
    _SalesData('Jul', 10),
    _SalesData('Aug', 30),
  ];

  late double allTimeHigh;
  late double allTimeLow;

  @override
  void initState() {
    super.initState();
    allTimeHigh = data.map((ath) => ath.sales).reduce((a, b) => a > b ? a : b);
    allTimeLow = data.map((atl) => atl.sales).reduce((a, b) => a < b ? a : b);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: 620,
              left: 250,
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Color(0xfff3f4f9),
                  BlendMode.multiply,
                ),
                child: Image.asset(
                  'assets/background.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                const SliverAppBar(
                  backgroundColor: Colors.transparent,
                  pinned: true,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Column(
                      children: [
                        const SmallDropdownWidget(),
                        const HomeBalanceWidget(),
                        SizedBox(
                          height: 200,
                          child: SfCartesianChart(
                              borderColor: Colors.transparent,
                              borderWidth: 0,
                              plotAreaBorderColor: Colors.transparent,
                              plotAreaBackgroundColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              primaryXAxis: const CategoryAxis(
                                isVisible: false,
                              ),
                              primaryYAxis: const NumericAxis(
                                isVisible: false,
                              ),
                              legend: const Legend(isVisible: false),
                              tooltipBehavior: TooltipBehavior(enable: false),
                              series: <CartesianSeries<_SalesData, String>>[
                                SplineSeries<_SalesData, String>(
                                    color: Colors.black,
                                    dataSource: data,
                                    xValueMapper: (_SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (_SalesData sales, _) =>
                                        sales.sales,
                                    name: 'Sales',
                                    markerSettings: const MarkerSettings(
                                      isVisible: true,
                                      width: 10,
                                      height: 10,
                                    ),
                                    dataLabelSettings: const DataLabelSettings(
                                        isVisible: false)),
                              ]),
                        ),
                        HomeCointainerWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
