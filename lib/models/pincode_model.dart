class PostOffice {
  final String name;
  final String district;
  final String state;
  final String division;

  PostOffice({
    required this.name,
    required this.district,
    required this.state,
    required this.division,
  });

  factory PostOffice.fromJson(Map<String, dynamic> json) {
    return PostOffice(
      name: json['Name'],
      district: json['District'],
      state: json['State'],
      division: json['Division'],
    );
  }
}
