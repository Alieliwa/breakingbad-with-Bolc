class Character{
 late int charId;
 late String name;
 late String birthday;
 late String nickName;
 late String image;
 late List<dynamic> jops;
 late String status;
 late List<dynamic> appearance1;
 late String actorName;
 late String category;
 late List<dynamic> CallSaulappearance2;
   Character.fromJson(Map<String , dynamic>json){
     charId = json['char_id'];
     name = json['name'];
     birthday = json['birthday'];
     nickName =  json['nickname'];
     image = json["img"];
     jops = json["occupation"];
     status = json["status"];
     appearance1 = json["appearance"];
     actorName = json["portrayed"];
     category = json["category"];
     CallSaulappearance2 = json["better_call_saul_appearance"];
   }
}