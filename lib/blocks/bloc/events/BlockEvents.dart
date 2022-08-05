import 'package:equatable/equatable.dart';

import '../../model/GetChainPOJO.dart';

abstract class BlockEvents extends Equatable {
  const BlockEvents();

  @override
  List<Object> get props => [];
}

class BlockStarted extends BlockEvents {
  @override
  List<Object> get props => [];
}

class NodeSignedOut extends BlockEvents {
  @override
  List<Object> get props => [];
}
class GetBlockEvent extends BlockEvents {
  // final int mined_by;
  //GetChainPOJO? getChainPOJO;

  GetBlockEvent();
}
