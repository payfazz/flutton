import 'dart:convert';

Story storyFromJson(String str) {
  final jsonData = json.decode(str);
  return Story.fromJson(jsonData);
}

String storyToJson(Story data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Story {
  String by;
  int descendants;
  int id;
  List<int> kids;
  int score;
  int time;
  String title;
  String type;
  String url;

  Story({
    this.by,
    this.descendants,
    this.id,
    this.kids,
    this.score,
    this.time,
    this.title,
    this.type,
    this.url,
  });

  factory Story.fromJson(Map<String, dynamic> json) => new Story(
        by: json["by"],
        descendants: json["descendants"],
        id: json["id"],
        kids: new List<int>.from(json["kids"].map((x) => x)),
        score: json["score"],
        time: json["time"],
        title: json["title"],
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "by": by,
        "descendants": descendants,
        "id": id,
        "kids": new List<dynamic>.from(kids.map((x) => x)),
        "score": score,
        "time": time,
        "title": title,
        "type": type,
        "url": url,
      };
}
