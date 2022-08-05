import 'package:bloc/bloc.dart';
import 'package:blockchain_world/market_data/controller/events/MarketDataEvents.dart';
import 'package:blockchain_world/market_data/controller/repository/MarketDataRepository.dart';
import 'package:blockchain_world/market_data/controller/states/MarketDataStates.dart';

import 'package:equatable/equatable.dart';



class MarketDataBloc
    extends Bloc<MarketDataEvents, MarketDataState> {
  final MarketDataRepositoryImpl  _marketDataRepositoryImpl;
  late  int nodeLength;

  MarketDataBloc(this._marketDataRepositoryImpl)
      : super(MarketDataInitial()) {
    on<MarketDataEvents>((event, emit) async {
      if (event is MarketDataInit) {
        print("block");



        // UserModel user =
        //  if (user.uid != "uid") {
        //    // String? displayName = await _nodeRepository.retrieveUserName(user);
        //    // emit(NodeSuccess(displayName: displayName));
        //
        //
        //
        //
        //  } else {
        //    emit(NodeFailure());
        //  }
      }
      else if(event is GetMarketData){
        print("GetBlockEvent");

        _marketDataRepositoryImpl.getAllAssets(event.currrency_name);

        //  await _nodeRepository.signOut();
        // emit(NodeFailure());

      }


    });
  }
}
