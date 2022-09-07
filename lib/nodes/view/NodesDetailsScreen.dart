import 'package:blinking_text/blinking_text.dart';
import 'package:blockchain_world/accounts/model/AllAccounts/AllAccountsPOJO.dart';
import 'package:blockchain_world/nodes/bloc/block_repository/NodeRepository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../network/RestClient.dart';

import '../../../util/appconstants/AppConstants.dart';
import '../../../util/ui/sizeConfig.dart';
import '../../network/Node1.dart';
import '../../network/Node2.dart';
import '../Model/NodeAddressPOJO.dart';

class NodeDetails extends StatelessWidget {
  static const String routeName = "/NodeDetails";

  //late ArgumentsPOJO argumentsPOJO;

  NodeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NodsDetailsScreen(
//        id: genresId,
//        genresName: genresName,
//        pageDirection: pageDirection,
          key: key),
    );
  }
}

var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;
RestClient restApiClient = RestClient(dio);


class NodsDetailsScreen extends StatefulWidget {
  const NodsDetailsScreen({Key? key}) : super(key: key);

  @override
  _NodsDetailsScreenState createState() => _NodsDetailsScreenState();
}

class _NodsDetailsScreenState extends State<NodsDetailsScreen> {

  AllAccountsPOJO? accountsPOJO;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);


        return Container(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery
                .of(context)
                .size.width,
            color: Colors.white,

            padding: const EdgeInsets.all(20),

            child:




            ListView(

              children: [


                Container(
                    height: MediaQuery.of(context).size.height*0.80,
                    color: Colors.white,
                    padding: EdgeInsets.all(20),

                    //height: SizeConfig.heightMultiplier * 60,
                    width: MediaQuery.of(context).size.width,
                    child:

                    FutureBuilder(
                      future: NodeRepositoryImpl().getNode().then((value){


                        accountsPOJO=value;
                      }),

                      builder: (context, AsyncSnapshot snapshot ) {
                       // print("sn" +snapshot.data);
                        return ListView.builder(
                          itemCount: accountsPOJO?.accounts.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  //});

                                },
                                child: Card(
                                    elevation: 12,
                                    color: Colors.white,


                                    child: Column(
                                      children: [


                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: const EdgeInsets.all(5.0),
                                          child: const Text(
                                            "Node",

                                            textScaleFactor: 1.1,
                                            style: TextStyle(
                                                color: Colors.black45),

                                            //  textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            accountsPOJO?.accounts[index].account_owner ??
                                                "NO",


                                            textScaleFactor: 1.1,
                                            style: const TextStyle(
                                                color: Colors.black),

                                            //  textAlign: TextAlign.center,
                                          ),
                                        ),




                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.all(5.0),
                                          child: const Text(
                                            "Node Balance",

                                            textScaleFactor: 1.1,
                                            style: TextStyle(
                                                color: Colors.black45),

                                            //  textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                              accountsPOJO?.accounts[index].coins
                                                .toString() ??
                                                "NO"
                                              ,

                                            textScaleFactor: 1.1,
                                            style: const TextStyle(
                                                color: Colors.black),

                                            //  textAlign: TextAlign.center,
                                          ),
                                        ),




                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.all(5.0),
                                          child: const Text(
                                            "Public Key",

                                            textScaleFactor: 1.1,
                                            style: TextStyle(
                                                color: Colors.black45),

                                            //  textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            accountsPOJO?.accounts[index].public_key??
                                                "NO"
                                                ,

                                            textScaleFactor: 1.1,
                                            style: const TextStyle(
                                                color: Colors.black),

                                            //  textAlign: TextAlign.center,
                                          ),
                                        ),




                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.all(5.0),
                                          child: const Text(
                                            "No. Of blocks  Mined",

                                            textScaleFactor: 1.1,
                                            style: TextStyle(
                                                color: Colors.black45),

                                            //  textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            accountsPOJO?.accounts[index].blocks_mined.toString()??
                                                "NO",


                                            textScaleFactor: 1.1,
                                            style: const TextStyle(
                                                color: Colors.black),

                                            //  textAlign: TextAlign.center,
                                          ),
                                        ),

                                      ],


                                    )));
                          },
                        );
                      },
                    )),


              ],
            ),
          ),

          // ],
          // ),
          //   ),
          // ),
        );
      });
    }));

  }
}
