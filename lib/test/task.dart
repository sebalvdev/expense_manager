class Task {
  final int? id;
  final String title;
  final String description;

  Task({this.id, required this.title, required this.description});

  // Convertir un Task a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  // Crear un Task desde un Map
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }
}
