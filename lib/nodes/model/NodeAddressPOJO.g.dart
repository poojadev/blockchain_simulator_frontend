// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NodeAddressPOJO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NodeAddressPOJO _$NodeAddressPOJOFromJson(Map<String, dynamic> json) =>
    NodeAddressPOJO(
      (json['nodes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$NodeAddressPOJOToJson(NodeAddressPOJO instance) =>
    <String, dynamic>{
      'nodes': instance.nodes,
    };
