// ignore_for_file: prefer_typing_uninitialized_variables

class KanbanModel {
  //initialization
  String? id;
  String? name;
  List? cards;

  //constructor
  KanbanModel({
    this.id,
    this.name,
    this.cards,
  });

  factory KanbanModel.fromJson(Map<String, dynamic> data) {
    return KanbanModel(
      id: data['id'],
      name: data['name'],
      cards: data['cards'],
    );
  }
}
