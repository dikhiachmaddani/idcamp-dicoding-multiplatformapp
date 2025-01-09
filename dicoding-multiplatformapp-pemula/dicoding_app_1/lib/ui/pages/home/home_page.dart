import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/home_container.dart';
import 'components/home_balance.dart';
import 'components/small_dropdown.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
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
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Column(
                      children: [
                        const SmallDropdownWidget(),
                        const HomeBalanceWidget(),
                        HomeCointainerWidget(),
                       
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
