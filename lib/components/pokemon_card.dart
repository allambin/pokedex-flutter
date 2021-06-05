import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_card_type.dart';

class PokemonCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Positioned(
        //   child: Card(
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     elevation: 2,
        //     color: Color(0xffF2CB55),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       // crossAxisAlignment: CrossAxisAlignment.stretch,
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text('#025', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
        //               Padding(
        //                 padding: const EdgeInsets.only(top: 5, bottom: 5),
        //                 child: Text('Pikachu', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white,),),
        //               ),
        //               Row(
        //                 children: [
        //                   Padding(
        //                     padding: const EdgeInsets.only(right: 5),
        //                     child: PokemonCardType(),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //         Expanded(
        //           child: Container(
        //             color: Colors.blue,
        //             child: Text(''),
        //           ),
        //         ),
        //         // Container(
        //         //   // height: double.infinity,
        //         //   decoration: BoxDecoration(
        //         //     image: DecorationImage(
        //         //       image: AssetImage("assets/images/pokeball.png"),
        //         //       fit: BoxFit.cover,
        //         //     ),
        //         //   ),
        //         //   child: Text('COUCOU'),
        //         // ),
        //       ],
        //     ),
        //   ),
        // ),
        Positioned(
          child: Container(
            // height: 125,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              color: Color(0xffF2CB55),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  clipBehavior: Clip.hardEdge,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('#025', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text('Pikachu', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white,),),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: PokemonCardType(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Positioned(
                    //   // width: 200,
                    //   // heightFactor: 1,
                    //   // alignment: Alignment.centerRight,
                    //   child: Image(
                    //     image: AssetImage('assets/images/pokeball.png'),
                    //     color: const Color.fromRGBO(255, 255, 255, .2),
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                  ],
                ),
              )
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: -30,
          child: Image(
            image: AssetImage('assets/images/25.png'),
            height: 150,
          ),
        ),
      ],
    );
    // return Card(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   elevation: 2,
    //   color: Color(0xffF2CB55),
    //   child: Padding(
    //     padding: const EdgeInsets.all(15),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text('#025', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
    //             Padding(
    //               padding: const EdgeInsets.only(top: 5, bottom: 5),
    //               child: Text('Pikachu', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white,),),
    //             ),
    //             Row(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.only(right: 5),
    //                   child: PokemonCardType(),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //         Stack(
    //           children: [
    //             Container(),
    //             Positioned.fill(
    //               child: Image(
    //                 image: AssetImage('assets/images/pokeball.png'),
    //                 fit: BoxFit.cover,
    //                 color: const Color.fromRGBO(255, 255, 255, 0.1),
    //               ),
    //             ),
    //             Positioned(
    //               child: Image(
    //                 image: AssetImage('assets/images/25.png'),
    //                 height: 150,
    //               ),
    //             ),
    //             // Positioned.fill(
    //             //   child: Image(
    //             //     image: AssetImage('assets/images/25.png'),
    //             //   ),
    //             // ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}