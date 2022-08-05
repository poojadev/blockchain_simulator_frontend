import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util/ui/sizeConfig.dart';
import '../../util/common/MultipleArguments.dart';

late ArgumentsPOJO argumentsPOJO;

class BlockDetail extends StatelessWidget {
  static const String routeName = "/BlockDetails";

  late ArgumentsPOJO argumentsPOJO;

  BlockDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlockDetailSate(
//        id: genresId,
//        genresName: genresName,
//        pageDirection: pageDirection,
        key: key, argumentsPOJO: argumentsPOJO,
      ),
    );
  }
}

class BlockDetailSate extends StatefulWidget {
  const BlockDetailSate({Key? key, required this.argumentsPOJO})
      : super(key: key);

//  final int id;
//  final String genresName;
//  final int pageDirection;
  final ArgumentsPOJO argumentsPOJO;

  @override
  _BlockDetailsState createState() => _BlockDetailsState();
}

class _BlockDetailsState extends State<BlockDetailSate> {
  @override
    Widget build(BuildContext context) {

    final Orientation orientation = MediaQuery.of(context).orientation;
    final bool isLandscape = orientation == Orientation.landscape;
      return
        Scaffold(



            body:   LayoutBuilder(builder: (context, constraints) {
              return OrientationBuilder(
                  builder: (context, orientation) {
                    SizeConfig().init(constraints, orientation);



                    return  SingleChildScrollView(

                      child:  Container(
                        color: Colors.blueGrey,

                        height: SizeConfig.heightMultiplier*80,
                        width: isLandscape?  MediaQuery.of(context).size.width

                            :SizeConfig.widthMultiplier*100,
                        padding: const EdgeInsets.all(15),

                        child:  Column(children: [
            Card(
              color: Colors.white38,

              elevation: 4,
              child: Column(children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: Text("Block Number",

                    textScaleFactor: 1.3,
                    style: const TextStyle(color: Colors.black54),

                    //  textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    widget.argumentsPOJO.index.toString() ?? 'No Sender ',

                    textScaleFactor: 1.3,
                    style: const TextStyle(color: Colors.black),

                    //  textAlign: TextAlign.center,
                  ),
                ),

                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: Text("Nonce",

                    textScaleFactor: 1.3,
                    style: const TextStyle(color: Colors.black54),

                    //  textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    widget.argumentsPOJO.proof.toString() ?? 'No receiver ',

                    textScaleFactor: 1.3,
                    style: const TextStyle(color: Colors.black),

                    //  textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: Text("Timestamp",

                    textScaleFactor: 1.3,
                    style: const TextStyle(color: Colors.black54),

                    //  textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    widget.argumentsPOJO.timestamp.toString() ?? 'No Sender ',

                    textScaleFactor: 1.3,
                    style: const TextStyle(color: Colors.black),

                    //  textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: Text("Previous Block Hash ",

                    textScaleFactor: 1.3,
                    style: const TextStyle(color: Colors.black54),

                    //  textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    widget.argumentsPOJO.previous_hash.toString() ??
                        'No Sender ',

                    textScaleFactor: 1.3,
                    style: const TextStyle(color: Colors.black),

                    //  textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: Text("Current Block Hash",

                    textScaleFactor: 1.3,
                    style: const TextStyle(color: Colors.black54),

                    //  textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    widget.argumentsPOJO.current_block_hask.toString() ??
                        'No Sender ',

                    textScaleFactor: 1.3,
                    style: const TextStyle(color: Colors.black),

                    //  textAlign: TextAlign.center,
                  ),
                ),
              ]),
            ),

                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.all(5.0),
                            child: const Text("Transactions",

                              textScaleFactor: 1.3,
                              style: TextStyle(color: Colors.black54),

                              //  textAlign: TextAlign.center,
                            ),
                          ),
            Container(
                alignment: Alignment.topLeft,

                height: SizeConfig.heightMultiplier*30,
                width: isLandscape?  MediaQuery.of(context).size.width:SizeConfig.widthMultiplier*100,
                color: Colors.blueGrey,


                child:
            ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: widget.argumentsPOJO.transactions.length,
                itemBuilder: (context, index) {
                  print("INSIDE transactions in ");
                  var userDocument = widget.argumentsPOJO.transactions;

                  print(userDocument[index]);


                  return GestureDetector(
                      onTap: () {
                        // ArgumentsPOJO argumentPOJOI=
                        // ArgumentsPOJO(index: getAllBlocks!.chain[index].index,
                        //
                        //     message: "New transaction added",
                        //     previous_hash: getAllBlocks!.chain[index].previous_hash,
                        //     proof: getAllBlocks!.chain[index].proof,
                        //     timestamp: getAllBlocks!.chain[index].timestamp,
                        //     transactions: getAllBlocks!.chain[index].transactions);
                        //
                        //
                        //
                        // Navigator.pushNamed(context,
                        //     BlockDetail.routeName,
                        //     arguments: argumentPOJOI);
                        //
                      },
                      child: Container(
                          height: SizeConfig.heightMultiplier * 20,
                        width: SizeConfig.widthMultiplier*80,

                        child: Stack(children: <Widget>[
                          Container(




                              child: Card(
                                color: Colors.white38,

                                elevation: 10,
                                child: ListView(children: [

                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.all(5.0),
                                    child: const Text("Sender",

                                      textScaleFactor: 1.3,
                                      style: TextStyle(color: Colors.black54),

                                      //  textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      widget.argumentsPOJO.transactions[index]["sender"],

                                      textScaleFactor: 1.3,
                                      style:
                                          const TextStyle(color: Colors.black),

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
                                      widget.argumentsPOJO.transactions[index]["receiver"]
                                              .toString() ??
                                          'No receiver ',

                                      textScaleFactor: 1.3,
                                      style:
                                          const TextStyle(color: Colors.black),

                                      //  textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.all(5.0),
                                    child: const Text("Amount",
                                      textScaleFactor: 1.3,
                                      style: TextStyle(color: Colors.black54),
                                      //  textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      widget.argumentsPOJO.transactions[index]["amount"]
                                              .toString() ??
                                          'No Sender ',

                                      textScaleFactor: 1.3,
                                      style:
                                          const TextStyle(color: Colors.black),

                                      //  textAlign: TextAlign.center,
                                    ),
                                  ),
                                ]),
                              ))
                        ]),
                      ));
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
