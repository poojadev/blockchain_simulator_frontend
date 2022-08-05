
import 'package:blockchain_world/accounts/model/CreateWalletPOJO.dart';
import 'package:blockchain_world/util/common/Argument.dart';
import 'package:blockchain_world/util/ui/sizeConfig.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../network/RestClient.dart';
import '../../util/appconstants/AppConstants.dart';
import '../controller/bloc/repository/AccountRepository.dart';

class ShowAccountTransactions extends StatelessWidget {
  static const String routeName = "/ShowNodeTransactions";
 late  SingleArgument nodePublicKey;

  ShowAccountTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowNodeTransactionsState(
        nodePublicKey: nodePublicKey,

//        id: genresId,
//        genresName: genresName,
//        pageDirection: pageDirection,
          key: key),
    );
  }
}

class ShowNodeTransactionsState extends StatefulWidget {
  const ShowNodeTransactionsState({Key? key, required this.nodePublicKey}) : super(key: key);

//  final int id;
    final SingleArgument nodePublicKey;
//  final int pageDirection;

  @override
  _ShowNodeTransactionsState createState() => _ShowNodeTransactionsState();
}

var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;
RestClient restApiClient = RestClient(dio);

class _ShowNodeTransactionsState extends State<ShowNodeTransactionsState> {
  var noceController = TextEditingController();
  var receiverController = TextEditingController();
  var amountController = TextEditingController();
  bool _obscured = false;
  late String receiverId = "";
  final textFieldFocusNode = FocusNode();

  late List<CreateWalletPOJO> searchPublicKeys = [];
  late String nodePublicKey;
  late int nodeMinedBlockCount;

  @override
  Widget build(BuildContext context) {
    print("node" + widget.nodePublicKey.key);



    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);


        return SingleChildScrollView(
          child: Container(
            height:SizeConfig.heightMultiplier*99,

              width: MediaQuery
                .of(context)
                .orientation == Orientation.landscape ? MediaQuery
                .of(context)
                .size
                .width : SizeConfig.widthMultiplier * 80,
            padding: const EdgeInsets.all(35),

           child:
            //
            //


                // Container(
                //     height: MediaQuery.of(context).size.height*80,
                //     width:  MediaQuery.of(context).size.width*90,
                //     color:Colors.black12,
                //    child:
                    //
                    //
                    //
                    //
                    //
                    //
                    //
                    //
                    //
                    //
                    //
                    //

                   Column(children: [
                     Container(
                         height: 300,
                         child:
                    FutureBuilder(
                      future:FirebaseFirestore.instance.collection(AppConstants.Transactions).where(AppConstants.Transaction_From,isEqualTo:
                          widget.nodePublicKey.key).get(),
                      builder: (context,AsyncSnapshot snapshot) {

                        print("IM insdi1");






                        // AsyncSnapshot<DocumentSnapshot> snapshot=snapshot.data.;
                        return
                          //
                          // Container(
                          //     width: MediaQuery
                          //         .of(context)
                          //         .size
                          //         .width,
                          //     height:MediaQuery
                          //         .of(context)
                          //         .size
                          //         .height*60,
                          //     padding: EdgeInsets.all(10),
                          //
                          //     child:


                             Wrap(children: [

                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(snapshot.data != null ?"Confirmed Transactions : " +
                                  snapshot.data!.size.toString() : "Wait",
                                    textScaleFactor: 1.3,
                                    style: const TextStyle(
                                        color: Colors.black),

                                    //  textAlign: TextAlign.center,
                                  ),
                                ),




                               Container(

                                    // width: MediaQuery
                                    //     .of(context)
                                    //     .size
                                    //     .width * 90,
                                    //  color: Colors.cyan,
                                    height:300,
                                    child:
                        snapshot.data!=null? ListView.builder(
                                      itemCount: snapshot.data?.size,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,

                                      itemBuilder: (context, index) {
                                        print("IM insdi  >>>>"  + snapshot.data.size.toString());

                                        return GestureDetector(
                                            onTap: () {
                                              //});

                                            },
                                            child: Card(
                                                elevation: 12,
                                                child: Container(
                                                    width:SizeConfig.widthMultiplier*70,


                                                    child:


                                                    Column(
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .topLeft,
                                                          padding: EdgeInsets.all(
                                                              5.0),
                                                          child: Text(
                                                            snapshot.hasData !=
                                                                false
                                                                ? snapshot.data!
                                                                .docs[index]
                                                                .get(AppConstants
                                                                .Transaction_From)
                                                                .toString() ??
                                                                "NO"
                                                                : "Wait",

                                                            textScaleFactor: 1.3,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black),

                                                            //  textAlign: TextAlign.center,
                                                          ),
                                                        ),

                                                        Container(
                                                          alignment: Alignment
                                                              .topLeft,
                                                          padding: EdgeInsets.all(
                                                              5.0),
                                                          child: Text(
                                                            snapshot.hasData !=
                                                                false
                                                                ? snapshot.data!
                                                                .docs[index]
                                                                .get(AppConstants
                                                                .Transaction_To)
                                                                .toString() ??
                                                                "NO"
                                                                : "Wait",

                                                            textScaleFactor: 1.3,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black),

                                                            //  textAlign: TextAlign.center,
                                                          ),
                                                        ),

                                                        Container(
                                                          alignment: Alignment
                                                              .topLeft,
                                                          padding: EdgeInsets.all(
                                                              5.0),
                                                          child: Text(
                                                            snapshot.hasData !=
                                                                false
                                                                ? snapshot.data!
                                                                .docs[index]
                                                                .get(AppConstants
                                                                .Transaction_Amount)
                                                                .toString() ??
                                                                "NO"
                                                                : "Wait",

                                                            textScaleFactor: 1.3,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black),

                                                            //  textAlign: TextAlign.center,
                                                          ),
                                                        ),




                                                      ],


                                                    ))));
                                      },
                                    ):Text("No transactions"))
                             ]);
                          //);
                      },
                    )),

                     SizedBox(height: 30,),

                     Container(
                         height: 300,
                         child:
                         FutureBuilder(
                       future: AccountRepositoryImpl().getNodeMinedBlockDetails(widget.nodePublicKey.node_index),
                       builder: (context,AsyncSnapshot snapshot) {

                         print("IM NodeRepositoryImplNodeRepositoryImplNodeRepositoryImpl");






                         // AsyncSnapshot<DocumentSnapshot> snapshot=snapshot.data.;
                         return
                           //
                           // Container(
                           //     width: MediaQuery
                           //         .of(context)
                           //         .size
                           //         .width,
                           //     height:MediaQuery
                           //         .of(context)
                           //         .size
                           //         .height*60,
                           //     padding: EdgeInsets.all(10),
                           //
                           //     child:


                           Wrap(children: [
                             Container(
                               alignment: Alignment.topLeft,
                               padding: const EdgeInsets.all(5.0),
                               child: Text(
                                 "Block Mined : " +

                                     widget.nodePublicKey.mined_block_count.toString() ,
                                 textScaleFactor: 1.3,
                                 style: const TextStyle(
                                     color: Colors.black),

                                 //  textAlign: TextAlign.center,
                               ),
                             ),



                             Container(
                                 height:300,
                                 child:
                                 snapshot.data!=null? ListView.builder(
                                   itemCount: snapshot.data?.size,
                                   scrollDirection: Axis.horizontal,
                                   shrinkWrap: true,

                                   itemBuilder: (context, index) {
                                     print("IM insdi  >>>>"  + snapshot.data!
                                         .docs[index]
                                         .get(AppConstants
                                         .Block_index).toString());

                                     return GestureDetector(
                                         onTap: () {
                                           //});

                                         },
                                         child: Card(
                                             elevation: 12,
                                             child: Container(
                                                 width:SizeConfig.widthMultiplier*70,
                                                 color: Colors.white,

                                                 child:


                                                 Column(
                                                   children: [
                                                     Container(
                                                       alignment: Alignment
                                                           .topLeft,
                                                       padding: EdgeInsets.all(
                                                           5.0),
                                                       child: Text(
                                                         snapshot.hasData !=
                                                             false
                                                             ? snapshot.data!
                                                             .docs[index]
                                                             .get(AppConstants
                                                             .Block_index)
                                                             .toString() ??
                                                             "NO"
                                                             : "Wait",

                                                         textScaleFactor: 1.3,
                                                         style: const TextStyle(
                                                             color: Colors
                                                                 .black),

                                                         //  textAlign: TextAlign.center,
                                                       ),
                                                     ),

                                                     Container(
                                                       alignment: Alignment
                                                           .topLeft,
                                                       padding: EdgeInsets.all(
                                                           5.0),
                                                       child: Text(
                                                         snapshot.hasData !=
                                                             false
                                                             ? snapshot.data!
                                                             .docs[index]
                                                             .get(AppConstants
                                                             .Block_CreatedOn)
                                                             .toString() ??
                                                             "NO"
                                                             : "Wait",

                                                         textScaleFactor: 1.3,
                                                         style: const TextStyle(
                                                             color: Colors
                                                                 .black),

                                                         //  textAlign: TextAlign.center,
                                                       ),
                                                     ),

                                                     Container(
                                                       alignment: Alignment
                                                           .topLeft,
                                                       padding: EdgeInsets.all(
                                                           5.0),
                                                       child: Text(
                                                         snapshot.hasData !=
                                                             false
                                                             ? snapshot.data!
                                                             .docs[index]
                                                             .get(AppConstants
                                                             .Previous_hash)
                                                             .toString() ??
                                                             "NO"
                                                             : "Wait",

                                                         textScaleFactor: 1.3,
                                                         style: const TextStyle(
                                                             color: Colors
                                                                 .black),

                                                         //  textAlign: TextAlign.center,
                                                       ),
                                                     ),





                                                   ],


                                                 ))));
                                   },
                                 ):Text("No transactions"))
                           ]);
                         //);
                       },
                     )),



                   ])


                )


          // ],
          // ),
          //   ),
          // ),
        );
      });
    }));
  }
}