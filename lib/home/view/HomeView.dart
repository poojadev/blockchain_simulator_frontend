import 'package:blockchain_world/accounts/view/CreateAccounts.dart';
import 'package:blockchain_world/blocks/view/GetAllBlocks.dart';
import 'package:blockchain_world/nodes/bloc/block_repository/NodeRepository.dart';
import 'package:blockchain_world/settings/view/Settings.dart';
import 'package:blockchain_world/transactions/view/TransactionList.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../nodes/view/NodesDetailsScreen.dart';
import '../../util/ui/sizeConfig.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  static const String routeName = "/HomeView";

  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        //NodeRepositoryImpl().createNode();
        NodeRepositoryImpl().connectNodeOne();
        NodeRepositoryImpl().connectNodeTwo();
        SizeConfig().init(constraints, orientation);

        return SingleChildScrollView(
            child: Container(
                height: SizeConfig.heightMultiplier * 60,
                // width: SizeConfig.widthMultiplier*90,

                child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        // give the tab bar a height [can change hheight to preferred height]
                        SizedBox(height: 20,),
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(
                              25.0,
                            ),
                          ),
                          child: TabBar(
                            controller: _tabController,
                            // give the indicator a decoration (color and border radius)
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                25.0,
                              ),
                              color: Colors.black87,
                            ),
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.black,
                            tabs: const [
                              // first tab [you can add an icon using the icon property]
                              Tab(
                                text: 'Accounts',

                              ),

                              // second tab [you can add an icon using the icon property]
                              Tab(
                                text: 'Transactions',
                              ),
                              Tab(
                                text: 'Nodes',

                              ),

                              Tab(
                                text: 'Blocks',
                              ),
                              Tab(
                                text: 'Settings',
                              ),
                            ],
                          ),
                        ),
                        // tab bar view here
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children:  [
                              // first tab bar view widget

                              CreateAccounts(
                              ),

                              // second tab bar view widget
                             TransactionList(),
                              NodeDetails(),

                              GetAllBlocks(),
                             Settings()
                             // AllAssetList()
                            ],
                          ),
                        ),
                      ],
                    ))));
      });
    }));
  }
}
