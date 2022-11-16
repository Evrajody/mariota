import 'package:flutter/material.dart';
import 'package:mariota/Model/jokemodel.dart';
import 'package:mariota/Tools/mariota_constant.dart';

class JokeShower extends StatelessWidget {
  const JokeShower({
    Key? key,
    required this.currentJoke,
  }) : super(key: key);

  final JokeModel currentJoke;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -395,
      left: 10,
      right: 10,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 450,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Text(
                    "${currentJoke.setup} ${currentJoke.delivery}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 28),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: mariotaGrey,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 50,
                  width: 150,
                  child: Center(
                    child: Text(
                      "${currentJoke.category}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
