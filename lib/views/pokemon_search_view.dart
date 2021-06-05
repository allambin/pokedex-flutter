import 'package:flutter/material.dart';

import '../widgets/search_bar.dart';

// import '../services/pokemon_api.dart';
// import './pokemon_details_view.dart';

class PokemonSearchView extends StatefulWidget {
  static const routeName = '/pokemon-search';

  @override
  _PokemonSearchViewState createState() => _PokemonSearchViewState();
}

class _PokemonSearchViewState extends State<PokemonSearchView> {
  // PokemonApi api = PokemonApi();
  // var _isLoading = false;
  // var _kNames = [];
  
  // @override
  // void initState() {
  //   _isLoading = true;
  //   Future.delayed(Duration.zero, () async {
  //     var names = await api.fetchPokemonNames();
  //     setState(() {
  //       _kNames = names;
  //       _isLoading = false;
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('Pokedex'),
            Text('Search for a Pokemon by name'),
            SearchBar(),
          ],
        ),
      ),
      // body: Center(
      //   child: Padding(
      //     padding: const EdgeInsets.all(20.0),
      //     child: Column(
      //       children: [
      //         Image.asset('assets/images/pokedex.png'),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         Text('Search a Pokemon'),
      //         Autocomplete<String>(
      //           optionsBuilder: (TextEditingValue value) {
      //             if (value.text == '') {
      //               return const Iterable<String>.empty();
      //             }
      //             return _kNames.where((element) => element.contains(value.text.toLowerCase()));
      //           },
      //           onSelected: (selected) => Navigator.of(context).pushNamed(PokemonDetailsView.routeName, arguments: selected)
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}