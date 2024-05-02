class ServiceModel {
  int? id;
  String? name;
  String? specialty;
  double? sessionPrice;
  int? experienceYears;
  List<String>? languages;
  List<String>? fields;

  ServiceModel.fromJson(Map<String, dynamic> m) {
    id = m['id']; // Cast the value to int?
    name = m['name'];
    specialty = m['specialty'];
    sessionPrice = m['session_price'];
    experienceYears = m['experience_years'];
    languages = (m['languages']);
    fields = (m['fields']);
  }
}


//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'name': name,
//         'specialty': specialty,
//         'session_price': sessionPrice,
//         'experience_years': experienceYears,
//         'languages': languages,
//         'fields': fields,
//       };
// }
