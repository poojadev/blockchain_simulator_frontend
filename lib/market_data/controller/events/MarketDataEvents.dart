import 'package:equatable/equatable.dart';


abstract class MarketDataEvents extends Equatable {
  const MarketDataEvents();

  @override
  List<Object> get props => [];
}

class MarketDataInit extends MarketDataEvents {
  @override
  List<Object> get props => [];
}


class GetMarketData extends MarketDataEvents {
final String currrency_name;

  GetMarketData(this.currrency_name);
}
