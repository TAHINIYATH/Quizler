class Question {
  String questiontext = 'initialized';
  bool questionasnwer = false;
  Question({required String q, required bool a}) {
    questiontext = q;
    questionasnwer = a;
  }
}
