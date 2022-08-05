import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../network/RestClient.dart';
import '../../../util/appconstants/AppConstants.dart';
import '../../../util/ui/sizeConfig.dart';
import '../../util/common/MultipleArguments.dart';
import '../bloc/block_repository/BlockRepository.dart';
import 'BlockDeatails.dart';
import '../model/GetChainPOJO.dart';


/*
Class to mine a block and get chain for block chain
 */
const String routeName = "GetAllBlocks";

class GetAllBlocks extends StatelessWidget {

  late ArgumentsPOJO argumentsPOJO;

  GetAllBlocks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetAllBlocksSate(
//        id: genresId,
//        genresName: genresName,
//        pageDirection: pageDirection,
          key: key
      ),
    );
  }
}

class GetAllBlocksSate extends StatefulWidget {
  const GetAllBlocksSate({Key? key})
      : super(key: key);



  @override
  _GetAllBlocksSate createState() =>
      _GetAllBlocksSate();
}




var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;
RestClient restApiClient = RestClient(dio);

class _GetAllBlocksSate extends State<GetAllBlocksSate> {
  @override
  Widget build(BuildContext context) {
    GetChainPOJO? getAllBlocks;












    late GetChainPOJO getChainPOJO;
    final Orientation orientation = MediaQuery.of(context).orientation;
    final bool isLandscape = orientation == Orientation.landscape;
    Orientation currentOrientation = MediaQuery.of(context).orientation;

    return Scaffold(
        primary: isLandscape,


          body:   LayoutBuilder(builder: (context, constraints) {
            Orientation currentOrientation = MediaQuery.of(context).orientation;


            return OrientationBuilder(
                builder: (context, orientation) {

                  SizeConfig().init(constraints, orientation);



                  return  SingleChildScrollView(

                    child:  Container(


                      height:SizeConfig.heightMultiplier*100,
                     width: isLandscape?  MediaQuery.of(context).size.width
                            :SizeConfig.widthMultiplier*90,               // width: SizeConfig.widthMultiplier*90,
                      padding: const EdgeInsets.all(25),

                      child:

                      //  Container(
                      //    height:800,
                      //     width: SizeConfig.widthMultiplier*80,
                      //     color: Colors.blue,
                      // child:



                      Column(children: [


                        Container(
                         // alignment: Alignment.topCenter,
                          padding: const EdgeInsets.all(5.0),
                          child: const Text("Block Chain",
                            textScaleFactor: 1.5,
                            style: TextStyle(color: Colors.black),

                            //  textAlign: TextAlign.center,
                          ),
                        ),

                        const SizedBox(height: 20,),


                        // Container(
                        //
                        //     height:  kIsWeb?SizeConfig.heightMultiplier*4:SizeConfig.heightMultiplier*18,
                        //     padding: EdgeInsets.all(8),
                        //     width: kIsWeb?SizeConfig.widthMultiplier*10:SizeConfig.widthMultiplier*60,
                        //
                        //
                        //     child:
                        //     ElevatedButton(
                        //       onPressed: () {
                        //         // Navigator.pushNamed(context,
                        //         //     AddTransaction.routeName
                        //         // );
                        //
                        //         setState(() {
                        //
                        //         });
                        //         Navigator.pushNamed(context,
                        //           AddTransaction.routeName,
                        //         );
                        //
                        //
                        //
                        //       },
                        //       child: Text('Add Transactions'),
                        //     )),
                        //
                        //




                        Container(


                            height:SizeConfig.heightMultiplier*80,
                            width: isLandscape?  MediaQuery.of(context).size.width

                                :SizeConfig.widthMultiplier*100,
                            child:

                            StreamBuilder(
                                stream:BlockRepositoryImpl().getBlocks(),

                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {




                                  return
                                    Container(

                                        // width: isLandscape?  MediaQuery.of(context).size.width
                                        //
                                        //     :SizeConfig.widthMultiplier*100,

                                        // SizeConfig.widthMultiplier*90,

                                        child:

                                        snapshot.data!=null?   ListView.builder(

                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: snapshot.data.size,
                                            itemBuilder: (context, index) {
                                              //  print("INSIDE itemBuilder in ");

                                              return GestureDetector(
                                                  onTap: () async{


                                                    ArgumentsPOJO argumentPOJOI=
                                                    ArgumentsPOJO(index:  snapshot.data.docs[index].get(AppConstants.Block_index),

                                                        message: "New transaction added",
                                                        previous_hash:snapshot.data.docs[index].get(AppConstants.Previous_hash).toString(),
                                                        proof:  int.parse(snapshot.data.docs[index].get(AppConstants.Proof).toString()),
                                                        timestamp:  snapshot.data?.docs[index].get(AppConstants.Block_CreatedOn),
                                                        current_block_hask:  snapshot.data.docs[index].get(AppConstants.Current_block_hash).toString() ,
                                                        transactions: snapshot.data?.docs[index].get(AppConstants.TransactionDetails));

                                                    Navigator.pushNamed(context,
                                                        BlockDetail.routeName,
                                                        arguments: argumentPOJOI);

                                                    /*
                                     TODO
                                     create crypto crypto wallet
                                     research on how transaction works

                                   */




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
                                                              width: SizeConfig.widthMultiplier*50,


                                                              child: Card(
                                                                elevation: 10,

                                                                child: Column(children: [

                                                                  Container(
                                                                    alignment: Alignment.topLeft,
                                                                    padding: EdgeInsets.all(5.0),
                                                                    child: const Text("Block Number",

                                                                      textScaleFactor: 1.3,
                                                                      style: TextStyle(color: Colors.black54),

                                                                      //  textAlign: TextAlign.center,
                                                                    ),
                                                                  ),

                                                                  Container(
                                                                    alignment: Alignment.topLeft,
                                                                    padding: EdgeInsets.all(5.0),
                                                                    child: Text(
                                                                      snapshot.data?.docs[index].get(AppConstants.Block_index).toString()?? ' ',

                                                                      textScaleFactor: 1.3,
                                                                      style: const TextStyle(color: Colors.black),

                                                                      //  textAlign: TextAlign.center,
                                                                    ),
                                                                  ),


                                                                  Container(
                                                                    alignment: Alignment.topLeft,
                                                                    padding: EdgeInsets.all(5.0),
                                                                    child: const Text("Nonce",

                                                                      textScaleFactor: 1.3,
                                                                      style: TextStyle(color: Colors.black54),

                                                                      //  textAlign: TextAlign.center,
                                                                    ),
                                                                  ),

                                                                  Container(
                                                                    alignment: Alignment.topLeft,
                                                                    padding: EdgeInsets.all(5.0),
                                                                    child: Text(
                                                                      snapshot.data!.docs[index].get(AppConstants.Proof).toString()?? ' ',

                                                                      textScaleFactor: 1.3,
                                                                      style: const TextStyle(color: Colors.black),

                                                                      //  textAlign: TextAlign.center,
                                                                    ),
                                                                  ),






                                                                  Container(
                                                                    alignment: Alignment.topLeft,
                                                                    padding: EdgeInsets.all(5.0),
                                                                    child: const Text("TimeStamp",

                                                                      textScaleFactor: 1.3,
                                                                      style: TextStyle(color: Colors.black54),

                                                                      //  textAlign: TextAlign.center,
                                                                    ),
                                                                  ),

                                                                  Container(
                                                                    alignment: Alignment.topLeft,
                                                                    padding: EdgeInsets.all(5.0),
                                                                    child: Text(
                                                                        snapshot.data?.docs[index].get(AppConstants.Block_CreatedOn)?? ' ',

                                                                      textScaleFactor: 1.3,
                                                                      style: const TextStyle(color: Colors.black),

                                                                      //  textAlign: TextAlign.center,
                                                                    ),
                                                                  ),

                                                                  Container(
                                                                    alignment: Alignment.topLeft,
                                                                    padding: const EdgeInsets.all(5.0),
                                                                    child: const Text("Previous Hash",

                                                                      textScaleFactor: 1.3,
                                                                      style: TextStyle(color: Colors.black54),

                                                                      //  textAlign: TextAlign.center,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    alignment: Alignment.topLeft,
                                                                    padding: EdgeInsets.all(5.0),
                                                                    child: Text(
                                                                      snapshot.data?.docs[index].get(AppConstants.Previous_hash)?? ' ',

                                                                      textScaleFactor: 1.3,
                                                                      style: const TextStyle(color: Colors.black),

                                                                      //  textAlign: TextAlign.center,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    alignment: Alignment.topLeft,
                                                                    padding: const EdgeInsets.all(5.0),
                                                                    child: const Text("Hash",

                                                                      textScaleFactor: 1.3,
                                                                      style: TextStyle(color: Colors.black54),

                                                                      //  textAlign: TextAlign.center,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    alignment: Alignment.topLeft,
                                                                    padding: const EdgeInsets.all(5.0),
                                                                    child: Text(
                                                                      snapshot.data?.docs[index].get(AppConstants.Current_block_hash)?? ' ',

                                                                      textScaleFactor: 1.3,
                                                                      style: const TextStyle(color: Colors.black),

                                                                      //  textAlign: TextAlign.center,
                                                                    ),
                                                                  ),

                //
                //
                // getAllBlocks!.chain[index].block.transactions.isNotEmpty? ListView.builder(
                //
                //   scrollDirection:
                //   Axis.vertical,
                //   shrinkWrap: true,
                //   itemCount: getAllBlocks?.chain[index].block.transactions.length,
                //   itemBuilder: (context, index) {
                //
                //     return Text( getAllBlocks!.chain[index].block.transactions[index].sender);
                //
                //
                //   }):Text("")
                //



                                                                ]),

                                                              )
                                                          ) ]),
                                                  );

                                            }):Container());

                                }))




                      ]),

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
