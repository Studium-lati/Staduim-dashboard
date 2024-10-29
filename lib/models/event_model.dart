import 'dart:convert';

class EventModel {
    String? name;
    String ?description;
    String ?date;
    String ?stadiumId;
    int ?userId;
    String ?status;
    dynamic image;
    DateTime ?updatedAt;
    DateTime ?createdAt;
    int? id;

    EventModel({
         this.name,
         this.description,
         this.date,
         this.stadiumId,
         this.userId,
         this.status,
         this.image,
         this.updatedAt,
         this.createdAt,
         this.id,
    });

    factory EventModel.fromRawJson(String str) => EventModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        name: json["name"],
        description: json["description"],
        date: json["date"],
        stadiumId: json["stadium_id"],
        userId: json["user_id"],
        status: json["status"],
        image: json["image"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "date": date,
        "stadium_id": stadiumId,
        "user_id": userId,
        "status": status,
        "image": image,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
