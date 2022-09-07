import 'package:blockchain_world/transactions/Model/ReplaceChainPOJO.dart';
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
import 'package:responsive_builder/responsive_builder.dart';

import 'package:responsive_framework/responsive_framework.dart';

/*
Class to mine a block and get chain for block chain
 */
const String routeName = "/GetAllBlocks";

// ignore: must_be_immutable
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
    GetChainPOJO? getAllBlocks1;












    late GetChainPOJO getChainPOJO;
    late  newChains replaceChainPOJO;
    final Orientation orientation = MediaQuery.of(context).orientation;
    final bool isLandscape = orientation == Orientation.landscape;
    Orientation currentOrientation = MediaQuery.of(context).orientation;
    // ResponsiveSizingConfig.instance.setCustomBreakpoints(
    //   const ScreenBreakpoints(desktop: 800, tablet: 550, watch: 200),
    // );
    return Scaffold(


          body:   LayoutBuilder(builder: (context, constraints) {
            Orientation currentOrientation = MediaQuery.of(context).orientation;


            return OrientationBuilder(
                builder: (context, orientation) {

                  SizeConfig().init(constraints, orientation);



                  return  SingleChildScrollView(

                    child:  Container(


                      height:MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      // width: SizeConfig.widthMultiplier*90,
                      padding: const EdgeInsets.all(25),

                      child:



                      ListView(
                          children: [




                        const SizedBox(height: 5,),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(5.0),
                              margin: EdgeInsets.all(10),
                              child: const Text("Node 5000 Blockchain ",

                                textScaleFactor: 1.2,
                                style: TextStyle(color: Colors.blue),

                                //  textAlign: TextAlign.center,
                              ),
                            ),





                            Container(



                                height:MediaQuery.of(context).size.height*0.55,
                                width: MediaQuery.of(context).size.width,

                                child:

                                FutureBuilder(
                                    future:BlockRepositoryImpl().getNodeOneBlockChain().then((value) {
                                      getAllBlocks1=value;
                                      print("inside value");
                                      print(getAllBlocks1?.chain);


                                    }),

                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {




                                      return
                                        Container(

                                          // width: isLandscape?  MediaQuery.of(context).size.width
                                          //
                                          //     :SizeConfig.widthMultiplier*100,

                                          // SizeConfig.widthMultiplier*90,

                                            child:

                                            ListView.builder(

                                                scrollDirection: Axis.horizontal,
                                                shrinkWrap: false,
                                                itemCount: getAllBlocks1?.chain.length,
                                                itemBuilder: (context, index) {
                                                  //  print("INSIDE itemBuilder in ");

                                                  return GestureDetector(
                                                    onTap: () async{


                                                      ArgumentsPOJO argumentPOJOI=
                                                      ArgumentsPOJO(index: getAllBlocks!.chain[index].block.index,

                                                          message: "New transaction added",
                                                          previous_hash:  getAllBlocks!.chain[index].block.previous_hash,
                                                          proof:  int.parse( getAllBlocks!.chain[index].block.nonce.toString()),
                                                          timestamp:  getAllBlocks!.chain[index].block.timestamp,
                                                          current_block_hask: getAllBlocks!.chain[index].hash.toString() ,
                                                          transactions:getAllBlocks!.chain[index].block.transactions);

                                                      Navigator.pushNamed(context,
                                                          BlockDetail.routeName,
                                                          arguments: argumentPOJOI);

                                                      /*
                                     TODO
                                     create crypto crypto wallet
                                     research on how transaction works

                                   */




                                                    },

                                                    child:


                                                    Wrap(
                                                      //alignment: Alignment.centerLeft,

                                                        children: <Widget>[




                                                          Container(


                                                            width: SizeConfig.widthMultiplier*70,
                                                            // height: MediaQuery.of(context).size.height*0.40,


                                                            child:



                                                            Card(
                                                              elevation: 10,

                                                              child: Column(children: [



                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: EdgeInsets.all(5.0),
                                                                  child: const Text("Block Number",

                                                                    textScaleFactor: 1.1,
                                                                    style: TextStyle(color: Colors.black54),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),

                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: const EdgeInsets.all(5.0),
                                                                  child: Text(getAllBlocks1!=null?
                                                                    getAllBlocks1!.chain[index].block.index.toString():"Wait" ,

                                                                    textScaleFactor: 1.1,
                                                                    style: const TextStyle(color: Colors.black),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),

                                                                const Divider(
                                                                  color: Colors.black12,
                                                                  thickness: 1.0,
                                                                ),


                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: EdgeInsets.all(5.0),
                                                                  child: const Text("Nonce",

                                                                    textScaleFactor: 1.1,
                                                                    style: TextStyle(color: Colors.black54),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),

                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: EdgeInsets.all(5.0),
                                                                  child: Text(getAllBlocks1!=null?
                                                                    getAllBlocks1!.chain[index].block.nonce.toString():"Wait",


                                                                    textScaleFactor: 1.1,
                                                                    style: const TextStyle(color: Colors.black),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),






                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: EdgeInsets.all(5.0),
                                                                  child: const Text("TimeStamp",

                                                                    textScaleFactor: 1.1,
                                                                    style: TextStyle(color: Colors.black54),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),




                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: EdgeInsets.all(5.0),
                                                                  child: Text(getAllBlocks1!=null?
                                                                    getAllBlocks1!.chain[index].block.timestamp.toString():"wait" ,

                                                                    textScaleFactor: 1.1,
                                                                    style: const TextStyle(color: Colors.black),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),

                                                                Divider(
                                                                  color: Colors.black12,
                                                                  thickness: 1.0,
                                                                ),
                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: const EdgeInsets.all(5.0),
                                                                  child: const Text("Previous Hash",

                                                                    textScaleFactor: 1.1,
                                                                    style: TextStyle(color: Colors.black54),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: EdgeInsets.all(5.0),
                                                                  child: Text(getAllBlocks1!=null?
                                                                    getAllBlocks1!.chain[index].block.previous_hash.toString():"wait",

                                                                    textScaleFactor: 1.1,
                                                                    style: const TextStyle(color: Colors.black),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: const EdgeInsets.all(5.0),
                                                                  child: const Text("Hash",

                                                                    textScaleFactor: 1.1,
                                                                    style: TextStyle(color: Colors.black54),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: const EdgeInsets.all(5.0),
                                                                  child: Text(getAllBlocks1!=null?
                                                                    getAllBlocks1!.chain[index].hash.toString():"Wait",

                                                                    textScaleFactor: 1.1,
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

                                                            ),

                                                            //
                                                            //   ])
                                                            //
                                                          ),



                                                          Container(


                                                            margin: const EdgeInsets.only(

                                                                top: 270,
                                                                bottom: 270),
                                                            alignment: Alignment.bottomCenter,


                                                            child:
                                                            Image.asset('assets/images/chain.png',
                                                              height: 50,
                                                              width:30,
                                                              //color: Colors.red,
                                                              fit: BoxFit.fill,

                                                            ),

                                                          ),
                                                          //
                                                          // Container(
                                                          //
                                                          //
                                                          // margin: EdgeInsets.only(right: 2,left: 5),
                                                          //
                                                          // child:
                                                          //
                                                          // Image.asset('assets/images/chain.png',
                                                          //   height: 20,
                                                          //   width:20,
                                                          //   color: Colors.red,
                                                          //   fit: BoxFit.cover,
                                                          //
                                                          // ),
                                                          //   width: 30,
                                                          //
                                                          //
                                                          //
                                                          // ),
                                                          // Container(height: 10,width: 60,color: Colors.blueGrey,
                                                          //
                                                          //   padding: EdgeInsets.only(right: 155),
                                                          // ),



                                                          //             Positioned(
                                                          //
                                                          //               //right: 130,
                                                          //              // left: 1,
                                                          //              right:0,
                                                          //               height:30,
                                                          //                 //width:90,
                                                          //                 //alignment:, Alignment.centerLeft,
                                                          //
                                                          //
                                                          //
                                                          //                // padding: EdgeInsets.only(left: 15,right: 10),
                                                          //              // margin: EdgeInsets.all( 220),
                                                          //               //height: 100,
                                                          //               // width: 300,
                                                          //               //
                                                          //               child:     Ink(
                                                          // //alignment: Alignment.centerLeft,
                                                          //
                                                          //
                                                          // child:
                                                          // Image.asset('assets/images/chain.png',
                                                          //  height: 40,
                                                          // width:55,
                                                          // color: Colors.red,
                                                          // fit: BoxFit.cover,
                                                          //
                                                          // ),
                                                          //
                                                          // // width: 200,
                                                          // // height: 200,
                                                          //                 padding: EdgeInsets.only(left: 15,right: 10),
                                                          //
                                                          //
                                                          //
                                                          // ))


                                                          //  Wrap(
                                                          // // alignment: Alignment.topCenter,
                                                          //
                                                          //    children: [
                                                          //
                                                          //
                                                          //
                                                          //
                                                          //      Ink(
                                                          //        //alignment: Alignment.centerLeft,
                                                          //
                                                          //
                                                          //        child:
                                                          //      Image.asset('assets/images/chain.png',
                                                          //        // height: 40,
                                                          //        width:35,
                                                          //        color: Colors.red,
                                                          //        fit: BoxFit.fill,
                                                          //
                                                          //      ),
                                                          //      padding: EdgeInsets.all(10),
                                                          //        width: 200,
                                                          //        height: 200,
                                                          //
                                                          //
                                                          //      )
                                                          //
                                                          //
                                                          //      ,
                                                          //
                                                          //
                                                          //
                                                          //      Container(
                                                          //        alignment: Alignment.centerLeft,
                                                          //
                                                          //
                                                          //
                                                          //        child:
                                                          //        Image.asset('assets/images/chain.png',
                                                          //          // height: 40,
                                                          //          width:15,
                                                          //          color: Colors.brown,
                                                          //          fit: BoxFit.fill,
                                                          //
                                                          //        ),
                                                          //     // margin: EdgeInsets.only(right: 100),
                                                          //
                                                          //      ),
                                                          //    ],
                                                          //
                                                          //      //width: 50,
                                                          //
                                                          //      // margin: EdgeInsets.all(20),
                                                          //      //padding: EdgeInsets.all(10),
                                                          //
                                                          //      //alignment: Alignment.centerLeft,
                                                          //
                                                          //
                                                          //    // IconButton(
                                                          //    // iconSize: 20,
                                                          //    // icon: const Icon(
                                                          //    //
                                                          //    //   Icons.arrow_right_alt,
                                                          //    //   color: Colors.white,
                                                          //    // ), onPressed: () {  },),
                                                          //
                                                          //  ),)


                                                        ]),

                                                  );

                                                }));

                                    })),

                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(5.0),
                              margin: EdgeInsets.all(10),
                              child: const Text("Node 5001 Blockchain ",

                                textScaleFactor: 1.2,
                                style: TextStyle(color: Colors.blue),

                                //  textAlign: TextAlign.center,
                              ),
                            ),

                            Container(



                                height:MediaQuery.of(context).size.height*0.55,
                                width: MediaQuery.of(context).size.width,

                                child:

                                FutureBuilder(
                                    future:BlockRepositoryImpl().getNodeTwoBlockChain().then((value) {
                                      getAllBlocks=value;
                                      print("inside value");
                                      print(getAllBlocks?.chain);


                                    }),

                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {




                                      return
                                        Container(

                                          // width: isLandscape?  MediaQuery.of(context).size.width
                                          //
                                          //     :SizeConfig.widthMultiplier*100,

                                          // SizeConfig.widthMultiplier*90,

                                            child:

                                            getAllBlocks!=null? ListView.builder(

                                                scrollDirection: Axis.horizontal,
                                                shrinkWrap: false,
                                                itemCount: getAllBlocks?.chain.length,
                                                itemBuilder: (context, index) {
                                                  //  print("INSIDE itemBuilder in ");

                                                  return GestureDetector(
                                                    onTap: () async{


                                                      ArgumentsPOJO argumentPOJOI=
                                                      ArgumentsPOJO(index: getAllBlocks!.chain[index].block.index,

                                                          message: "New transaction added",
                                                          previous_hash:  getAllBlocks!.chain[index].block.previous_hash,
                                                          proof:  int.parse( getAllBlocks!.chain[index].block.nonce.toString()),
                                                          timestamp:  getAllBlocks!.chain[index].block.timestamp,
                                                          current_block_hask: getAllBlocks!.chain[index].hash.toString() ,
                                                          transactions:getAllBlocks!.chain[index].block.transactions);

                                                      Navigator.pushNamed(context,
                                                          BlockDetail.routeName,
                                                          arguments: argumentPOJOI);

                                                      /*
                                     TODO
                                     create crypto crypto wallet
                                     research on how transaction works

                                   */




                                                    },

                                                    child:


                                                    Wrap(
                                                      //alignment: Alignment.centerLeft,

                                                        children: <Widget>[




                                                          Container(


                                                            width: SizeConfig.widthMultiplier*70,
                                                            // height: MediaQuery.of(context).size.height*0.40,


                                                            child:



                                                            Card(
                                                              elevation: 10,

                                                              child: Column(children: [



                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: EdgeInsets.all(5.0),
                                                                  child: const Text("Block Number",

                                                                    textScaleFactor: 1.1,
                                                                    style: TextStyle(color: Colors.black54),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),

                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: const EdgeInsets.all(5.0),
                                                                  child: Text(
                                                                    getAllBlocks!.chain[index].block.index.toString() ,

                                                                    textScaleFactor: 1.1,
                                                                    style: const TextStyle(color: Colors.black),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),

                                                                const Divider(
                                                                  color: Colors.black12,
                                                                  thickness: 1.0,
                                                                ),


                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: const EdgeInsets.all(5.0),
                                                                  child: const Text("Nonce",

                                                                    textScaleFactor: 1.1,
                                                                    style: TextStyle(color: Colors.black54),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),

                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: EdgeInsets.all(5.0),
                                                                  child: Text(
                                                                    getAllBlocks!.chain[index].block.nonce.toString(),


                                                                    textScaleFactor: 1.1,
                                                                    style: const TextStyle(color: Colors.black),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),






                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: EdgeInsets.all(5.0),
                                                                  child: const Text("TimeStamp",

                                                                    textScaleFactor: 1.1,
                                                                    style: TextStyle(color: Colors.black54),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),




                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: EdgeInsets.all(5.0),
                                                                  child: Text(
                                                                    getAllBlocks!.chain[index].block.timestamp.toString() ,

                                                                    textScaleFactor: 1.1,
                                                                    style: const TextStyle(color: Colors.black),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),

                                                                Divider(
                                                                  color: Colors.black12,
                                                                  thickness: 1.0,
                                                                ),
                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: const EdgeInsets.all(5.0),
                                                                  child: const Text("Previous Hash",

                                                                    textScaleFactor: 1.1,
                                                                    style: TextStyle(color: Colors.black54),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: EdgeInsets.all(5.0),
                                                                  child: Text(
                                                                    getAllBlocks!.chain[index].block.previous_hash.toString(),

                                                                    textScaleFactor: 1.1,
                                                                    style: const TextStyle(color: Colors.black),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: const EdgeInsets.all(5.0),
                                                                  child: const Text("Hash",

                                                                    textScaleFactor: 1.1,
                                                                    style: TextStyle(color: Colors.black54),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: const EdgeInsets.all(5.0),
                                                                  child: Text(
                                                                    getAllBlocks!.chain[index].hash.toString(),

                                                                    textScaleFactor: 1.1,
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

                                                            ),

                                                            //
                                                            //   ])
                                                            //
                                                          ),



                                                          Container(


                                                            margin: EdgeInsets.only(

                                                                top: 270,
                                                                bottom: 270),
                                                            alignment: Alignment.bottomCenter,


                                                            child:
                                                            Image.asset('assets/images/chain.png',
                                                              height: 50,
                                                              width:30,
                                                              //color: Colors.red,
                                                              fit: BoxFit.fill,

                                                            ),

                                                          ),
                                                          //
                                                          // Container(
                                                          //
                                                          //
                                                          // margin: EdgeInsets.only(right: 2,left: 5),
                                                          //
                                                          // child:
                                                          //
                                                          // Image.asset('assets/images/chain.png',
                                                          //   height: 20,
                                                          //   width:20,
                                                          //   color: Colors.red,
                                                          //   fit: BoxFit.cover,
                                                          //
                                                          // ),
                                                          //   width: 30,
                                                          //
                                                          //
                                                          //
                                                          // ),
                                                          // Container(height: 10,width: 60,color: Colors.blueGrey,
                                                          //
                                                          //   padding: EdgeInsets.only(right: 155),
                                                          // ),



                                                          //             Positioned(
                                                          //
                                                          //               //right: 130,
                                                          //              // left: 1,
                                                          //              right:0,
                                                          //               height:30,
                                                          //                 //width:90,
                                                          //                 //alignment:, Alignment.centerLeft,
                                                          //
                                                          //
                                                          //
                                                          //                // padding: EdgeInsets.only(left: 15,right: 10),
                                                          //              // margin: EdgeInsets.all( 220),
                                                          //               //height: 100,
                                                          //               // width: 300,
                                                          //               //
                                                          //               child:     Ink(
                                                          // //alignment: Alignment.centerLeft,
                                                          //
                                                          //
                                                          // child:
                                                          // Image.asset('assets/images/chain.png',
                                                          //  height: 40,
                                                          // width:55,
                                                          // color: Colors.red,
                                                          // fit: BoxFit.cover,
                                                          //
                                                          // ),
                                                          //
                                                          // // width: 200,
                                                          // // height: 200,
                                                          //                 padding: EdgeInsets.only(left: 15,right: 10),
                                                          //
                                                          //
                                                          //
                                                          // ))


                                                          //  Wrap(
                                                          // // alignment: Alignment.topCenter,
                                                          //
                                                          //    children: [
                                                          //
                                                          //
                                                          //
                                                          //
                                                          //      Ink(
                                                          //        //alignment: Alignment.centerLeft,
                                                          //
                                                          //
                                                          //        child:
                                                          //      Image.asset('assets/images/chain.png',
                                                          //        // height: 40,
                                                          //        width:35,
                                                          //        color: Colors.red,
                                                          //        fit: BoxFit.fill,
                                                          //
                                                          //      ),
                                                          //      padding: EdgeInsets.all(10),
                                                          //        width: 200,
                                                          //        height: 200,
                                                          //
                                                          //
                                                          //      )
                                                          //
                                                          //
                                                          //      ,
                                                          //
                                                          //
                                                          //
                                                          //      Container(
                                                          //        alignment: Alignment.centerLeft,
                                                          //
                                                          //
                                                          //
                                                          //        child:
                                                          //        Image.asset('assets/images/chain.png',
                                                          //          // height: 40,
                                                          //          width:15,
                                                          //          color: Colors.brown,
                                                          //          fit: BoxFit.fill,
                                                          //
                                                          //        ),
                                                          //     // margin: EdgeInsets.only(right: 100),
                                                          //
                                                          //      ),
                                                          //    ],
                                                          //
                                                          //      //width: 50,
                                                          //
                                                          //      // margin: EdgeInsets.all(20),
                                                          //      //padding: EdgeInsets.all(10),
                                                          //
                                                          //      //alignment: Alignment.centerLeft,
                                                          //
                                                          //
                                                          //    // IconButton(
                                                          //    // iconSize: 20,
                                                          //    // icon: const Icon(
                                                          //    //
                                                          //    //   Icons.arrow_right_alt,
                                                          //    //   color: Colors.white,
                                                          //    // ), onPressed: () {  },),
                                                          //
                                                          //  ),)


                                                        ]),

                                                  );

                                                }):Container());

                                    })),


                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(5.0),
                              margin: EdgeInsets.all(10),
                              child: const Text("Node 5002 Blockchain ",

                                textScaleFactor: 1.2,
                                style: TextStyle(color: Colors.blue),

                                //  textAlign: TextAlign.center,
                              ),
                            ),

                            Container(



                                height:MediaQuery.of(context).size.height*0.55,
                                width: MediaQuery.of(context).size.width,

                                child:

                                FutureBuilder(
                                    future:BlockRepositoryImpl().getNodeThreeBlockChain().then((value) {
                                      getAllBlocks=value;
                                      print("inside value");
                                      print(getAllBlocks?.chain);


                                    }),

                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {




                                      return
                                        Container(

                                          // width: isLandscape?  MediaQuery.of(context).size.width
                                          //
                                          //     :SizeConfig.widthMultiplier*100,

                                          // SizeConfig.widthMultiplier*90,

                                            child:

                                            getAllBlocks!=null? ListView.builder(

                                                scrollDirection: Axis.horizontal,
                                                shrinkWrap: false,
                                                itemCount: getAllBlocks?.chain.length,
                                                itemBuilder: (context, index) {
                                                  //  print("INSIDE itemBuilder in ");

                                                  return GestureDetector(
                                                    onTap: () async{


                                                      ArgumentsPOJO argumentPOJOI=
                                                      ArgumentsPOJO(index: getAllBlocks!.chain[index].block.index,

                                                          message: "New transaction added",
                                                          previous_hash:  getAllBlocks!.chain[index].block.previous_hash,
                                                          proof:  int.parse( getAllBlocks!.chain[index].block.nonce.toString()),
                                                          timestamp:  getAllBlocks!.chain[index].block.timestamp,
                                                          current_block_hask: getAllBlocks!.chain[index].hash.toString() ,
                                                          transactions:getAllBlocks!.chain[index].block.transactions);

                                                      Navigator.pushNamed(context,
                                                          BlockDetail.routeName,
                                                          arguments: argumentPOJOI);

                                                      /*
                                     TODO
                                     create crypto crypto wallet
                                     research on how transaction works

                                   */




                                                    },

                                                    child:


                                                    Wrap(
                                                      //alignment: Alignment.centerLeft,

                                                        children: <Widget>[




                                                          Container(


                                                            width: SizeConfig.widthMultiplier*70,
                                                            // height: MediaQuery.of(context).size.height*0.40,


                                                            child:



                                                            Card(
                                                              elevation: 10,

                                                              child: Column(children: [



                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: EdgeInsets.all(5.0),
                                                                  child: const Text("Block Number",

                                                                    textScaleFactor: 1.1,
                                                                    style: TextStyle(color: Colors.black54),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),

                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: const EdgeInsets.all(5.0),
                                                                  child: Text(
                                                                    getAllBlocks!.chain[index].block.index.toString() ,

                                                                    textScaleFactor: 1.1,
                                                                    style: const TextStyle(color: Colors.black),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),

                                                                const Divider(
                                                                  color: Colors.black12,
                                                                  thickness: 1.0,
                                                                ),


                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: const EdgeInsets.all(5.0),
                                                                  child: const Text("Nonce",

                                                                    textScaleFactor: 1.1,
                                                                    style: TextStyle(color: Colors.black54),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),

                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: EdgeInsets.all(5.0),
                                                                  child: Text(
                                                                    getAllBlocks!.chain[index].block.nonce.toString(),


                                                                    textScaleFactor: 1.1,
                                                                    style: const TextStyle(color: Colors.black),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),






                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: EdgeInsets.all(5.0),
                                                                  child: const Text("TimeStamp",

                                                                    textScaleFactor: 1.1,
                                                                    style: TextStyle(color: Colors.black54),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),




                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: EdgeInsets.all(5.0),
                                                                  child: Text(
                                                                    getAllBlocks!.chain[index].block.timestamp.toString() ,

                                                                    textScaleFactor: 1.1,
                                                                    style: const TextStyle(color: Colors.black),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),

                                                                Divider(
                                                                  color: Colors.black12,
                                                                  thickness: 1.0,
                                                                ),
                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: const EdgeInsets.all(5.0),
                                                                  child: const Text("Previous Hash",

                                                                    textScaleFactor: 1.1,
                                                                    style: TextStyle(color: Colors.black54),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: EdgeInsets.all(5.0),
                                                                  child: Text(
                                                                    getAllBlocks!.chain[index].block.previous_hash.toString(),

                                                                    textScaleFactor: 1.1,
                                                                    style: const TextStyle(color: Colors.black),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: const EdgeInsets.all(5.0),
                                                                  child: const Text("Hash",

                                                                    textScaleFactor: 1.1,
                                                                    style: TextStyle(color: Colors.black54),

                                                                    //  textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  alignment: Alignment.topLeft,
                                                                  padding: const EdgeInsets.all(5.0),
                                                                  child: Text(
                                                                    getAllBlocks!.chain[index].hash.toString(),

                                                                    textScaleFactor: 1.1,
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

                                                            ),

                                                            //
                                                            //   ])
                                                            //
                                                          ),



                                                          Container(


                                                            margin: EdgeInsets.only(

                                                                top: 270,
                                                                bottom: 270),
                                                            alignment: Alignment.bottomCenter,


                                                            child:
                                                            Image.asset('assets/images/chain.png',
                                                              height: 50,
                                                              width:30,
                                                              //color: Colors.red,
                                                              fit: BoxFit.fill,

                                                            ),

                                                          ),
                                                          //
                                                          // Container(
                                                          //
                                                          //
                                                          // margin: EdgeInsets.only(right: 2,left: 5),
                                                          //
                                                          // child:
                                                          //
                                                          // Image.asset('assets/images/chain.png',
                                                          //   height: 20,
                                                          //   width:20,
                                                          //   color: Colors.red,
                                                          //   fit: BoxFit.cover,
                                                          //
                                                          // ),
                                                          //   width: 30,
                                                          //
                                                          //
                                                          //
                                                          // ),
                                                          // Container(height: 10,width: 60,color: Colors.blueGrey,
                                                          //
                                                          //   padding: EdgeInsets.only(right: 155),
                                                          // ),



                                                          //             Positioned(
                                                          //
                                                          //               //right: 130,
                                                          //              // left: 1,
                                                          //              right:0,
                                                          //               height:30,
                                                          //                 //width:90,
                                                          //                 //alignment:, Alignment.centerLeft,
                                                          //
                                                          //
                                                          //
                                                          //                // padding: EdgeInsets.only(left: 15,right: 10),
                                                          //              // margin: EdgeInsets.all( 220),
                                                          //               //height: 100,
                                                          //               // width: 300,
                                                          //               //
                                                          //               child:     Ink(
                                                          // //alignment: Alignment.centerLeft,
                                                          //
                                                          //
                                                          // child:
                                                          // Image.asset('assets/images/chain.png',
                                                          //  height: 40,
                                                          // width:55,
                                                          // color: Colors.red,
                                                          // fit: BoxFit.cover,
                                                          //
                                                          // ),
                                                          //
                                                          // // width: 200,
                                                          // // height: 200,
                                                          //                 padding: EdgeInsets.only(left: 15,right: 10),
                                                          //
                                                          //
                                                          //
                                                          // ))


                                                          //  Wrap(
                                                          // // alignment: Alignment.topCenter,
                                                          //
                                                          //    children: [
                                                          //
                                                          //
                                                          //
                                                          //
                                                          //      Ink(
                                                          //        //alignment: Alignment.centerLeft,
                                                          //
                                                          //
                                                          //        child:
                                                          //      Image.asset('assets/images/chain.png',
                                                          //        // height: 40,
                                                          //        width:35,
                                                          //        color: Colors.red,
                                                          //        fit: BoxFit.fill,
                                                          //
                                                          //      ),
                                                          //      padding: EdgeInsets.all(10),
                                                          //        width: 200,
                                                          //        height: 200,
                                                          //
                                                          //
                                                          //      )
                                                          //
                                                          //
                                                          //      ,
                                                          //
                                                          //
                                                          //
                                                          //      Container(
                                                          //        alignment: Alignment.centerLeft,
                                                          //
                                                          //
                                                          //
                                                          //        child:
                                                          //        Image.asset('assets/images/chain.png',
                                                          //          // height: 40,
                                                          //          width:15,
                                                          //          color: Colors.brown,
                                                          //          fit: BoxFit.fill,
                                                          //
                                                          //        ),
                                                          //     // margin: EdgeInsets.only(right: 100),
                                                          //
                                                          //      ),
                                                          //    ],
                                                          //
                                                          //      //width: 50,
                                                          //
                                                          //      // margin: EdgeInsets.all(20),
                                                          //      //padding: EdgeInsets.all(10),
                                                          //
                                                          //      //alignment: Alignment.centerLeft,
                                                          //
                                                          //
                                                          //    // IconButton(
                                                          //    // iconSize: 20,
                                                          //    // icon: const Icon(
                                                          //    //
                                                          //    //   Icons.arrow_right_alt,
                                                          //    //   color: Colors.white,
                                                          //    // ), onPressed: () {  },),
                                                          //
                                                          //  ),)


                                                        ]),

                                                  );

                                                }):Container());

                                    })),
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
