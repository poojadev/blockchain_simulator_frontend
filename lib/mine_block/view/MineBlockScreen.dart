import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../network/RestClient.dart';
import '../../../util/appconstants/AppConstants.dart';
import '../../../util/ui/sizeConfig.dart';
import '../../util/common/MultipleArguments.dart';
import '../../blocks/model/GetChainPOJO.dart';
import '../model/MineBlockPOJO.dart';


/*
Class to mine a block and get chain for block chain
 */

// ignore: must_be_immutable
class MineBlock extends StatelessWidget {
  static const String routeName = "/MineBlock";

  late ArgumentsPOJO argumentsPOJO;

  MineBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MineBlockSate(
//        id: genresId,
//        genresName: genresName,
//        pageDirection: pageDirection,
        key: key
      ),
    );
  }
}

class MineBlockSate extends StatefulWidget {
  const MineBlockSate({Key? key})
      : super(key: key);



  @override
  _MineBlockState createState() =>
      _MineBlockState();
}




var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;
RestClient restApiClient = RestClient(dio);

class _MineBlockState extends State<MineBlockSate> {
  @override
  Widget build(BuildContext context) {
     MineBlockPOJO? mineBlockPOJO;


     restApiClient
            .mineBlock().then((value) {

              print("H" +value.timestamp);
     });










    late GetChainPOJO getChainPOJO;
    return
       Scaffold(



           body:   LayoutBuilder(builder: (context, constraints) {
       return OrientationBuilder(
           builder: (context, orientation) {
         SizeConfig().init(constraints, orientation);



         return  SingleChildScrollView(

             child:  Container(
               color: Colors.red,
               height:SizeConfig.heightMultiplier*100,
               width: SizeConfig.widthMultiplier*100,               // width: SizeConfig.widthMultiplier*90,
               padding: const EdgeInsets.all(25),

               child:

               //  Container(
         //    height:800,
         //     width: SizeConfig.widthMultiplier*80,
         //     color: Colors.blue,
         // child:



      Column(children: [

        SizedBox(height: 20,),










        Container(
          color: Colors.red,

          height:SizeConfig.heightMultiplier*60,
          width: SizeConfig.widthMultiplier*90,
          child:

        FutureBuilder(
            future: restApiClient
                .mineBlock()
                .then((responses) async {






              mineBlockPOJO=responses;

              final CollectionReference blockDetails =
              FirebaseFirestore.instance.collection('blockdetails');

              await blockDetails.add({"index":  responses.index, "hash":responses.hash,
              "previous_hash":responses.previous_hash,
                "proof" :responses.proof,"timestamp" :responses.timestamp,
                "transaction":responses.transactions
              });

              print(responses.toString());
                 // getUserAllLocations=responses.toString();

            }).whenComplete(() {
              debugPrint("whenComplete:");
            }).catchError((onError) {
              debugPrint(
                  "errors ae there:${onError.toString()}");
            }),

            builder: (BuildContext context,
                AsyncSnapshot snapshot) {


              print("builder");


              print("Column");
                return
                Column( children: [
                  Container(
                      width: kIsWeb? SizeConfig.widthMultiplier*40:
                      SizeConfig.widthMultiplier*90,

                child:  Card(
                    elevation: 8,
                    child: Column(children: [

                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(5.0),
                        child: Text("Index",

                          textScaleFactor: 1.3,
                          style: const TextStyle(color: Colors.black54),

                          //  textAlign: TextAlign.center,
                        ),
                      ),

                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          mineBlockPOJO?.index.toString()?? 'No index ',

                          textScaleFactor: 1.3,
                          style: const TextStyle(color: Colors.black),

                          //  textAlign: TextAlign.center,
                        ),
                      ),






                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(5.0),
                        child: Text("TimeStamp",

                          textScaleFactor: 1.3,
                          style: const TextStyle(color: Colors.black54),

                          //  textAlign: TextAlign.center,
                        ),
                      ),

                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          mineBlockPOJO?.timestamp.toString()?? 'No timestamp ',

                          textScaleFactor: 1.3,
                          style: const TextStyle(color: Colors.black),

                          //  textAlign: TextAlign.center,
                        ),
                      ),

                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(5.0),
                        child: Text("Previous Hash",

                          textScaleFactor: 1.3,
                          style: const TextStyle(color: Colors.black54),

                          //  textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          mineBlockPOJO?.previous_hash.toString()?? 'No previous hash values',

                          textScaleFactor: 1.3,
                          style: const TextStyle(color: Colors.black),

                          //  textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(5.0),
                        child: Text("Hash",

                          textScaleFactor: 1.3,
                          style: const TextStyle(color: Colors.black54),

                          //  textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          mineBlockPOJO?.hash.toString()?? 'No values',

                          textScaleFactor: 1.3,
                          style: const TextStyle(color: Colors.black),

                          //  textAlign: TextAlign.center,
                        ),
                      ),







                    ]),

                  )



    )]);

            })


        )




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
