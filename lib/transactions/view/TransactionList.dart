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


var dio1 = Dio()..options.baseUrl = AppConstants.BASE_URL;
Node1 node1 = Node1(dio1);


var dio2 = Dio()..options.baseUrl = AppConstants.BASE_URL;
Node2 node2 = Node2(dio2);

class _AddTransactionsState extends State<AddTransactionsState> {




UnConfirmedTransactionsListPOJO? unConfirmedTransactionsListPOJO;


@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
@override
  void initState() {
    // TODO: implement initState

    super.initState();
    _focusLocationVisible = true;

  TransactionRepositoryImpl().getTransactionList().then((value) {
   //   setState(() {
        unConfirmedTransactionsListPOJO=value;

     // });

    });
  }

static bool _focusLocationVisible = true;

void setFocusButton() {
  setState(() {
    _focusLocationVisible = !_focusLocationVisible;
  });
}

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> _focusLocationVisible = ValueNotifier(true);


   return ValueListenableBuilder(
        valueListenable: _focusLocationVisible,
        builder: (context, _value, _)
    {
      return
        Scaffold(


            body: LayoutBuilder(builder: (context, constraints) {
              return OrientationBuilder(
                  builder: (context, orientation) {
                    SizeConfig().init(constraints, orientation);

                    final bool isLandscape = orientation ==
                        Orientation.landscape;
                    Orientation currentOrientation = MediaQuery
                        .of(context)
                        .orientation;

                    return SingleChildScrollView(

                      child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,

                          height: MediaQuery
                              .of(context)
                              .size
                              .height,
                          // width: SizeConfig.widthMultiplier*90,
                          padding: const EdgeInsets.all(10),

                          child:


                          ListView(children: [


                            // unConfirmedTransactionsListPOJO?.transactions.length!=0 ?
                            Row(children: [


                              Container(
                                // height:kIsWeb?
                                // SizeConfig.heightMultiplier*6: SizeConfig.heightMultiplier*8,
                                  padding: EdgeInsets.only(top: 5, bottom: 5),


                                  //width: SizeConfig.widthMultiplier * 90,
                                  child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          elevation: 6,
                                          // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                          backgroundColor: Colors.black,

                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius
                                                  .circular(30))),
                                      child: const Text(
                                        'Mine Block Node 5000',
                                        textScaleFactor: 1,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () async {
                                        AppConstants(context).startLoading();


                                        BlockRepositoryImpl()
                                            .mineBlockNodeOne()
                                            .then((value) {
                                          if (value.transactions.length!=0) {
                                            for (int i = 0; i <
                                                value
                                                    .transactions
                                                    .length; i++) {
                                              FirebaseFirestore
                                                  .instance
                                                  .collection(
                                                  "buyerTransactions")
                                                  .where(
                                                  "buyer",
                                                  isEqualTo: value
                                                      .transactions[i]
                                                      .tx
                                                      .sender).
                                              get().then((val) {
                                                FirebaseFirestore
                                                    .instance
                                                    .collection(
                                                    "buyerTransactions")
                                                    .doc(
                                                    val.docs[i]
                                                        .id)
                                                    .update({
                                                  "txt_status": true,
                                                  "txt_sign": value
                                                      .transactions[i]
                                                      .signature
                                                });
                                              });


                                              FirebaseFirestore
                                                  .instance
                                                  .collection(
                                                  "sellerTransactions")
                                                  .where(
                                                  "buyer",
                                                  isEqualTo: value
                                                      .transactions[i]
                                                      .tx
                                                      .sender).
                                              get().then((val) {
                                                FirebaseFirestore
                                                    .instance
                                                    .collection(
                                                    "sellerTransactions")
                                                    .doc(
                                                    val.docs[i]
                                                        .id)
                                                    .update({
                                                  "txt_status": true,
                                                  "txt_sign": value
                                                      .transactions[i]
                                                      .signature
                                                });
                                              });
                                            }


                                            FirebaseFirestore
                                                .instance
                                                .collection(
                                                AppConstants
                                                    .Account_Details)
                                                .get()
                                                .then((value) {
                                              restApiClient
                                                  .getAllAccounts()
                                                  .then((val) {
                                                for (int i = 0; i <
                                                    val.accounts
                                                        .length; i++) {
                                                  FirebaseFirestore
                                                      .instance
                                                      .collection(
                                                      AppConstants
                                                          .Account_Details)
                                                      .
                                                  doc(val
                                                      .accounts[i]
                                                      .public_key)
                                                      .update({


                                                    AppConstants
                                                        .Coins: val
                                                        .accounts[i]
                                                        .coins
                                                  });


                                                  //
                                                  //
                                                  // if(value.docs[0].get(AppConstants.Public_key)==val.accounts[i].public_key) {
                                                  //   FirebaseFirestore.instance.collection(AppConstants.Account_Details)
                                                  //     .doc(val.accounts[i].public_key).update(
                                                  //     {
                                                  //
                                                  //       AppConstants
                                                  //           .Coins: val.accounts[i].coins
                                                  //     } );
                                                  // }
                                                  //
                                                  // if(value.docs[1].get(AppConstants.Public_key)==val.accounts[i].public_key) {
                                                  //   FirebaseFirestore.instance.collection(AppConstants.Account_Details)
                                                  //       .doc(val.accounts[i].public_key).update(
                                                  //       {
                                                  //
                                                  //         AppConstants
                                                  //             .Coins: val.accounts[i].coins
                                                  //       } );
                                                  // }


                                                  FirebaseFirestore
                                                      .instance
                                                      .collection(
                                                      "cust_order_table")
                                                      .where(
                                                      "order_status",
                                                      isEqualTo: false)
                                                      .
                                                  get()
                                                      .then((value) {
                                                    for (int i = 0; i <
                                                        value
                                                            .docs
                                                            .length; i++) {
                                                      FirebaseFirestore
                                                          .instance
                                                          .collection(
                                                          "cust_order_table")
                                                          .doc(
                                                          value
                                                              .docs[i]
                                                              .id)
                                                          .update(
                                                          {
                                                            "order_status": true
                                                          });
                                                    }
                                                  });

                                                  FirebaseFirestore
                                                      .instance
                                                      .collection(
                                                      "seller_order_table")
                                                      .where(
                                                      "order_status",
                                                      isEqualTo: false)
                                                      .
                                                  get()
                                                      .then((value) {
                                                    for (int i = 0; i <
                                                        value
                                                            .docs
                                                            .length; i++) {
                                                      FirebaseFirestore
                                                          .instance
                                                          .collection(
                                                          "seller_order_table")
                                                          .doc(
                                                          value
                                                              .docs[i]
                                                              .id)
                                                          .update(
                                                          {
                                                            "order_status": true
                                                          });
                                                    }
                                                  });
                                                }
                                              });
                                            });
                                          }


                                          setFocusButton();


                                          AppConstants(context).stopLoading();

                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context) {
                                              return
                                                Column(children: [

                                                  Expanded(
                                                    child: AlertDialog(
                                                      //title: Text('Welcome'),
                                                      content: Text(
                                                          value.message
                                                              .toString()),
                                                      actions: [
                                                        Container(
                                                          width: 80,
                                                          child: OutlinedButton(

                                                            onPressed: () async {
                                                              // Navigator.of(context).pop();
                                                              //Navigator.of(context).pop();

                                                              _focusLocationVisible;
                                                              _focusLocationVisible!=true
                                                                  ?value.transactions.isNotEmpty:"OK";



                                                              Navigator.pop(
                                                                  context);
                                                              // await Navigator.of(context)
                                                              //     .push(new MaterialPageRoute(builder: (context) => GetAllBlocks()));
                                                              // setState((){});


                                                              //avigator.of(context).pushReplacementNamed("/GetAllBlocks");

                                                              //  Navigator.of(context).pop();


                                                            },
                                                            style: OutlinedButton
                                                                .styleFrom(
                                                                elevation: 6,
                                                                // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                                                padding: const EdgeInsets
                                                                    .all(15),

                                                                backgroundColor: Colors
                                                                    .black,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius
                                                                        .circular(
                                                                        30))),
                                                            child: const Text(
                                                              'Ok',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ]);
                                            },
                                          );
                                        });
                                        // setState(() {
                                        //
                                        // });


                                      })),
                              Container(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  margin: EdgeInsets.all(5),


                                  //width: SizeConfig.widthMultiplier * 90,
                                  child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          elevation: 6,
                                          // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                          backgroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius
                                                  .circular(30))),
                                      child: const Text(
                                        'Mine Block Node 5001',
                                        textScaleFactor: 1,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () async {
                                        AppConstants(context).startLoading();

                                        node1
                                            .mineBlock().then((value) {

                                          AppConstants(context).stopLoading();

                                          setFocusButton();


                                          if (value.transactions.length!=0) {
                                            for (int i = 0; i <
                                                value
                                                    .transactions
                                                    .length; i++) {
                                              FirebaseFirestore
                                                  .instance
                                                  .collection(
                                                  "buyerTransactions")
                                                  .where(
                                                  "buyer",
                                                  isEqualTo: value
                                                      .transactions[i]
                                                      .tx
                                                      .sender).
                                              get().then((val) {
                                                FirebaseFirestore
                                                    .instance
                                                    .collection(
                                                    "buyerTransactions")
                                                    .doc(
                                                    val.docs[i]
                                                        .id)
                                                    .update({
                                                  "txt_status": true,
                                                  "txt_sign": value
                                                      .transactions[i]
                                                      .signature
                                                });
                                              });


                                              FirebaseFirestore
                                                  .instance
                                                  .collection(
                                                  "sellerTransactions")
                                                  .where(
                                                  "buyer",
                                                  isEqualTo: value
                                                      .transactions[i]
                                                      .tx
                                                      .sender).
                                              get().then((val) {
                                                FirebaseFirestore
                                                    .instance
                                                    .collection(
                                                    "sellerTransactions")
                                                    .doc(
                                                    val.docs[i]
                                                        .id)
                                                    .update({
                                                  "txt_status": true,
                                                  "txt_sign": value
                                                      .transactions[i]
                                                      .signature
                                                });
                                              });
                                            }


                                            FirebaseFirestore
                                                .instance
                                                .collection(
                                                AppConstants
                                                    .Account_Details)
                                                .get()
                                                .then((value) {
                                              restApiClient
                                                  .getAllAccounts()
                                                  .then((val) {
                                                for (int i = 0; i <
                                                    val.accounts
                                                        .length; i++) {
                                                  FirebaseFirestore
                                                      .instance
                                                      .collection(
                                                      AppConstants
                                                          .Account_Details)
                                                      .
                                                  doc(val
                                                      .accounts[i]
                                                      .public_key)
                                                      .update({


                                                    AppConstants
                                                        .Coins: val
                                                        .accounts[i]
                                                        .coins
                                                  });


                                                  //
                                                  //
                                                  // if(value.docs[0].get(AppConstants.Public_key)==val.accounts[i].public_key) {
                                                  //   FirebaseFirestore.instance.collection(AppConstants.Account_Details)
                                                  //     .doc(val.accounts[i].public_key).update(
                                                  //     {
                                                  //
                                                  //       AppConstants
                                                  //           .Coins: val.accounts[i].coins
                                                  //     } );
                                                  // }
                                                  //
                                                  // if(value.docs[1].get(AppConstants.Public_key)==val.accounts[i].public_key) {
                                                  //   FirebaseFirestore.instance.collection(AppConstants.Account_Details)
                                                  //       .doc(val.accounts[i].public_key).update(
                                                  //       {
                                                  //
                                                  //         AppConstants
                                                  //             .Coins: val.accounts[i].coins
                                                  //       } );
                                                  // }


                                                  FirebaseFirestore
                                                      .instance
                                                      .collection(
                                                      "cust_order_table")
                                                      .where(
                                                      "order_status",
                                                      isEqualTo: false)
                                                      .
                                                  get()
                                                      .then((value) {
                                                    for (int i = 0; i <
                                                        value
                                                            .docs
                                                            .length; i++) {
                                                      FirebaseFirestore
                                                          .instance
                                                          .collection(
                                                          "cust_order_table")
                                                          .doc(
                                                          value
                                                              .docs[i]
                                                              .id)
                                                          .update(
                                                          {
                                                            "order_status": true
                                                          });
                                                    }
                                                  });

                                                  FirebaseFirestore
                                                      .instance
                                                      .collection(
                                                      "seller_order_table")
                                                      .where(
                                                      "order_status",
                                                      isEqualTo: false)
                                                      .
                                                  get()
                                                      .then((value) {
                                                    for (int i = 0; i <
                                                        value
                                                            .docs
                                                            .length; i++) {
                                                      FirebaseFirestore
                                                          .instance
                                                          .collection(
                                                          "seller_order_table")
                                                          .doc(
                                                          value
                                                              .docs[i]
                                                              .id)
                                                          .update(
                                                          {
                                                            "order_status": true
                                                          });
                                                    }
                                                  });
                                                }
                                              });
                                            });
                                          }



                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context) {
                                              return
                                                Column(children: [

                                                  Expanded(
                                                    child: AlertDialog(
                                                      //title: Text('Welcome'),
                                                      content: Text(
                                                          value.message
                                                              .toString()),
                                                      actions: [
                                                        Container(
                                                          width: 80,
                                                          child: OutlinedButton(

                                                            onPressed: () async {
                                                              Navigator.of(
                                                                  context)
                                                                  .pop();


                                                              //
                                                              // Navigator.pushNamed(context,
                                                              //     "/GetAllBlocks"
                                                              // );

                                                            },
                                                            style: OutlinedButton
                                                                .styleFrom(
                                                                elevation: 6,
                                                                // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                                                padding: const EdgeInsets
                                                                    .all(15),

                                                                backgroundColor: Colors
                                                                    .black,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius
                                                                        .circular(
                                                                        30))),
                                                            child: const Text(
                                                              'Ok',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ]);
                                            },
                                          );
                                        });
                                        // setState(() {
                                        //
                                        // });


                                      })),
                              Container(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),


                                  //width: SizeConfig.widthMultiplier * 90,
                                  child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          elevation: 6,
                                          // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                          backgroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius
                                                  .circular(30))),
                                      child: const Text(
                                        'Mine Block Node 5002',
                                        textScaleFactor: 1,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () async {
                                        AppConstants(context).startLoading();

                                        BlockRepositoryImpl()
                                            .mineBlockNodeThree()
                                            .then((value) {
                                          AppConstants(context).stopLoading();
                                          setFocusButton();

                                          if (value.transactions.length!=0) {
                                            for (int i = 0; i <
                                                value
                                                    .transactions
                                                    .length; i++) {
                                              FirebaseFirestore
                                                  .instance
                                                  .collection(
                                                  "buyerTransactions")
                                                  .where(
                                                  "buyer",
                                                  isEqualTo: value
                                                      .transactions[i]
                                                      .tx
                                                      .sender).
                                              get().then((val) {
                                                FirebaseFirestore
                                                    .instance
                                                    .collection(
                                                    "buyerTransactions")
                                                    .doc(
                                                    val.docs[i]
                                                        .id)
                                                    .update({
                                                  "txt_status": true,
                                                  "txt_sign": value
                                                      .transactions[i]
                                                      .signature
                                                });
                                              });


                                              FirebaseFirestore
                                                  .instance
                                                  .collection(
                                                  "sellerTransactions")
                                                  .where(
                                                  "buyer",
                                                  isEqualTo: value
                                                      .transactions[i]
                                                      .tx
                                                      .sender).
                                              get().then((val) {
                                                FirebaseFirestore
                                                    .instance
                                                    .collection(
                                                    "sellerTransactions")
                                                    .doc(
                                                    val.docs[i]
                                                        .id)
                                                    .update({
                                                  "txt_status": true,
                                                  "txt_sign": value
                                                      .transactions[i]
                                                      .signature
                                                });
                                              });
                                            }


                                            FirebaseFirestore
                                                .instance
                                                .collection(
                                                AppConstants
                                                    .Account_Details)
                                                .get()
                                                .then((value) {
                                              restApiClient
                                                  .getAllAccounts()
                                                  .then((val) {
                                                for (int i = 0; i <
                                                    val.accounts
                                                        .length; i++) {
                                                  FirebaseFirestore
                                                      .instance
                                                      .collection(
                                                      AppConstants
                                                          .Account_Details)
                                                      .
                                                  doc(val
                                                      .accounts[i]
                                                      .public_key)
                                                      .update({


                                                    AppConstants
                                                        .Coins: val
                                                        .accounts[i]
                                                        .coins
                                                  });


                                                  //
                                                  //
                                                  // if(value.docs[0].get(AppConstants.Public_key)==val.accounts[i].public_key) {
                                                  //   FirebaseFirestore.instance.collection(AppConstants.Account_Details)
                                                  //     .doc(val.accounts[i].public_key).update(
                                                  //     {
                                                  //
                                                  //       AppConstants
                                                  //           .Coins: val.accounts[i].coins
                                                  //     } );
                                                  // }
                                                  //
                                                  // if(value.docs[1].get(AppConstants.Public_key)==val.accounts[i].public_key) {
                                                  //   FirebaseFirestore.instance.collection(AppConstants.Account_Details)
                                                  //       .doc(val.accounts[i].public_key).update(
                                                  //       {
                                                  //
                                                  //         AppConstants
                                                  //             .Coins: val.accounts[i].coins
                                                  //       } );
                                                  // }


                                                  FirebaseFirestore
                                                      .instance
                                                      .collection(
                                                      "cust_order_table")
                                                      .where(
                                                      "order_status",
                                                      isEqualTo: false)
                                                      .
                                                  get()
                                                      .then((value) {
                                                    for (int i = 0; i <
                                                        value
                                                            .docs
                                                            .length; i++) {
                                                      FirebaseFirestore
                                                          .instance
                                                          .collection(
                                                          "cust_order_table")
                                                          .doc(
                                                          value
                                                              .docs[i]
                                                              .id)
                                                          .update(
                                                          {
                                                            "order_status": true
                                                          });
                                                    }
                                                  });

                                                  FirebaseFirestore
                                                      .instance
                                                      .collection(
                                                      "seller_order_table")
                                                      .where(
                                                      "order_status",
                                                      isEqualTo: false)
                                                      .
                                                  get()
                                                      .then((value) {
                                                    for (int i = 0; i <
                                                        value
                                                            .docs
                                                            .length; i++) {
                                                      FirebaseFirestore
                                                          .instance
                                                          .collection(
                                                          "seller_order_table")
                                                          .doc(
                                                          value
                                                              .docs[i]
                                                              .id)
                                                          .update(
                                                          {
                                                            "order_status": true
                                                          });
                                                    }
                                                  });
                                                }
                                              });
                                            });
                                          }




                                          showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context) {
                                              return
                                                Column(children: [

                                                  Expanded(
                                                    child: AlertDialog(
                                                      //title: Text('Welcome'),
                                                      content: Text(
                                                          value.message.toString()),
                                                      actions: [
                                                        Container(
                                                          width: 80,
                                                          child: OutlinedButton(

                                                            onPressed: () async {
                                                              Navigator.of(
                                                                  context)
                                                                  .pop();


                                                              // Navigator.pushNamed(context,
                                                              //     "/GetAllBlocks"
                                                              // );

                                                            },
                                                            style: OutlinedButton
                                                                .styleFrom(
                                                                elevation: 6,
                                                                // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                                                padding: const EdgeInsets
                                                                    .all(15),

                                                                backgroundColor: Colors
                                                                    .black,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius
                                                                        .circular(
                                                                        30))),
                                                            child: const Text(
                                                              'Ok',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ]);
                                            },
                                          );
                                        });
                                        // setState(() {
                                        //
                                        // });


                                      })),
                            ],),


                            // BlocBuilder<TransactionBloc, TransactionState>(
                            //   builder: (context, state) {
                                 FutureBuilder(

                                  future: restApiClient
                                      .getAllTransactions()
                                      .then((value) {
                                    unConfirmedTransactionsListPOJO = value;
                                    print(value.transactions.length.toString());
                                  }),

                                  builder: (context, snapshot) {
                                    return Container(
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.65,

                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      padding: EdgeInsets.only(
                                          left: 20, right: 20),

                                      child:


                                      unConfirmedTransactionsListPOJO
                                          ?.transactions.length != 0 ? ListView
                                          .builder(
                                        itemCount: unConfirmedTransactionsListPOJO
                                            ?.transactions.length,

                                        itemBuilder: (context, index) {
                                          return Container(

                                              color: Colors.white,


                                              // elevation:11,
                                              margin: EdgeInsets.all(10),


                                              child: Card(

                                                elevation: 11,
                                                child: Container(
                                                  width: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width * 90,

                                                  child: (Column(children: [

                                                    Container(
                                                      alignment: Alignment
                                                          .topLeft,
                                                      padding: EdgeInsets.all(
                                                          5.0),
                                                      child: const Text(
                                                        "Sender",
                                                        textScaleFactor: 1.1,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black45),

                                                        //  textAlign: TextAlign.center,
                                                      ),
                                                    ),


                                                    Container(
                                                      alignment: Alignment
                                                          .topLeft,
                                                      padding: EdgeInsets.all(
                                                          5.0),
                                                      child: Text(
                                                        unConfirmedTransactionsListPOJO
                                                            ?.transactions[index]
                                                            .tx?.sender ?? "",
                                                        textScaleFactor: 1.1,
                                                        style: TextStyle(
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
                                                      child: const Text(
                                                        "Receiver",
                                                        textScaleFactor: 1.1,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black45),

                                                        //  textAlign: TextAlign.center,
                                                      ),
                                                    ),


                                                    Container(
                                                      alignment: Alignment
                                                          .topLeft,
                                                      padding: EdgeInsets.all(
                                                          5.0),
                                                      child: Text(
                                                        unConfirmedTransactionsListPOJO
                                                            ?.transactions[index]
                                                            .tx?.receiver ?? "",
                                                        textScaleFactor: 1.1,
                                                        style: TextStyle(
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
                                                      child: const Text(
                                                        "Transaction Signature",
                                                        textScaleFactor: 1.1,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black45),

                                                        //  textAlign: TextAlign.center,
                                                      ),
                                                    ),


                                                    Container(
                                                      alignment: Alignment
                                                          .topLeft,
                                                      padding: EdgeInsets.all(
                                                          5.0),
                                                      child: Text(
                                                        unConfirmedTransactionsListPOJO
                                                            ?.transactions[index]
                                                            .signature
                                                            .toString() ?? "",
                                                        textScaleFactor: 1.1,
                                                        style: TextStyle(
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
                                                      child: const Text(
                                                        "Coins",
                                                        textScaleFactor: 1.1,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black45),

                                                        //  textAlign: TextAlign.center,
                                                      ),
                                                    ),


                                                    Container(
                                                      alignment: Alignment
                                                          .topLeft,
                                                      padding: EdgeInsets.all(
                                                          5.0),
                                                      child: Text(
                                                        unConfirmedTransactionsListPOJO
                                                            ?.transactions[index]
                                                            .tx?.amount
                                                            .toString() ?? "",
                                                        textScaleFactor: 1.1,
                                                        style: TextStyle(
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
                                                      child: const Text(
                                                        "Transaction Status",
                                                        textScaleFactor: 1.1,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black45),

                                                        //  textAlign: TextAlign.center,
                                                      ),
                                                    ),


                                                    Container(
                                                      alignment: Alignment
                                                          .topLeft,
                                                      padding: EdgeInsets.all(
                                                          5.0),
                                                      child: Text(
                                                        "Un-Confrimed",
                                                        textScaleFactor: 1.1,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .redAccent),

                                                        //  textAlign: TextAlign.center,
                                                      ),
                                                    ),


                                                  ],)),
                                                ),)


                                          );
                                        },) : Container(
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.all(5.0),
                                        child: const Text(
                                          "No pending transactions",
                                          textScaleFactor: 2.1,
                                          style: TextStyle(
                                              color: Colors.black45),

                                          //  textAlign: TextAlign.center,
                                        ),
                                      ),


                                    );
                                  // },);


                                // } else {
                                //   return const Center(child: CircularProgressIndicator());
                                // }
                              },

                            ),
                          ])


                      ),


                      // ],
                      // ),
                      //   ),
                      // ),
                    );
                  });
            }));});

  }
}
