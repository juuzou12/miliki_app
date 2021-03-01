class Data {
  final  String entityName, instanceName, serialNumber, id, version, status;


  Data({this.entityName, this.instanceName, this.serialNumber, this.id,
    this.version, this.status});

  factory Data.fromJson(Map<String,dynamic>json){
    return new Data(
      id: json['id'].toString(),
      entityName: json['_entityName'].toString(),
      instanceName: json['_instanceName'].toString(),
      serialNumber: json['serialNumber'].toString(),
      version: json['version'].toString(),
      status: json['status'].toString(),
    );
  }
}

