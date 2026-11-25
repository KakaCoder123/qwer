class ClassDiscovery {
  final int id;
  final String title,subtitle ,description, publishTime;
  final List<ClassMedia> media;

  ClassDiscovery({
   required this.id, required this.media, required this.description, required this.publishTime, required this.subtitle, required this.title
});

  factory ClassDiscovery.fromJson(Map<String, dynamic> json){
    return ClassDiscovery(
      id: json["id"],
      media: (json["media"] as List).map((item) => ClassMedia.fromJson(item)).toList(),
      publishTime: json["publishTime"],
      subtitle: json["subtitle"],
      title: json["title"],
      description: json["description"]

  );
  }
}




class ClassMedia{
  final String type, file;

  ClassMedia({
    required this.file, required this.type
});

  factory ClassMedia.fromJson(Map<String, dynamic> json){
    return ClassMedia(file: json["file"], type: json["type"]);
  }

}