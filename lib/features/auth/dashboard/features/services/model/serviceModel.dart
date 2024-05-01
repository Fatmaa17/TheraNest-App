class ServiceModel {
  String? id;
  String? name;
  String? address;
  ServiceModel({this.id , this.address , this.name});
  
  ServiceModel.fromJson(Map map){
    id = map['id'].toString();
    address = map['address'];
    name = map['name'];
  }
}