class Todo{
  final String id;
  final String titulo;
  
  const Todo({required this.id, required this.titulo});

  @override
  String toString() {
    return 'Todo{id: $id, titulo: $titulo}';
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      titulo: json['titulo'],
    );
  }
}