import 'package:blockchain_world/accounts/controller/bloc/accoun_bloc/AccountsBloc.dart';
import 'package:blockchain_world/accounts/model/AllAccounts/AllAccountsPOJO.dart';

import 'package:blockchain_world/transactions/model/AddTransactionPOJO.dart';
import 'package:blockchain_world/util/common/Argument.dart';
import 'package:blockchain_world/util/ui/ALertDialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';


import '../../blocks/bloc/block_bloc/BlockBloc.dart';
import '../../blocks/bloc/block_repository/BlockRepository.dart';
import '../../network/Node1.dart';
import '../../network/Node2.dart';
import '../../network/RestClient.dart';


import '../../transactions/view/TransactionList.dart';
import '../../util/appconstants/AppConstants.dart';
import '../../util/ui/sizeConfig.dart';
import '../controller/bloc/events/AccountsEvents.dart';
import '../controller/bloc/repository/AccountRepository.dart';
import '../controller/bloc/states/AccountState.dart';

class CreateAccounts extends StatelessWidget {
  static const String routeName = "/CreateAccounts";

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


var dio1 = Dio()..options.baseUrl = AppConstants.BASE_URL_NODE1;
Node1 node1 = Node1(dio1);


var dio2 = Dio()..options.baseUrl = AppConstants.BASE_URL_NODE2;
Node2 node2 = Node2(dio2);

class _CreateAccountsStates extends State<CreateAccountsState> {
  var noceController = TextEditingController();
  var receiverController = TextEditingController();
  var amountController = TextEditingController();
  var teSenderPrivateKey=TextEditingController();
  bool _obscured = false;
  late String receiverId="";
  final textFieldFocusNode = FocusNode();
 late  int nodeMinedBlockCount=0;
 late  bool copyKeyButtonVisibility=true;

  late List<Accounts> searchPublicKeys = [];
  late String receiverPublicKey;
   AllAccountsPOJO? accountsPOJO;
  bool switchValue = true;
  bool isVisible = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    print("initstate");
    context
        .read<AccountsBloc>()
        .add(GetAllAccount());

    super.initState();
  }

  GlobalKey<ScaffoldState> _scaffoldKey  = new GlobalKey<ScaffoldState>();




  @override
  Widget build(BuildContext context) {

    Future<void> showTransactionDialogs(int index,String senderPublicKey,String senderPrivateKey) async {
      showDialog(
          context:this.context ,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: MediaQuery.of(context).size.height*0.50,
                width: MediaQuery.of(context).size.width*0.50,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [





                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Sender Public Key",

                          textScaleFactor: 1.1,
                          style: const TextStyle(color: Colors.black45),

                          //  textAlign: TextAlign.center,
                        ),
                      ),


                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          senderPublicKey,

                          textScaleFactor: 1.1,
                          style: const TextStyle(color: Colors.black),

                          //  textAlign: TextAlign.center,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Autocomplete<Accounts>(
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            return searchPublicKeys
                                .where((Accounts publicKeys) =>
                                publicKeys.public_key.toLowerCase()
                                    .startsWith(
                                    textEditingValue.text.toLowerCase()))
                                .toList();
                          },
                          displayStringForOption: (Accounts option) =>
                              option.public_key.toLowerCase(),
                          fieldViewBuilder: (BuildContext context,
                              TextEditingController receiverController,
                              FocusNode fieldFocusNode,
                              VoidCallback onFieldSubmitted) {
                            return         Container(
                              // padding: EdgeInsets.all(20),
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
                                  decoration: InputDecoration(
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    //Hides label on focus or if filled
                                    labelText: "Search Public Keys",
                                    isDense: true,
                                    // Reduces height a bit
                                    prefixIcon: const Icon(Icons.key,
                                        color: Colors.grey, size: 24),
                                    suffixIcon: const Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 4, 0),

                                    ),
                                    hintText: "Public Keys",

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





                                  controller: receiverController,
                                  focusNode: fieldFocusNode,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal),
                                ));
                          },
                          onSelected: (Accounts selection) {
                            print('Selected: ${selection}');
                          },
                          optionsViewBuilder: (BuildContext context,
                              AutocompleteOnSelected<Accounts> onSelected,
                              Iterable<Accounts> options) {


                            return Align(
                              alignment: Alignment.topLeft,
                              child: Material(
                                child: Container(
                                  height:  MediaQuery.of(context).size.height*0.40,
                                  width: MediaQuery.of(context).size.width*0.50,
                                  color: Colors.white,
                                  child: ListView.builder(
                                    //shrinkWrap: false,
                                    // padding: EdgeInsets.all(50.0),
                                    itemCount: options.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      Accounts option =
                                      options.elementAt(index);



                                      return GestureDetector(
                                          onTap: () {
                                            onSelected(option);
                                            setState(() {
                                              //  receiverId = option.receiver;
                                              receiverPublicKey = option.public_key;
                                            });


                                            print("object" + receiverId);
                                          },
                                          child:


                                          option.public_key!=senderPublicKey?

                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [




                                              const Text("Public Key",
                                                  textScaleFactor: 1.1,

                                                  style: TextStyle(
                                                    color: Colors.black45,
                                                  )),


                                              Text(option.public_key,
                                                  textScaleFactor: 1.1,

                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  )),

                                              Divider(
                                                color: Colors.black12,
                                                thickness: 1.0,
                                              ),

                                            ],):Container()




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
                        // padding: EdgeInsets.all(20),
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
                          controller: teSenderPrivateKey,
                          obscureText: _obscured,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            //Hides label on focus or if filled
                            labelText: "Sender Private Key",
                            isDense: true,
                            // Reduces height a bit
                            prefixIcon: const Icon(Icons.attach_money_outlined,
                                color: Colors.grey, size: 24),
                            suffixIcon: const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 4, 0),

                            ),
                            hintText: "Sender Private Key",

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

                      Container(
                        // padding: EdgeInsets.all(20),
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

                      Row(children: [
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                elevation: 6,
                                // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                padding: const EdgeInsets.all(15),
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            child: const Text(
                              'Make Transactionss',
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            onPressed: () async {
                              //deactivate();
                             //dispose();



                              if(teSenderPrivateKey.text.isEmpty) {
                                Alerts(context,"To complete the Transaction sender  Private Key");

                              }
                              else if(receiverPublicKey.isEmpty)
                              {

                                Alerts(context,"Please select receipt");

                              }
                              else if(amountController.text.isEmpty)
                              {
                                Alerts(context,"Please enter amount ");

                              }

                              else {
                                print("senderPublicKey" +senderPublicKey);

                                print("senderPublicKey  ----" + teSenderPrivateKey.value.text);
                                print("re" +   receiverPublicKey);

                                print("amt" +  int.parse(amountController.value.text).toString());
                                AddTransactionPOJO addTransactionPOJO =
                                AddTransactionPOJO(
                                    senderPublicKey,
                                    receiverPublicKey,
                                    int.parse(amountController.value.text),
                                    teSenderPrivateKey.value.text
                                );


                                AddTransactionPOJO addTransactionPOJO1 =
                                AddTransactionPOJO(
                                    senderPublicKey,
                                    receiverPublicKey,
                                    int.parse(amountController.value.text),
                                    teSenderPrivateKey.value.text
                                );

                                AddTransactionPOJO addTransactionPOJO2 =
                                AddTransactionPOJO(
                                    senderPublicKey,
                                    receiverPublicKey,
                                    int.parse(amountController.value.text),
                                    teSenderPrivateKey.value.text
                                );


                                restApiClient.addTransaction(addTransactionPOJO)
                                    .then((value) {
                                  amountController.text="";
                                  receiverPublicKey="";
                                  teSenderPrivateKey.text="";

                                  print("---" + value.toString());
                                  Navigator.of(context).pop();



                                  Alerts(context, value.toString());
                                });
                                node1.addTransaction(addTransactionPOJO1).then((
                                    value) {
                                  amountController.text="";
                                  receiverPublicKey="";
                                  teSenderPrivateKey.text="";

                                  print("va" + value.toString());
                                });
                                node2.addTransaction(addTransactionPOJO2).then((
                                    value) {
                                  amountController.text="";
                                  receiverPublicKey="";
                                  teSenderPrivateKey.text="";
                                  print("va" + value.toString());
                                });
                                ;


                                print("Base url" + AppConstants.BASE_URL);
// // //
//




                                // Navigator.of(context, rootNavigator: true).pop();
                              }

                            }),

                        SizedBox(width: 10,),

                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                elevation: 6,
                                // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                padding: const EdgeInsets.all(15),
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            child: const Text(
                              'cancel',
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            onPressed: () async {


                              Navigator.of(context, rootNavigator: true).pop();


                              // int node_number=snapshot.data!.docs[index]
                              //     .get(AppConstants.Node_Number);


                            }),

                      ],),
                    ],
                  ),
                ),
              ),
            );
          });
    }




    return Scaffold(

         key: _scaffoldKey,


        body: LayoutBuilder(builder: (context, constraints) {

      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);


        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery
                .of(context)
                .size.width,
            color: Colors.white,

            padding: const EdgeInsets.all(20),

            child:

            // Container(
            //     width: MediaQuery
            //         .of(context)
            //         .size.width,
            //
            //
            //     child:



            ListView(

              children: [


                // StreamBuilder(
                //     stream: BlockRepositoryImpl().getBlocks(),
                //
                //     builder: (BuildContext context,
                //         AsyncSnapshot snapshot) {
                //       return Container();
                //     }),



                Container(

                  color: Colors.white,

                  width: SizeConfig.widthMultiplier * 90,

                  child: TextField(
                    controller: noceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Input number of accounts you want to create',

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
                  height: 5,
                ),
                Container(
                    height:kIsWeb?
                    SizeConfig.heightMultiplier*6: SizeConfig.heightMultiplier*8,
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
                          'Add Accounts',
                          textScaleFactor: 1,
                          style: TextStyle(  color: Colors.white),
                        ),
                        onPressed: () async {
                          // setState(() {
                          //
                          // });

                         AppConstants(context).startLoading();

                          int nodeLength =
                          int.parse(noceController.value.text);
                          print("Nodelenggt"+nodeLength.toString());

                          AccountRepositoryImpl().createWallet(nodeLength);
                         AppConstants(context).stopLoading();
                         Alerts(context, "Requested Accounts created.");

                         setState(() {
                           accountsPOJO;
                          });


                        })),
                SizedBox(
                  height: 5,
                ),

                Container(

                    height: MediaQuery.of(context).size.height-0.2,
                    color: Colors.white,

                    //height: SizeConfig.heightMultiplier * 60,
                    width: SizeConfig.widthMultiplier * 90,
                    child:
                    FutureBuilder(
                      future:restApiClient.getAllAccounts().then((value) {
                        print("va" +value.toString());
                        searchPublicKeys = [];
                        accountsPOJO=value;


                        for(int i=0;i<value.accounts.length;i++) {
                          if(value.accounts[i].account_owner.isEmpty) {

                           // searchPublicKeys = [];
                            searchPublicKeys.add(value.accounts[i]);
                          }

                        }


                      }),
                      builder: (context, snapshot) {
                        // AsyncSnapshot<DocumentSnapshot> snapshot=snapshot.data.;
                        return

                          accountsPOJO?.accounts!=null?ListView.builder(
                          itemCount: accountsPOJO!.accounts.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {

                            int accountIndex=index+1;
                            return GestureDetector(
                                onTap: () {



                                  //});

                                },
                                child: Card(
                                    elevation: 12,
                                    color: Colors.white,


                                    child:


                                    accountsPOJO!.accounts[index].account_owner.isEmpty ?
                                    Column(
                                      children: [

                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.all(5.0),
                                          child: const Text(
                                            "Account Number",

                                            textScaleFactor: 1.1,
                                            style: TextStyle(
                                                color: Colors.black45),

                                            //  textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.all(5.0),
                                          child:  Text(
                                            accountIndex.toString(),

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
                                            accountsPOJO!.accounts[index].public_key,

                                            textScaleFactor: 1.1,
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

                                        SizedBox(height: 10,),

                                        Container(
                                          alignment: Alignment.topLeft,
                                          padding: EdgeInsets.all(5.0),
                                          child: const Text(
                                            "Amount",

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
                                            accountsPOJO!.accounts[index].coins.toString() + " PDCoins",

                                            textScaleFactor: 1.1,
                                            style: const TextStyle(
                                                color: Colors.black),

                                            //  textAlign: TextAlign.center,
                                          ),
                                        ),

                                        SizedBox(height: 10,),

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
                                                    'Make Transaction',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  ),
                                                  onPressed: () async {

                                                    // setState(() {

                                                    showTransactionDialogs(
                                                         index,

                                                        accountsPOJO!.accounts[index].public_key,
                                                        accountsPOJO!.accounts[index].private_key);
                                                  }
                                              )),




                                          OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                  elevation: 6,
                                                  // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                                  padding: const EdgeInsets.all(15),
                                                  backgroundColor: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(30))),
                                              child: const Text(
                                                'Show Private Key',
                                                style: TextStyle(fontSize: 15, color: Colors.white),
                                              ),
                                              onPressed: () async {

                                                showGeneralDialog(barrierColor: Colors.black.withOpacity(0.5),
                                                  transitionBuilder: (context, a1, a2, widget) {
                                                    return Transform.scale(
                                                      scale: a1.value,
                                                      child: Opacity(
                                                        opacity: a1.value,
                                                        child: AlertDialog(
                                                          shape: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(16.0)),
                                                          title: Text("Keys"),
                                                          content:
                                                          Container(
                                                          height: MediaQuery.of(context).size.height*0.50,
                                                    width: MediaQuery.of(context).size.width*0.50,
                                                          child:

                                                          Column(children: [














                                                            Container(
                                                              alignment: Alignment.topLeft,
                                                              padding: EdgeInsets.all(5.0),
                                                              child: const Text(
                                                                "Public Kay",

                                                                textScaleFactor: 1.1,
                                                                style: TextStyle(
                                                                    color: Colors.black45),

                                                                //  textAlign: TextAlign.center,
                                                              ),
                                                            ),
                                                            Container(
                                                              alignment: Alignment.topLeft,
                                                              padding: EdgeInsets.all(5.0),
                                                              child:  Text(
                                                                accountsPOJO!.accounts[index].public_key,

                                                                textScaleFactor: 1.1,
                                                                style: const TextStyle(
                                                                    color: Colors.black),

                                                                //  textAlign: TextAlign.center,
                                                              ),
                                                            ),
                                                            SizedBox(height: 10,),


                                                            Container(
                                                              alignment: Alignment.topLeft,
                                                              padding: EdgeInsets.all(5.0),
                                                              child: const Text(
                                                                "Private Kay",

                                                                textScaleFactor: 1.1,
                                                                style: TextStyle(
                                                                    color: Colors.black45),

                                                                //  textAlign: TextAlign.center,
                                                              ),
                                                            ),
                                                            SizedBox(height: 10,),

                                                            Container(
                                                              alignment: Alignment.topLeft,
                                                              padding: EdgeInsets.all(5.0),
                                                              child:  Text(
                                                                accountsPOJO!.accounts[index].private_key,

                                                                textScaleFactor: 1.1,
                                                                style: const TextStyle(
                                                                    color: Colors.black),

                                                                //  textAlign: TextAlign.center,
                                                              ),
                                                            ),


                                                            // Visibility(visible:isVisible,
                                                            //
                                                            //
                                                            //              child:

                                                            Container(
                                                                padding: EdgeInsets.all(8),
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
                                                                      'Copy Private Key',
                                                                      style: TextStyle(
                                                                          fontSize: 15,
                                                                          color: Colors.white),
                                                                    ),
                                                                    onPressed: () async {

                                                                      Navigator.of(context, rootNavigator: true).pop();

                                                                      isVisible=false;
                                                                      switchValue=isVisible;

                                                                      setState(() {



                                                                        print("setst"   +switchValue.toString());

                                                                      });
                                                                      Clipboard.setData( ClipboardData(text: accountsPOJO!.accounts[index].private_key)).then((result){
                                                                        // show toast or snackbar after successfully save


                                                                      });
                                                                    }
                                                                )),


                                                          ])),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  transitionDuration: Duration(milliseconds: 200),
                                                  barrierDismissible: true,
                                                  barrierLabel: '',
                                                  context: context, pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation)
                                                  {

                                                    return Container();



                                                  },
                                                  //   pageBuilder: (context, animation1, animation2) {
                                                  //
                                                  // //return context;
                                                  //
                                                  //   }
                                                  //
                                                );




                                                  //Navigator.of(context, rootNavigator: true).pop();
                                                }

                                         )

                                            //  }),




                                        ],)


                                      ],


                                    ):Container()

                                ));
                          },
                        ):Text("Wait");
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
