class FavMovie {
  String title;
  String image;
  String id;

  FavMovie({required this.title, required this.image, this.id = ""});

  FavMovie.fromJson(Map<String, dynamic> json)
      : this(title: json['title'], image: json['image'], id: json['id']);

  Map<String, dynamic> toJson() {
    return {"title": title, "image": image, "id": id};
  }
}
