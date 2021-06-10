import 'package:flutter/material.dart';

import '../components/pokemon_details_moves.dart';
import '../components/pokemon_details_stats.dart';
import '../components/pokemon_details_about.dart';
import '../theme/styles.dart';

class PokemonDetailsBody extends StatefulWidget {
  @override
  _PokemonDetailsBodyState createState() => _PokemonDetailsBodyState();
}

class _PokemonDetailsBodyState extends State<PokemonDetailsBody> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: Text('About', style: ThemeText.tabText,),
                    ),
                    Tab(
                      child: Text('Stats', style: ThemeText.tabText,),
                    ),
                    Tab(
                      child: Text('Moves', style: ThemeText.tabText,),
                    ),
                    Tab(
                      child: Text('Evolutions', style: ThemeText.tabText,),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: PokemonDetailsAbout(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: PokemonDetailsStats(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: PokemonDetailsMoves(),
                      ),
                      Text('Evolutions'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          top: -220,
          child: Align(
            alignment: Alignment.topCenter,
            child: Image(
              image: AssetImage('assets/images/25.png'),
              height: 270,
            ),
          ),
        ),
      ],
    );
  }
}