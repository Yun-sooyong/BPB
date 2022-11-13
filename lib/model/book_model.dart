class BookModel {
  final String name;
  final String company;
  final String position;
  final String phoneNum;
  final String email;

  BookModel(
    this.name,
    this.company,
    this.position,
    this.phoneNum,
    this.email,
  );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'company': company,
      'position': position,
      'phoneNum': phoneNum,
      'email': email,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      map['name'] ?? '',
      map['company'] ?? '',
      map['position'] ?? '',
      map['phoneNum'] ?? '',
      map['email'] ?? '',
    );
  }
}
