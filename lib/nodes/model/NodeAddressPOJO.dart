import 'package:json_annotation/json_annotation.dart';
part 'NodeAddressPOJO.g.dart';


@JsonSerializable()
class NodeAddressPOJO
{


  late List<String>nodes;
  NodeAddressPOJO(this.nodes);

  /*
  sample json to post
  {
  "node":["http://127.0.0.1:5000",
          "http://127.0.0.1:5001",
          "http://127.0.0.1:5002"]
}

   */

  factory NodeAddressPOJO.fromJson(Map<String, dynamic> json) => _$NodeAddressPOJOFromJson(json);
  Map<String, dynamic> toJson() => _$NodeAddressPOJOToJson(this);



}



