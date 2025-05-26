class SuccessPromiseEntity {
  int id;
  String title;

  SuccessPromiseEntity({required this.id, required this.title});

  factory SuccessPromiseEntity.fromJson(Map<String, dynamic> json) {
    return SuccessPromiseEntity(id: json['id'], title: json['title']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}
