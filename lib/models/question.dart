class Question {
  final String description;

  Question(this.description);

  factory Question.fromJson(dynamic json) {
    return Question(json['description'] as String);
  }

  @override
  String toString() {
    return '{${this.description}}';
  }
}