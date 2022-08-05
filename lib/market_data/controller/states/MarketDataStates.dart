import 'package:equatable/equatable.dart';

abstract class MarketDataState extends Equatable {
  const MarketDataState();

  @override
  List<Object?> get props => [];
}

class MarketDataInitial extends MarketDataState {
  @override
  List<Object?> get props => [];
}

class MarketDataSuccess extends MarketDataState {
  const MarketDataSuccess();

  @override
  List<Object?> get props => [];
}

