import 'dart:collection';
import 'dart:io';


import 'package:blockchain_world/accounts/controller/bloc/accoun_bloc/AccountsBloc.dart';
import 'package:blockchain_world/accounts/view/ShowAccountTransactions.dart';
import 'package:blockchain_world/blocks/bloc/events/BlockEvents.dart';
import 'package:blockchain_world/blocks/view/GetAllBlocks.dart';
import 'package:blockchain_world/transactions/Model/AddTransactionPOJO.dart';
import 'package:blockchain_world/transactions/bloc/transaction_repository/TransactionRepository.dart';
import 'package:blockchain_world/util/common/Argument.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../blocks/bloc/block_bloc/BlockBloc.dart';
import '../../blocks/bloc/block_repository/BlockRepository.dart';
import '../../network/RestClient.dart';
import '../../util/appconstants/AppConstants.dart';
import '../../util/ui/sizeConfig.dart';
import '../controller/bloc/events/AccountsEvents.dart';
import '../controller/bloc/repository/AccountRepository.dart';
import '../controller/bloc/states/AccountState.dart';
import '../model/CreateWalletPOJO.dart';

class CreateAccounts extends StatelessWidget {
  static const String routeName = "/CreateNodes";

  CreateAccounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CreateAccountsState(
//        id: genresId,
//        genresName: genresName,
//        pageDirection: pageDirection,
          key: key),
    );
  }
}

class CreateAccountsState extends StatefulWidget {
  const CreateAccountsState({Key? key}) : super(key: key);

//  final int id;
//  final String genresName;
//  final int pageDirection;

  @override
  _CreateAccountsStates createState() => _CreateAccountsStates();
}

var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;
RestClient restApiClient = RestClient(dio);

class _CreateAccountsStates extends State<CreateAccountsState> {
  var noceController = TextEditingController();
  var receiverController = TextEditingController();
  var amountController = TextEditingController();
  bool _obscured = false;
  late String receiverId="";
  final textFieldFocusNode = FocusNode();
 late  int nodeMinedBlockCount=0;

  late List<CreateWalletPOJO> searchPublicKeys = [];
  late String receiverPublicKey;
  @override
  void initState() {
    // TODO: implement initState
    print("initstate");


    super.initState();
  }







  @override
  Widget build(BuildContext context) {
    context
        .read<BlockBloc>()
        .add(GetBlockEvent());


    Future<void> showTransactionDialog(AsyncSnapshot snapshot, int index) {
      return showDialog<void>(
        context: context,
        // false = user must tap button, true = tap outside dialog
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text('Transaction'),
            actions: <Widget>[
              Column(
                children: [
                  // SizedBox(height: 50),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      snapshot.data?.docs[index].get(AppConstants.Public_key),

                      textScaleFactor: 1.3,
                      style: const TextStyle(color: Colors.black54),

                      //  textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Autocomplete<CreateWalletPOJO>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        return searchPublicKeys
                            .where((CreateWalletPOJO publicKeys) =>
                            publicKeys.publicKey
                                .toLowerCase()
                                .startsWith(
                                textEditingValue.text.toLowerCase()))
                            .toList();
                      },
                      displayStringForOption: (CreateWalletPOJO option) =>
                      option.publicKey,
                      fieldViewBuilder: (BuildContext context,
                          TextEditingController receiverController,
                          FocusNode fieldFocusNode,
                          VoidCallback onFieldSubmitted) {
                        return Card(
                            elevation: 14,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextField(
                              decoration: const InputDecoration(
                                  hintText: "Search Key",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.0),
                                  )),
                              controller: receiverController,
                              focusNode: fieldFocusNode,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal),
                            ));
                      },
                      onSelected: (CreateWalletPOJO selection) {
                        print('Selected: ${selection}');
                      },
                      optionsViewBuilder: (BuildContext context,
                          AutocompleteOnSelected<CreateWalletPOJO> onSelected,
                          Iterable<CreateWalletPOJO> options) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            child: Container(
                              width: SizeConfig.widthMultiplier * 90,
                              color: Colors.white,
                              child: ListView.builder(
                                padding: EdgeInsets.all(10.0),
                                itemCount: options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  CreateWalletPOJO option =
                                  options.elementAt(index);

                                  return GestureDetector(
                                      onTap: () {
                                        onSelected(option);
                                        setState(() {
                                          receiverId = option.message;
                                          receiverPublicKey = option.publicKey;
                                        });


                                        print("object" + receiverId);
                                      },
                                      child: Text(option.publicKey,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 12))
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.2))
                        ]),
                    child: TextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      obscureText: _obscured,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        //Hides label on focus or if filled
                        labelText: "Amount",
                        isDense: true,
                        // Reduces height a bit
                        prefixIcon: const Icon(Icons.attach_money_outlined,
                            color: Colors.grey, size: 24),
                        suffixIcon: const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 4, 0),

                        ),
                        hintText: "Amount",

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          elevation: 6,
                          // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                          padding: const EdgeInsets.all(15),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: const Text(
                        'Make Transaction',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onPressed: () async {
                        String senderId = snapshot.data?.docs[index].id;


                        amountController.text.isNotEmpty ? FirebaseFirestore
                            .instance.collection(
                            AppConstants.Node_Deatils).doc(
                            receiverId).get().then((value) {
                          if (value.get(AppConstants.Public_key) !=
                              receiverPublicKey) {
                            print("INVALIs");
                          }
                          else {
                            double senderCurrentAmount = double.parse(snapshot
                                .data.docs[index]
                                .get(AppConstants.Coins)
                                .toString());

                            if (senderCurrentAmount <
                                int.parse(
                                    amountController.value.text)) {} else {
                              double receiverCurrentAmount = value.get(
                                  AppConstants.Coins);
                              print(receiverCurrentAmount);
                              double receiverAmountFinal =
                                  receiverCurrentAmount +
                                      int.parse(amountController.value.text);
                              double senderAmountFinal = senderCurrentAmount -
                                  int.parse(amountController.value.text);

                              AddTransactionPOJO addTransactionPOJO =
                              AddTransactionPOJO(
                                  snapshot.data?.docs[index]
                                      .get(AppConstants.Private_Key),
                                  receiverPublicKey,
                                  double.parse(amountController.value.text),
                                  receiverId);

                              TransactionRepositoryImpl()
                                  .addTransactionToBlock(addTransactionPOJO)
                                  .then((value) {
                                TransactionRepositoryImpl()
                                    .addTransactionToFirebase(
                                    snapshot.data?.docs[index]
                                        .get(AppConstants.Private_Key),
                                    receiverPublicKey,
                                    double.parse(
                                        amountController.value.text),
                                    snapshot.data.docs[index].id);
                              });

                              AccountRepositoryImpl().updateWalletAmount(
                                  senderId, senderAmountFinal);
                              AccountRepositoryImpl().updateWalletAmount(
                                  receiverId, receiverAmountFinal);
                            }
                          }
                        }
                        ) : Text("Invalid");


                        Navigator.of(context, rootNavigator: true).pop();


                        // int node_number=snapshot.data!.docs[index]
                        //     .get(AppConstants.Node_Number);


                      }),
                ],
              )
            ],
          );
        },
      );
    }


    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);


        return SingleChildScrollView(
          child: Container(
            height: SizeConfig.heightMultiplier * 98,
            width: MediaQuery
                .of(context)
                .orientation == Orientation.landscape ? MediaQuery
                .of(context)
                .size
                .width : SizeConfig.widthMultiplier * 80,
            padding: const EdgeInsets.all(35),

            child: ListView(
              children: [


                StreamBuilder(
                    stream: BlockRepositoryImpl().getBlocks(),

                    builder: (BuildContext context,
                        AsyncSnapshot snapshot) {
                      return Container();
                    }),


                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1, 1),
                            color: Colors.grey.withOpacity(0.2))
                      ]),
                  child: TextField(
                    controller: noceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Create Nodes',

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: SizeConfig.widthMultiplier * 90,
                    height: SizeConfig.heightMultiplier * 5,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            elevation: 6,
                            // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                            padding: const EdgeInsets.all(15),
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: const Text(
                          'Add Nodes',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        onPressed: () async {
                          // setState(() {
                          //
                          // });


                          int nodeLength =
                          int.parse(noceController.value.text);

                          context
                              .read<AccountsBloc>()
                              .add(AddAccountEvent(nodeLength));
                        })),
                SizedBox(
                  height: 20,
                ),

                Container(
                    height: SizeConfig.heightMultiplier * 60,
                    width: SizeConfig.widthMultiplier * 90,
                    child:
                    StreamBuilder(
                      stream: AccountRepositoryImpl().getNodes(),
                      builder: (context, snapshot) {
                        // AsyncSnapshot<DocumentSnapshot> snapshot=snapshot.data.;
                        return ListView.builder(
                          itemCount: snapshot.data?.size,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  //});

                                },
                                child: Card(
                                    elevation: 12,

                                    child: Column(
                                      children: [


                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            "Public Key",

                                            textScaleFactor: 1.3,
                                            style: const TextStyle(
                                                color: Colors.black45),

                                            //  textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            snapshot.hasData != false
                                                ? snapshot.data!.docs[index]
                                                .get(AppConstants
                                                .Public_key)
                                                .toString() ??
                                                "NO"
                                                : "Wait",

                                            textScaleFactor: 1.3,
                                            style: const TextStyle(
                                                color: Colors.black),

                                            //  textAlign: TextAlign.center,
                                          ),
                                        ),

                                        // Container(
                                        //   alignment: Alignment.topLeft,
                                        //   padding: EdgeInsets.all(5.0),
                                        //   child: Text(
                                        //     snapshot.hasData != false
                                        //         ? snapshot.data!.docs[index]
                                        //         .get(AppConstants
                                        //         .Private_Key)
                                        //         .toString() ??
                                        //         "NO"
                                        //         : "Wait",
                                        //
                                        //     textScaleFactor: 1.3,
                                        //     style: const TextStyle(
                                        //         color: Colors.black),
                                        //
                                        //     //  textAlign: TextAlign.center,
                                        //   ),
                                        // ),


                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            "Amount",

                                            textScaleFactor: 1.3,
                                            style: const TextStyle(
                                                color: Colors.black45),

                                            //  textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            snapshot.hasData != false
                                                ? snapshot.data!.docs[index]
                                                .get(AppConstants
                                                .Coins)
                                                .toString() ??
                                                "NO"
                                                : "Wait",

                                            textScaleFactor: 1.3,
                                            style: const TextStyle(
                                                color: Colors.black),

                                            //  textAlign: TextAlign.center,
                                          ),
                                        ),


                                        Row(children: [
                                          Container(
                                              padding: EdgeInsets.all(15),
                                              child: OutlinedButton(
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
                                                              .circular(30))),
                                                  child: const Text(
                                                    'Show Details',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  ),
                                                  onPressed: () async {
                                                    await AccountRepositoryImpl()
                                                        .getNodeMinedBlockCount(
                                                        snapshot.data
                                                            .docs[index].
                                                        get(AppConstants
                                                            .Node_Number)
                                                    )
                                                        .then((value) {
                                                      nodeMinedBlockCount =
                                                          value;
                                                      print(
                                                          "nodeMinedBlockCount" +
                                                              value.toString());
                                                    });
                                                    print("Data" +
                                                        nodeMinedBlockCount
                                                            .toString());


                                                    SingleArgument singleArgs = SingleArgument(
                                                        key: snapshot.data!
                                                            .docs[index]
                                                            .get(AppConstants
                                                            .Private_Key),
                                                        mined_block_count: nodeMinedBlockCount,
                                                        node_index: snapshot
                                                            .data.docs[index].
                                                        get(AppConstants
                                                            .Node_Number));


                                                    //
                                                    Navigator.pushNamed(context,
                                                        ShowAccountTransactions
                                                            .routeName,
                                                        arguments: singleArgs);
                                                  }
                                              )),


                                          Container(
                                              padding: EdgeInsets.all(15),
                                              child: OutlinedButton(
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
                                                              .circular(30))),
                                                  child: const Text(
                                                    'Make Transaction',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  ),
                                                  onPressed: () async {
                                                    searchPublicKeys = [];

                                                    for (int i = 0;
                                                    i < snapshot.data?.size;
                                                    i++) {
                                                      double amt = double.parse(
                                                          snapshot
                                                              .data.docs[i]
                                                              .get(AppConstants
                                                              .Coins)
                                                              .toString());

                                                      // print(double.parse(snapshot.data?.docs[i].get(AppConstants.Coins).toString()));
                                                      searchPublicKeys.add(
                                                          CreateWalletPOJO(
                                                              amt,
                                                              snapshot.data
                                                                  .docs[i]
                                                                  .get(
                                                                  AppConstants
                                                                      .Wallet_CretedOn)
                                                                  .toString(),
                                                              snapshot.data
                                                                  ?.docs[i].id,
                                                              snapshot.data
                                                                  ?.docs[i]
                                                                  .get(
                                                                  AppConstants
                                                                      .Gas_limit),
                                                              snapshot.data
                                                                  ?.docs[i]
                                                                  .get(
                                                                  AppConstants
                                                                      .Private_Key),
                                                              snapshot.data
                                                                  ?.docs[i]
                                                                  .get(
                                                                  AppConstants
                                                                      .Public_key)));
                                                    }
                                                    // setState(() {
                                                    searchPublicKeys.removeAt(
                                                        index);

                                                    showTransactionDialog(
                                                        snapshot, index);
                                                  }
                                              )),


                                        ],)


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
