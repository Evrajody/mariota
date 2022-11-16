//La classe materialisant une blague depuis le serveur !!

class JokeModel {
  bool? error;
  String? category;
  String? type;
  String? setup;
  String? delivery;
  Map<String, dynamic>? flags;
  int? id;
  bool? safe;
  String? lang;

// Un constructeur liéé a la classe modele
  JokeModel({
    this.error,
    this.category,
    this.type,
    this.setup,
    this.delivery,
    this.flags,
    this.id,
    this.safe,
    this.lang,
  });

  /* Cette fonction convertit les données du serveur venu en format Json au
  // format objet !  
  // De facon plus clair le constructeur en voir un parsing json des donnée grace au factory !*/
  // Pour l'Enrégistrement
  // Json (Element tel que ecrit dans la base de donnes )
  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(
      error: json["error"],
      category: json["category"],
      type: json["type"],
      setup: json["setup"],
      delivery: json["delivery"],
      flags: json["flags"],
      id: json["id"],
      safe: json["safe"],
      lang: json["lang"],
    );
  }
}

/**
 * {
    "error": false,
    "category": "Misc",
    "type": "twopart",
    "setup": "Arguing with a woman is like reading a software's license agreement.",
    "delivery": "In the end you ignore everything and click \"I agree\".",
    "flags": {
        "nsfw": false,
        "religious": false,
        "political": false,
        "racist": false,
        "sexist": true,
        "explicit": false
    },
    "id": 71,
    "safe": false,
    "lang": "en"
}
 */
