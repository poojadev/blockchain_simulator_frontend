
import 'package:blockchain_world/network/Node1.dart';
import 'package:blockchain_world/nodes/Model/NodeAddressPOJO.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../network/RestClient.dart';
import '../../../../util/appconstants/AppConstants.dart';
import '../../../mine_block/model/MineBlockPOJO.dart';
var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;
RestClient restApiClient = RestClient(dio);


var dio1 = Dio()..options.baseUrl = AppConstants.BASE_URL_NODE1;
Node1 node1 = Node1(dio);
class NodeRepositoryImpl implements NodeRepository {
List<String>nodes=[];
List<String>node_two=[];


  @override
  Future getNode() async{
    return await restApiClient.getNodeAccounts();

  }

  
  @override
  Future connectNodeOne()async {
    nodes.add("http://127.0.0.1:5001");
    NodeAddressPOJO nodeAddressPOJO=NodeAddressPOJO(nodes);
    restApiClient.connectNodes(nodeAddressPOJO).then((value) {
      print(value);
    });
  }

  @override
  Future connectNodeTwo() async{
    node_two.add("http://127.0.0.1:5000");
    NodeAddressPOJO nodeAddressPOJO=NodeAddressPOJO(node_two);
    node1.connectNodes(nodeAddressPOJO);

  }


}
abstract class NodeRepository {

  Future getNode();
  Future connectNodeOne();
  Future connectNodeTwo();
 // Future<GetChainPOJO>getBlocks();



}
