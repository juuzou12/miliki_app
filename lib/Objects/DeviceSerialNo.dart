class DeviceSerialNo {
  final  String entityName, instanceName, serialNumber, id, status;


  DeviceSerialNo({this.entityName, this.instanceName, this.serialNumber, this.id,
    this.status});

  factory DeviceSerialNo.fromJson(Map<String,dynamic>json){
    return new DeviceSerialNo(
      id: json['id'].toString(),
      entityName: json['_entityName'].toString(),
      instanceName: json['_instanceName'].toString(),
      serialNumber: json['serialNumber'].toString(),
      status: json['status'].toString(),

    );
  }
}