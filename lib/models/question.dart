class Question {
  final String category;
  final String description;

  Question(this.category, this.description);

  factory Question.fromJson(dynamic json) {
    return Question(json['category'] as String, json['description'] as String);
  }

  @override
  String toString() {
    return '{${this.category}, ${this.description}}';
  }
}