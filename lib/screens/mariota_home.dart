import 'package:flutter/material.dart';
import 'package:mariota/Model/jokemodel.dart';
import 'package:mariota/Tools/mariota_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mariota/screens/joke_loader.dart';
import 'package:mariota/screens/joke_shower.dart';

import '../Model/http_services.dart';

class MariotaHome extends StatefulWidget {
  const MariotaHome({Key? key}) : super(key: key);

  @override
  State<MariotaHome> createState() => _MariotaHomeState();
}

class _MariotaHomeState extends State<MariotaHome> {
  Future<JokeModel> takeJoke() async {
    JokeModel currentJoke = JokeModel();
    var joke = await HttpService.fetchedJokes(); // données Json décodées
    currentJoke = JokeModel.fromJson(joke);
    return currentJoke;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mariotaGrey,
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: 250,
              color: mariotaRed,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Mariota",
                      style: GoogleFonts.pontanoSans(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Trouver votre dose journalière d'humour",
                      style: GoogleFonts.pontanoSans(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FutureBuilder<JokeModel>(
                future: takeJoke(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const JokeLoader();
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    var receivedJoke = snapshot.data!;
                    return JokeShower(currentJoke: receivedJoke);
                  } else {
                    return const JokeLoader();
                  }
                }),
            // JokeLoader(currentJoke: currentJoke)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mariotaRed,
        onPressed: () {
          setState(() {
            build(context);
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
