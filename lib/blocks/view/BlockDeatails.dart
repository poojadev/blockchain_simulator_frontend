import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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

      return
        Scaffold(



            body:   LayoutBuilder(builder: (context, constraints) {
              return OrientationBuilder(
                  builder: (context, orientation) {
                    SizeConfig().init(constraints, orientation);



                    return  Container(


                      child:  Container(

                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(15),

                       child: Card(
                    color: Colors.white,
                    elevation: 11,

                        child:  ListView(
                            //direction: Axis.vertical,

                            children: [




            Container(


                height:


                        MediaQuery.of(context).size.height*0.50,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(30),

                child:

               Container(
                 color: Colors.white,

             // elevation:11,
              child: Wrap(children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: Text("Block Number",

                    textScaleFactor: 1.1,
                    style: const TextStyle(color: Colors.black54),

                    //  textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    widget.argumentsPOJO.index.toString(),

                    textScaleFactor: 1.1,
                    style: const TextStyle(color: Colors.black),

                    //  textAlign: TextAlign.center,
                  ),
                ),

                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: Text("Nonce",

                    textScaleFactor: 1.1,
                    style: const TextStyle(color: Colors.black54),

                    //  textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    widget.argumentsPOJO.proof.toString() ,

                    textScaleFactor: 1.1,
                    style: const TextStyle(color: Colors.black),

                    //  textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: Text("Timestamp",

                    textScaleFactor: 1.1,
                    style: const TextStyle(color: Colors.black54),

                    //  textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    widget.argumentsPOJO.timestamp.toString() ,

                    textScaleFactor: 1.1,
                    style: const TextStyle(color: Colors.black),

                    //  textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: Text("Previous Block Hash ",

                    textScaleFactor: 1.1,
                    style: const TextStyle(color: Colors.black54),

                    //  textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    widget.argumentsPOJO.previous_hash.toString() ,

                    textScaleFactor: 1.1,
                    style: const TextStyle(color: Colors.black),

                    //  textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: Text("Current Block Hash",

                    textScaleFactor: 1.1,
                    style: const TextStyle(color: Colors.black54),

                    //  textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    widget.argumentsPOJO.current_block_hask.toString() ,

                    textScaleFactor: 1.1,
                    style: const TextStyle(color: Colors.black),

                    //  textAlign: TextAlign.center,
                  ),
                ),
              ]),
            ) ),
                              const Divider(
                                color: Colors.black12,
                                thickness: 1.0,
                              ),



                          Container(
                              height:   kIsWeb?     MediaQuery.of(context).size.height*0.45:SizeConfig.heightMultiplier*40,

                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(left: 20,right: 20),


                              child: ListView(children: [

                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: const EdgeInsets.all(5.0),
                                  child: const Text("Transactions",

                                    textScaleFactor: 1.1,
                                    style: TextStyle(color: Colors.black),

                                    //  textAlign: TextAlign.center,
                                  ),
                                ),
                                          //Expanded(

                                          // child: SingleChildScrollView(
                                          // scrollDirection: Axis.vertical,
                                          // child:
                                          Container(

                                            color: Colors.white,


                                           // elevation:11,
                                            margin: EdgeInsets.all(10),



                                            child:

                                          DataTable(
                                            columnSpacing: 15.0,
                                            // border: TableBorder.all(  width: 1,color: Colors.black,style: BorderStyle.solid
                                            // ),
                                            columns: const [
                                              DataColumn(label: Text('Sender')),
                                              DataColumn(label: Text('Receiver')),
                                              DataColumn(label: Text('Signature')),
                                              DataColumn(label: Text('Coins')),
                                            ],
                                            rows: List.generate(widget.argumentsPOJO.transactions.length,
                                                    (index) {
                                                  final y = widget.argumentsPOJO.transactions[index].tx.sender;

                                                  final x =
                                                      widget.argumentsPOJO.transactions[index].tx.receiver;
                                                  final v = widget.argumentsPOJO.transactions[index].signature;

                                                  final z =
                                                      widget.argumentsPOJO.transactions[index].tx.is_mining_reward==1?"Mining reward  " +



                                                  widget.argumentsPOJO.transactions[index].tx.amount.toString():widget.argumentsPOJO.transactions[index].tx.amount;

                                                  return



                                                    DataRow(cells: [


                                                    DataCell(Container(width:MediaQuery.of(context).size.width*0.20,
                                                        padding: const EdgeInsets.all(7),



                                                        child: Text(y))),

                                                      DataCell(Container(width:MediaQuery.of(context).size.width*0.20,
                                                          padding: const EdgeInsets.all(7),



                                                          child: Text(v))),
                                                    DataCell(
                                                        Container(
                                                      width:MediaQuery.of(context).size.width*0.20,
                                                            padding: EdgeInsets.all(7),


                                                            child: Text(x.toString()))),

                                                    DataCell(
                                                        Container(
                                                            padding: EdgeInsets.all(7),

                                                            child: Text(z.toString())))
                                                  ]);
                                                }),
                                          ),



                                          )



                                        ]))






          ]) ),



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
