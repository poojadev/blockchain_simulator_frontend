import 'package:equatable/equatable.dart';


abstract class NodeEvents extends Equatable {
  const NodeEvents();

  @override
  List<Object> get props => [];
}

class NodeStarted extends NodeEvents {
  @override
  List<Object> get props => [];
}


class GetNodeEvent extends NodeEvents {
  // final int mined_by;
  //GetChainPOJO? getChainPOJO;

  GetNodeEvent();
}
