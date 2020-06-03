class Question {
  final String category;
  String description;
  final int sips;
  final bool guaranteed;

  Question(this.category, this.description, this.sips, this.guaranteed);

  factory Question.fromJson(dynamic json) {
    return Question(json['category'] as String, json['description'] as String, json['sips'] as int, json['guaranteed'] as bool);
  }

  @override
  String toString() {
    return '{${this.category}, ${this.description}}';
  }
}