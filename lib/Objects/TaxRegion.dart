class TaxRegion {
  final  String entityName, instanceName, name, id, version;


  TaxRegion({this.entityName, this.instanceName, this.name, this.id,
    this.version});

  factory TaxRegion.fromJson(Map<String,dynamic>json){
    return new TaxRegion(
      id: json['id'].toString(),
      entityName: json['_entityName'].toString(),
      instanceName: json['_instanceName'].toString(),
      name: json['name'].toString(),
      version: json['version'].toString(),

    );
  }
}

