
import 'dart:io';

import 'package:blockchain_world/accounts/controller/bloc/accoun_bloc/AccountsBloc.dart';
import 'package:blockchain_world/accounts/controller/bloc/events/AccountsEvents.dart';
import 'package:blockchain_world/accounts/controller/bloc/repository/AccountRepository.dart';
import 'package:blockchain_world/accounts/view/CreateAccounts.dart';
import 'package:blockchain_world/home/view/HomeView.dart';
import 'package:blockchain_world/nodes/bloc/block_bloc/NodeBloc.dart';
import 'package:blockchain_world/nodes/bloc/block_repository/NodeRepository.dart';
import 'package:blockchain_world/nodes/view/NodesDetailsScreen.dart';
import 'package:blockchain_world/settings/view/Settings.dart';
import 'package:blockchain_world/transactions/bloc/events/TransactionEvents.dart';
import 'package:blockchain_world/transactions/bloc/transaction_bloc/TransactionBloc.dart';
import 'package:blockchain_world/transactions/bloc/transaction_repository/TransactionRepository.dart';
import 'package:blockchain_world/transactions/view/TransactionList.dart';
import 'package:blockchain_world/util/AppBlocObserver.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'accounts/model/AllAccounts/AllAccountsPOJO.dart';
import 'blocks/bloc/block_bloc/BlockBloc.dart';
import 'blocks/bloc/block_repository/BlockRepository.dart';
import 'nodes/bloc/events/NodeEvents.dart';
import 'util/common/MultipleArguments.dart';
import 'blocks/view/BlockDeatails.dart';

import 'blocks/bloc/events/BlockEvents.dart';
import 'blocks/model/GetChainPOJO.dart';
import 'package:page_transition/page_transition.dart';

import 'blocks/view/GetAllBlocks.dart';



late GetChainPOJO? getChainPOJO;
late String nodePublicKey;
late AllAccountsPOJO accountsPOJO;
GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey=GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //       apiKey: "AIzaSyAv4_Njj_ldCP43eift01yplFOvOS8I40E",
  //       appId: "com.googleusercontent.apps.121825945376-c16gph017o7fk21rjb8tcnkuek83m6u8",
  //       messagingSenderId: "your key",
  //       projectId: "blockchainworld-45aab",
  //     ),
  //   );
  // } else {
  //   await Firebase.initializeApp();
  // }

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAv4_Njj_ldCP43eift01yplFOvOS8I40E",
        appId: "com.googleusercontent.apps.121825945376-c6dspl7qe2qr3d7g2codp105eirnr1m0",
        messagingSenderId: "your key",
        projectId: "blockchainworld-45aab",
      ),
    );
  } else {
    await Firebase.initializeApp(
    );

  }




  BlocOverrides.runZoned(
        () => runApp(MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
            AccountsBloc(AccountRepositoryImpl())
              ..add(GetAllAccount()),
          ),
          BlocProvider(
            create: (context) =>
            BlockBloc(BlockRepositoryImpl())
              ..add(GetBlockEvent()),
          ),
          BlocProvider(
            create: (context) =>
            TransactionBloc(TransactionRepositoryImpl())
              ..add(TransactionsInitial()),
          ),

          BlocProvider(
            create: (context) =>
            NodeBloc(NodeRepositoryImpl())
              ..add(NodeStarted()),
          ),
        ],

        child:

        //  runApp(
        MaterialApp(
          scaffoldMessengerKey: scaffoldMessengerKey, // add this

          // builder: (context, child) => ResponsiveWrapper.builder(
          //     child,
          //     maxWidth: 1200,
          //     minWidth: 480,
          //     defaultScale: true,
          //     breakpoints: [
          //       const ResponsiveBreakpoint.resize(480, name: MOBILE),
          //       const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          //       const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          //     ],
          //     background: Container(color: Color(0xFFF5F5F5))),

          //initialRoute: '/AddTransactions' ,
          initialRoute: '/HomeView' ,

          onGenerateRoute: (RouteSettings settings) {
            ResponsiveSizingConfig.instance.setCustomBreakpoints(
              const ScreenBreakpoints(desktop: 800, tablet: 550, watch: 200),
            );


            //ProductArguments? args;
            // final  args= settings.arguments as ProductArguments ;

            final args = settings.arguments;





            switch (settings.name) {

            case '/HomeView':

              return
                PageTransition(
                  child:HomeView(),
                  type: PageTransitionType.leftToRight,
                  settings: settings,
                );
              break;

              case '/GetAllBlocks':

                return
                  PageTransition(
                    child:GetAllBlocks(),
                    type: PageTransitionType.leftToRight,
                    settings: settings,
                  );
                break;


              case '/CreateAccounts':

                return
                  PageTransition(
                    child:CreateAccounts(),
                    type: PageTransitionType.leftToRight,
                    settings: settings,
                  );
                break;

              case '/NodeDetails':

                 return
                   PageTransition(
                     child:NodeDetails(),
                     type: PageTransitionType.leftToRight,
                     settings: settings,
                   );
                 break;


              case '/HomeScreen':
                ArgumentsPOJO? argumentsPOJO = args as ArgumentsPOJO?;

                return


                  PageTransition(
                    child:HomeView(),
                    type: PageTransitionType.leftToRight,
                    settings: settings,
                  );

                break;

              case '/Settings':
                ArgumentsPOJO? argumentsPOJO = args as ArgumentsPOJO?;

                return


                  PageTransition(
                    child:Settings(),
                    type: PageTransitionType.leftToRight,
                    settings: settings,
                  );

                break;
              case '/AddTransactions':
                ArgumentsPOJO? argumentsPOJO = args as ArgumentsPOJO?;

                return


                  PageTransition(
                    child:TransactionList(),
                    type: PageTransitionType.leftToRight,
                    settings: settings,
                  );

                break;


              case '/BlockDetails':
                ArgumentsPOJO? argumentsPOJO = args as ArgumentsPOJO?;

                return


                  PageTransition(
                    child:BlockDetailSate(argumentsPOJO:ArgumentsPOJO
                      (index: argumentsPOJO!.index,message: argumentsPOJO.message,
                        previous_hash: argumentsPOJO.previous_hash,current_block_hask: argumentsPOJO.current_block_hask,
                        proof: argumentsPOJO.proof,
                        timestamp: argumentsPOJO.timestamp,transactions: argumentsPOJO.transactions
                    )),
                    type: PageTransitionType.leftToRight,
                    settings: settings,
                  );

                break;




              default:
                return MaterialPageRoute(
                    builder: (_) =>
                        Scaffold(

                          body: Center(
                              child: Text('No route defined for ${settings.name}')),
                        ));

            }
          },
          // initialRoute: '/',
//      routes: {
//        // When navigating to the "/" route, build the FirstScreen widget.
//        '/': (context) => Homepage(),
//        // When navigating to the "/second" route, build the SecondScreen widget.
//        '/publisherhomepage': (context) => PublisherHomePage(),
//
//     //  '/PublisherDetailsState': (context) => PublisherDetails(),
//        '/platformhomepage': (context) => PlatformHomePage(),
//
//
//      },
        )
    )),
    blocObserver: AppBlocObserver(),

  );
  //

  //


  // //
  // runApp(
  //


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
