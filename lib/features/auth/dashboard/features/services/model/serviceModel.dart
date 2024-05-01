class ServiceModel {
  String? id;
  String? name;
  String? specialty;
  double? sessionPrice;
  int? experienceYears;
  List<String>? languages;
  List<String>? fields;

  ServiceModel({
    this.id,
    this.name,
    this.specialty,
    this.sessionPrice,
    this.experienceYears,
    this.languages,
    this.fields,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: json['id'],
        name: json['name'],
        specialty: json['specialty'],
        sessionPrice: json['session_price'],
        experienceYears: json['experience_years'],
        languages: json['languages'] != null
            ? List<String>.from(json['languages'])
            : null,
        fields: json['fields'] != null ? List<String>.from(json['fields']) : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'specialty': specialty,
        'session_price': sessionPrice,
        'experience_years': experienceYears,
        'languages': languages,
        'fields': fields,
      };
}
