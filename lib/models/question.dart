abstract class Question {
  final String category;
  String description;
  final int sips;
  final bool guaranteed;

  Question(this.category, this.description, this.sips, this.guaranteed);

  @override
  String toString() {
    return '{${this.category}, ${this.description}}';
  }
}