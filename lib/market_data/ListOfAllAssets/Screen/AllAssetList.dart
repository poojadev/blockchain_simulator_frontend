import 'package:blockchain_world/network/MarketRestClient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../util/common/MultipleArguments.dart';
import '../../../util/appconstants/AppConstants.dart';
import '../../../util/ui/sizeConfig.dart';
import '../../controller/repository/MarketDataRepository.dart';
import '../Model/AllAssetListPOJO.dart';
import '../Model/CurrencyExchangeRatePOJO.dart';
import '../Model/GetSpecificExchangeRatePOJO.dart';

/*
Class to mine a block and get chain for block chain
 */
const String routeName = "AllAssetList";

class AllAssetList extends StatelessWidget {
  late ArgumentsPOJO argumentsPOJO;

  AllAssetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AllAssetListSate(
//        id: genresId,
//        genresName: genresName,
//        pageDirection: pageDirection,
          key: key),
    );
  }
}

class AllAssetListSate extends StatefulWidget {
  const AllAssetListSate({Key? key}) : super(key: key);

  @override
  _GetAllBlocksSate createState() => _GetAllBlocksSate();
}

var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;
MarketRestClient marketRestClient = MarketRestClient(dio);

class _GetAllBlocksSate extends State<AllAssetListSate> {
  CurrencyExchangeRatePOJO? currencyExchangeRatePOJO;

  GetSpecificExchangeRatePOJO? getSpecificExchangeRatePOJO;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // AllAssetListPOJO? allAssetListPOJO;
    List<AllAssetListPOJO> allAssetListPOJO = [];

    final Orientation orientation = MediaQuery.of(context).orientation;
    final bool isLandscape = orientation == Orientation.landscape;
    Orientation currentOrientation = MediaQuery.of(context).orientation;

    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      Orientation currentOrientation = MediaQuery.of(context).orientation;

      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);

        return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              // width: SizeConfig.widthMultiplier*90,

              child: Container(
                  child: FutureBuilder(
                      future: MarketDataRepositoryImpl()
                          .getAllAssets("gbp")
                          .then((value) {
                        allAssetListPOJO.addAll(value);
                      }),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        print("asy");

                        print("ELSE");
                        return Container(
                            height: SizeConfig.heightMultiplier * 80,
                            child: ListView(children: [
                              //Expanded(

                              // child: SingleChildScrollView(
                              // scrollDirection: Axis.vertical,
                              // child:

                              DataTable(
                                columnSpacing: 38.0,
                                columns: const [
                                  DataColumn(label: Text('Symbol')),
                                  DataColumn(label: Text('Name')),
                                  DataColumn(label: Text('Price')),
                                  DataColumn(label: Text('High 24H')),
                                  DataColumn(label: Text('Low 24H')),
                                ],
                                rows: List.generate(allAssetListPOJO.length,
                                    (index) {
                                  final y = allAssetListPOJO[index].name;

                                  final x =
                                      allAssetListPOJO[index].current_price;
                                  final z = allAssetListPOJO[index].high_24h;
                                  final w = allAssetListPOJO[index].low_24h;

                                  return DataRow(cells: [
                                    DataCell(Container(
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.all(10.0),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: ClipRect(
                                            child: Image.network(
                                              allAssetListPOJO[index].image,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ))),
                                    DataCell(Container(child: Text(y!))),
                                    DataCell(
                                        Container(child: Text(x.toString()))),
                                    DataCell(
                                        Container(child: Text(w.toString()))),
                                    DataCell(
                                        Container(child: Text(z.toString())))
                                  ]);
                                }),
                              ),
                            ]));
                      })

                  // ListView.builder(
                  //
                  //     scrollDirection: Axis.vertical,
                  //     shrinkWrap: true,
                  //     itemCount: allAssetListPOJO.length,
                  //     itemBuilder: (context, index) {
                  //       //  print("INSIDE itemBuilder in ");
                  //
                  //       return GestureDetector(
                  //         onTap: () async{
                  //
                  //
                  //
                  //
                  //
                  //
                  //         },
                  //                          child:
                  //
                  //
                  //
                  //         Column(
                  //             children: <Widget>[
                  //
                  //               Container(
                  //
                  //
                  //                   width: isLandscape?  MediaQuery.of(context).size.width*90
                  //
                  //                       :SizeConfig.widthMultiplier*90,
                  //                   color: Colors.brown,
                  //                   padding: EdgeInsets.all(10),
                  //
                  //                   child: Card(
                  //                     elevation: 10,
                  //                     color: Colors.white38,
                  //
                  //                     child: Column(children: [
                  //
                  //
                  //                       Container(
                  //                         padding: EdgeInsets.all(10),
                  //
                  //                         child: DataTable(
                  //                           // border: TableBorder.all(
                  //                           //     color: Colors.black, width: 1.0, style: BorderStyle.solid),
                  //
                  //
                  //
                  //                     rows: [
                  //
                  //
                  //                               DataRow(cells: [
                  //                                 DataCell( Container(
                  //                                     padding: EdgeInsets.all(10),
                  //                                     color: Color.fromRGBO(17, 36, 49, 0.5),
                  //
                  //                                     child:
                  //                                     Text("Symbol", textScaleFactor: 1.5)),),
                  //                                 DataCell(    Container(
                  //                                     padding: EdgeInsets.all(10),
                  //                                     color: Color.fromRGBO(17, 36, 49, 0.5),
                  //
                  //                                     child:
                  //                                     Text("Price", textScaleFactor: 1.5)),
                  //                                 ),
                  //                                 DataCell( Container(
                  //                                     padding: EdgeInsets.all(10),
                  //                                     color: Color.fromRGBO(17, 36, 49, 0.5),
                  //
                  //                                     child:
                  //                                     Text("24H High", textScaleFactor: 1.5)),
                  //                                 ),
                  //                                 DataCell(  Container(
                  //                                     padding: EdgeInsets.all(10),
                  //                                     color: Color.fromRGBO(17, 36, 49, 0.5),
                  //
                  //                                     child:
                  //                                     Text("24H Low", textScaleFactor: 1.5)),),
                  //                               ])
                  //                             ],
                  //                           columns: [
                  //                             DataColumn(
                  //                               label:        Container(
                  //                                   alignment: Alignment.topLeft,
                  //                                   padding: EdgeInsets.all(10.0),
                  //
                  //                                   child:  CircleAvatar(
                  //
                  //                                     backgroundColor: Colors.white,
                  //                                     child: ClipRect(
                  //                                       child: Image.network(
                  //
                  //                                         allAssetListPOJO[index].image,
                  //                                         fit: BoxFit.cover,
                  //                                       ),
                  //                                     ),
                  //                                   )),
                  //                             ),
                  //                             DataColumn(
                  //                               label:    Container(
                  //                                 alignment: Alignment.topLeft,
                  //                                 padding: EdgeInsets.all(5.0),
                  //                                 child: Text(
                  //                                   allAssetListPOJO[index].name?? 'No timestamp ',
                  //
                  //                                   textScaleFactor: 1.3,
                  //                                   style: const TextStyle(color: Colors.black),
                  //
                  //                                   //  textAlign: TextAlign.center,
                  //                                 ),
                  //                               ),
                  //
                  //
                  //                             ),
                  //                             DataColumn(
                  //                               label:
                  //                               Container(
                  //                                 alignment: Alignment.topLeft,
                  //                                 padding: EdgeInsets.all(5.0),
                  //                                 child: Text(
                  //                                   allAssetListPOJO[index].current_price.toString()?? 'No timestamp ',
                  //
                  //                                   textScaleFactor: 1.3,
                  //                                   style: const TextStyle(color: Colors.black),
                  //
                  //                                   //  textAlign: TextAlign.center,
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                             DataColumn(
                  //                               label:   Container(
                  //                                 alignment: Alignment.topLeft,
                  //                                 padding: EdgeInsets.all(5.0),
                  //                                 child: Text(
                  //                                   allAssetListPOJO[index].high_24h.toString()?? 'No timestamp ',
                  //
                  //                                   textScaleFactor: 1.3,
                  //                                   style: const TextStyle(color: Colors.black),
                  //
                  //                                   //  textAlign: TextAlign.center,
                  //                                 ),
                  //                               ),
                  //
                  //                             ),
                  //
                  //                           ],
                  //
                  //
                  //
                  //
                  //
                  //
                  //
                  //                         ),
                  //                       ),
                  //
                  //
                  //
                  //
                  //                     ],)
                  //
                  //
                  //
                  //
                  //
                  //
                  //
                  //
                  //
                  //                   )
                  //               ) ]),
                  //       );
                  //
                  //     }));

                  // ]),

                  ),

              // ],
              // ),
              //   ),
              // ),
            ));
      });
    }));
  }
}
