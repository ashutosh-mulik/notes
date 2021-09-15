import 'dart:convert';

class Note {
  final String title;
  final String content;
  final String date;

  Note({
    required this.title,
    required this.content,
    required this.date,
  });

  Note copyWith({
    String? title,
    String? content,
    String? date,
  }) {
    return Note(
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'date': date,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'],
      content: map['content'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));

  @override
  String toString() => 'Note(title: $title, content: $content, date: $date)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Note &&
        other.title == title &&
        other.content == content &&
        other.date == date;
  }

  @override
  int get hashCode => title.hashCode ^ content.hashCode ^ date.hashCode;
}
