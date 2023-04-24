//客户数据模型类
class Client {
  //id
  late int id;
  //姓名
  late String name;
  //年龄
  late int age;
  //性别
  late int sex;

  Client({required this.id, required this.name, required this.age, required this.sex,});

  //将JSON数据转换成数据模型
  factory Client.fromMap(Map<String, dynamic> json) => Client(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        sex: json["sex"],
      );

  //将数据模型转换成JSON
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "age": age,
        "sex": sex,
      };
}

