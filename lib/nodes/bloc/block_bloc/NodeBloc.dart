import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import '../block_repository/NodeRepository.dart';
import '../events/NodeEvents.dart';
import '../states/NodeStates.dart';


class NodeBloc
    extends Bloc<NodeEvents, NodeState> {
  final NodeRepository _nodeRepository;
  late  int nodeLength;

  NodeBloc(this._nodeRepository)
      : super(NodeInitial()) {
    on<NodeEvents>((event, emit) async {
      if (event is NodeInitial) {
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
      else if(event is GetNodeEvent){
        print("GetBlockEvent");


        //  await _nodeRepository.signOut();
        // emit(NodeFailure());

      }


    });
  }
}
