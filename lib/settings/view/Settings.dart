import 'dart:io';


import 'package:blockchain_world/blocks/view/GetAllBlocks.dart';
import 'package:blockchain_world/main.dart';
import 'package:blockchain_world/transactions/Model/ReplaceChainPOJO.dart';
import 'package:blockchain_world/transactions/model/UnConfirmedTransactionsListPOJO.dart';
import 'package:blockchain_world/util/ui/ALertDialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../network/RestClient.dart';
import '../../../util/appconstants/AppConstants.dart';
import '../../../util/ui/sizeConfig.dart';

import '../../blocks/bloc/block_repository/BlockRepository.dart';
import '../../network/Node1.dart';
import '../../network/Node2.dart';


class Settings extends StatelessWidget {
  static const String routeName = "/Settings";


  Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsState(
//        id: genresId,
//        genresName: genresName,
//        pageDirection: pageDirection,
        key: key
      ),
    );
  }
}

class SettingsState extends StatefulWidget {
  const SettingsState({Key? key})
      : super(key: key);

//  final int id;
//  final String genresName;
//  final int pageDirection;

  @override
  _SettingsState createState() => _SettingsState();
}










var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;

RestClient restApiClient = RestClient(dio);


var dio1 = Dio()..options.baseUrl = AppConstants.BASE_URL;
Node1 node1 = Node1(dio1);


var dio2 = Dio()..options.baseUrl = AppConstants.BASE_URL;
Node2 node2 = Node2(dio2);

class _SettingsState extends State<SettingsState> {




UnConfirmedTransactionsListPOJO? unConfirmedTransactionsListPOJO;



@override
  void initState() {
    // TODO: implement initState

    super.initState();

  }

  @override
  Widget build(BuildContext context) {


    return
      Scaffold(



          body:   LayoutBuilder(builder: (context, constraints) {
            return OrientationBuilder(
                builder: (context, orientation) {
                  SizeConfig().init(constraints, orientation);

                  final bool isLandscape = orientation == Orientation.landscape;
                  Orientation currentOrientation = MediaQuery.of(context).orientation;

                  return  SingleChildScrollView(

                    child:  Container(
                        width:  MediaQuery.of(context).size.width,

                        height:  MediaQuery.of(context).size.height,
                      // width: SizeConfig.widthMultiplier*90,
                      padding: const EdgeInsets.all(10),

                      child:


                      ListView(children: [


                        Container(
                          alignment: Alignment.center,
                          // height:kIsWeb?
                          // SizeConfig.heightMultiplier*6: SizeConfig.heightMultiplier*8,
                            padding: EdgeInsets.only(top: 5,bottom: 5),


                            //width: SizeConfig.widthMultiplier * 90,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    elevation: 6,
                                    // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                    backgroundColor: Colors.black,

                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30))),
                                child: const Text(
                                  'Clear Blockchain',
                                  textScaleFactor: 1,
                                  style: TextStyle(  color: Colors.white),
                                ),
                                onPressed: () async {



                                   AppConstants(context).startLoading();
                                  restApiClient.clearBlockChain().then((value) {
                                    AppConstants(context).stopLoading();
                                    Alerts(context, "Blockchain Simulator is all ready to start from Genesis Block");

                                  });

                                  // setState(() {
                                  //
                                  // });



                                })),



                        Container(
                          alignment: Alignment
                              .center,
                          padding: EdgeInsets.all(
                              5.0),
                          child: Text(
                          "If you wish to run the simulator from the beginning click on clear blockchain button",

                            textScaleFactor: 1.1,
                            style: TextStyle(
                                color: Colors
                                    .black),

                            //  textAlign: TextAlign.center,
                          ),
                        ),







                 ])







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
