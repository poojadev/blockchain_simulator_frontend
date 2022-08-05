import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../network/RestClient.dart';
import '../../../util/appconstants/AppConstants.dart';
import '../../../util/ui/sizeConfig.dart';

import '../../blocks/bloc/block_repository/BlockRepository.dart';
import '../Model/AddTransactionPOJO.dart';
import '../Model/WalletArgumentsPOJO.dart';
import '../bloc/states/TransactionStates.dart';
import '../bloc/transaction_bloc/TransactionBloc.dart';
import '../bloc/transaction_repository/TransactionRepository.dart';



class TransactionList extends StatelessWidget {
  static const String routeName = "/AddTransactions";

  late WalletArguments walletArguments;

  TransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddTransactionsState(
//        id: genresId,
//        genresName: genresName,
//        pageDirection: pageDirection,
        key: key
      ),
    );
  }
}

class AddTransactionsState extends StatefulWidget {
  const AddTransactionsState({Key? key})
      : super(key: key);

//  final int id;
//  final String genresName;
//  final int pageDirection;

  @override
  _AddTransactionsState createState() => _AddTransactionsState();
}












var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;
RestClient restApiClient = RestClient(dio);
class _AddTransactionsState extends State<AddTransactionsState> {

  var senderController = TextEditingController();
  var receiverController = TextEditingController();
  var amountController=TextEditingController();
  bool _obscured = false;
  final textFieldFocusNode = FocusNode();
 late  int mined_by;


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
                        width: isLandscape?  MediaQuery.of(context).size.width*90

                            :SizeConfig.widthMultiplier*90,
                      height: SizeConfig.heightMultiplier*90,
                      // width: SizeConfig.widthMultiplier*90,
                      padding: const EdgeInsets.all(25),

                      child:





                          BlocBuilder<TransactionBloc, TransactionState>(
                            builder: (context, state) {

                              // getChainPOJO!=null?print("ok che" +getChainPOJO!.chain.length.toString()):print("wai" +getChainPOJO.toString());
                              //


                              // if (state is GetBlockEvent){

                         return  Container(


                                  height:SizeConfig.heightMultiplier*90,

                             child:

                                  StreamBuilder(
                                      stream: TransactionRepositoryImpl().getTransactions(1),



                                      builder: (BuildContext context,
                                         AsyncSnapshot  snapshot) {




                                        return
                                         snapshot.data!=null? Container(

                                            //
                                            // SizeConfig.widthMultiplier*90,

                                              child:

                                              snapshot.data?.docs.length!=0?     ListView.builder(

                                                  scrollDirection: Axis.vertical,
                                                  shrinkWrap: true,
                                                  itemCount: snapshot.data?.docs.length,
                                                  itemBuilder: (context, index) {
                                                    //  print("INSIDE itemBuilder in ");

                                                    return GestureDetector(
                                                      onTap: () async{

                                                        //
                                                        // ArgumentsPOJO argumentPOJOI=
                                                        // ArgumentsPOJO(index: getChainPOJO!.chain[index].block.index,
                                                        //
                                                        //     message: "New transaction added",
                                                        //     previous_hash: getChainPOJO!.chain[index].block.previous_hash,
                                                        //     proof: getChainPOJO!.chain[index].block.proof,
                                                        //     timestamp: getChainPOJO!.chain[index].block.timestamp,
                                                        //     current_block_hask: getChainPOJO!.chain[index].hash ,
                                                        //     transactions:getChainPOJO!.chain[index].block.transactions);
                                                        //
                                                        //
                                                        //
                                                        // Navigator.pushNamed(context,
                                                        //     BlockDetail.routeName,
                                                        //     arguments: argumentPOJOI);
                                                        //




                                                      },
                                                      // child: Container(
                                                      //   color: Colors.white38,
                                                      //   width:SizeConfig.widthMultiplier*60,
                                                      //
                                                      //
                                                      //   // width: isLandscape?  MediaQuery.of(context).size.width
                                                      //   //
                                                      //   // :SizeConfig.widthMultiplier*100,
                                                      //
                                                      //   padding: EdgeInsets.only(
                                                      //       left: 1 * SizeConfig.heightMultiplier,
                                                      //       right: 1 * SizeConfig.heightMultiplier,
                                                      //       bottom: 1 * SizeConfig.heightMultiplier),
                                                      child:



                                                      Column(
                                                          children: <Widget>[
                                                            Container(

                                                                padding: EdgeInsets.all(10.0),

                                                                width: isLandscape?  MediaQuery.of(context).size.width*90

                                                                    :SizeConfig.widthMultiplier*90,


                                                                child: Card(
                                                                  elevation: 14,

                                                                  child: Column(children: [



                                                                    Container(
                                                                      alignment: Alignment.topLeft,
                                                                      padding: EdgeInsets.all(5.0),
                                                                      child: Text("Node  Id",

                                                                        textScaleFactor: 1.3,
                                                                        style: const TextStyle(color: Colors.black54),

                                                                        //  textAlign: TextAlign.center,
                                                                      ),
                                                                    ),


                                                                    Container(
                                                                      alignment: Alignment.topLeft,
                                                                      padding: EdgeInsets.all(5.0),
                                                                      child: Text(
                                                                        snapshot.data?.docs[index].get(AppConstants.Node_Number)?? 'No data ',

                                                                        textScaleFactor: 1.3,
                                                                        style: const TextStyle(color: Colors.black),

                                                                        //  textAlign: TextAlign.center,
                                                                      ),
                                                                    ),

                                                                    Container(
                                                                      alignment: Alignment.topLeft,
                                                                      padding: EdgeInsets.all(5.0),
                                                                      child: Text("Transaction Id",

                                                                        textScaleFactor: 1.3,
                                                                        style: const TextStyle(color: Colors.black54),

                                                                        //  textAlign: TextAlign.center,
                                                                      ),
                                                                    ),


                                                                    Container(
                                                                      alignment: Alignment.topLeft,
                                                                      padding: EdgeInsets.all(5.0),
                                                                      child: Text(
                                                                        snapshot.data?.docs[index].get(AppConstants.Transaction_Hash)?? 'No data ',

                                                                        textScaleFactor: 1.3,
                                                                        style: const TextStyle(color: Colors.black),

                                                                        //  textAlign: TextAlign.center,
                                                                      ),
                                                                    ),

                                                                    Container(
                                                                      alignment: Alignment.topLeft,
                                                                      padding: EdgeInsets.all(5.0),
                                                                      child: Text("Sender",

                                                                        textScaleFactor: 1.3,
                                                                        style: const TextStyle(color: Colors.black54),

                                                                        //  textAlign: TextAlign.center,
                                                                      ),
                                                                    ),

                                                                    Container(
                                                                      alignment: Alignment.topLeft,
                                                                      padding: EdgeInsets.all(5.0),
                                                                      child: Text(
                                                                        snapshot.data?.docs[index].get(AppConstants.Transaction_From)?? 'No timestamp ',

                                                                        textScaleFactor: 1.3,
                                                                        style: const TextStyle(color: Colors.black),

                                                                        //  textAlign: TextAlign.center,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      alignment: Alignment.topLeft,
                                                                      padding: EdgeInsets.all(5.0),
                                                                      child: Text("Receiver",

                                                                        textScaleFactor: 1.3,
                                                                        style: const TextStyle(color: Colors.black54),

                                                                        //  textAlign: TextAlign.center,
                                                                      ),
                                                                    ),

                                                                    Container(
                                                                      alignment: Alignment.topLeft,
                                                                      padding: EdgeInsets.all(5.0),
                                                                      child: Text(
                                                                        snapshot.data?.docs[index].get(AppConstants.Transaction_To)?? 'No timestamp ',

                                                                        textScaleFactor: 1.3,
                                                                        style: const TextStyle(color: Colors.black),

                                                                        //  textAlign: TextAlign.center,
                                                                      ),
                                                                    ),



                                                                    //
                                                                    Container(
                                                                      alignment: Alignment.topLeft,
                                                                      padding: EdgeInsets.all(5.0),
                                                                      child: Text("Transaction status",

                                                                        textScaleFactor: 1.3,
                                                                        style: const TextStyle(color: Colors.black54),

                                                                        //  textAlign: TextAlign.center,
                                                                      ),
                                                                    ),

                                                                    Container(
                                                                      alignment: Alignment.topLeft,
                                                                      padding: EdgeInsets.all(5.0),
                                                                      child:   Text( snapshot.data?.docs[index].get(AppConstants.Transaction_Status_Flag)==1?
                                                                             'Unconfirmed':"confirmed",

                                                                        textScaleFactor: 1.3,
                                                                        style: const TextStyle(color: Colors.red),

                                                                        //  textAlign: TextAlign.center,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                        padding: EdgeInsets.all(15),
                                                                        child: OutlinedButton(
                                                                            style: OutlinedButton.styleFrom(
                                                                                elevation: 6,
                                                                                // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                                                                padding: const EdgeInsets.all(15),
                                                                                backgroundColor: Colors.black,
                                                                                shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(30))),
                                                                            child: const Text(
                                                                              'Mine Block',
                                                                              style: TextStyle(fontSize: 15, color: Colors.white),
                                                                            ),
                                                                            onPressed: () async {
                                                                              BlockRepositoryImpl().mineBlock(snapshot.data?.docs[index].get(AppConstants.Node_Number));

                                                                            }
                                                                        )),



                                                                  ]),

                                                                )
                                                            ) ]),
                                                    );

                                                  }): Container(
                                                height: 200,

                                                alignment: Alignment.center,
                                                padding: EdgeInsets.all(5.0),
                                                child: Text("No Un-Confirmed Transactions",

                                                  textScaleFactor: 2,
                                                  style: const TextStyle(color: Colors.black),

                                                  //  textAlign: TextAlign.center,
                                                ),
                                              )



                                         ):     Container(
                                           height: 200,
                                           alignment: Alignment.center,
                                           padding: EdgeInsets.all(5.0),
                                           child: Text("No Un-Confirmed Transactions",

                                             textScaleFactor: 2,
                                             style: const TextStyle(color: Colors.black),

                                             //  textAlign: TextAlign.center,
                                           ),
                                         );

                                      }));

                              // } else {
                              //   return const Center(child: CircularProgressIndicator());
                              // }
                            },

                          )






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
