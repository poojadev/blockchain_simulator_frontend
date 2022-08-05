import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../network/RestClient.dart';

import '../../../util/appconstants/AppConstants.dart';
import '../../../util/ui/sizeConfig.dart';
import '../../network/Node1.dart';
import '../../network/Node2.dart';
import '../Model/NodeAddressPOJO.dart';

class ConnectNodes extends StatelessWidget {
  static const String routeName = "/ConnectNodes";

  //late ArgumentsPOJO argumentsPOJO;

  ConnectNodes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConnectNodsScreen(
//        id: genresId,
//        genresName: genresName,
//        pageDirection: pageDirection,
          key: key),
    );
  }
}

var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;
RestClient restApiClient = RestClient(dio);
Node1 restApiClient1 =Node1(dio);
Node2 restApiClient2 =Node2(dio);

class ConnectNodsScreen extends StatefulWidget {
  const ConnectNodsScreen({Key? key}) : super(key: key);

  @override
  _ConnectNodsScreenState createState() => _ConnectNodsScreenState();
}

class _ConnectNodsScreenState extends State<ConnectNodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);

        return SingleChildScrollView(
          child: Container(
            height: SizeConfig.heightMultiplier * 80,
            // width: SizeConfig.widthMultiplier*90,
            padding: const EdgeInsets.all(25),

            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                    width: SizeConfig.widthMultiplier * 90,
                    height: SizeConfig.heightMultiplier * 7,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            elevation: 6,
                            // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                            padding: const EdgeInsets.all(15),
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: const Text(
                          'Connect Node 1',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        onPressed: () async {
                          /*
                                       flag=1 is for node 1
                                       flag=2 is for node 2
                                       flag=3 is for node 3
                                     */

                          List<String> node = [];
                          node.add("http://127.0.0.1:5001");
                          node.add("http://127.0.0.1:5002");
                          NodeAddressPOJO nodepojo = NodeAddressPOJO(node!);

                          restApiClient.connectNodes(nodepojo).then((value) {
                            print("Response" + value.toString());
                            // Navigator.pushNamed(
                            //   context,
                            //   NodeTransactionsDetails.routeName,
                            // );
                          });
                          print("Inside Node Connevction");


                          /*
                                      add no
                                      */
                        })),
                SizedBox(
                  height: 20,
                ),



                Container(
                    width: SizeConfig.widthMultiplier * 90,
                    height: SizeConfig.heightMultiplier * 7,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            elevation: 6,
                            // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                            padding: const EdgeInsets.all(15),
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: const Text(
                          'Connect Node 2',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        onPressed: () async {
                          /*
                                       flag=1 is for node 1
                                       flag=2 is for node 2
                                       flag=3 is for node 3
                                     */

                          List<String> node = [];
                          node.add("http://127.0.0.1:5000");
                          node.add("http://127.0.0.1:5002");
                          NodeAddressPOJO nodepojo = NodeAddressPOJO(node!);

                          restApiClient1.connectNodes(nodepojo).then((value) {
                            print("Response" + value.toString());
                            // Navigator.pushNamed(
                            //   context,
                            //   NodeTransactionsDetails.routeName,
                            // );
                          });
                          print("Inside Node Connevction");


                          /*
                                      add no
                                      */
                        })),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: SizeConfig.widthMultiplier * 90,
                    height: SizeConfig.heightMultiplier * 7,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            elevation: 6,
                            // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                            padding: const EdgeInsets.all(15),
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: const Text(
                          'Connect Node 3',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        onPressed: () async {
                          /*
                                       flag=1 is for node 1
                                       flag=2 is for node 2
                                       flag=3 is for node 3
                                     */

                          List<String> node = [];
                          node.add("http://127.0.0.1:5000");
                          node.add("http://127.0.0.1:5001");
                          NodeAddressPOJO nodepojo = NodeAddressPOJO(node!);

                          restApiClient2.connectNodes(nodepojo).then((value) {
                            print("Response" + value.toString());
                            // Navigator.pushNamed(
                            //   context,
                            //   NodeTransactionsDetails.routeName,
                            // );
                          });
                          print("Inside Node Connevction");


                          ;

                          /*
                                      add no
                                      */
                        })),
                SizedBox(
                  height: 20,
                ),
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
