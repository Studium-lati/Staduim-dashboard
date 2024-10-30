import 'dart:convert';

class ReservationsModle {
    String ?stadiumId;
    DateTime? date;
    String? time;
    String ?duration;

    ReservationsModle({
         this.stadiumId,
         this.date,
         this.time,
         this.duration,
    });

    factory ReservationsModle.fromRawJson(String str) => ReservationsModle.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReservationsModle.fromJson(Map<String, dynamic> json) => ReservationsModle(
        stadiumId: json["stadium_id"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        duration: json["duration"],
    );

    Map<String, dynamic> toJson() => {
        "stadium_id": stadiumId,
        "date": "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "time": time,
        "duration": duration,
    };
}
