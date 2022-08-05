import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import '../block_repository/BlockRepository.dart';
import '../events/BlockEvents.dart';
import '../states/BlockStates.dart';


class BlockBloc
    extends Bloc<BlockEvents, BlockState> {
  final BlockRepository _blockRepository;
  late  int nodeLength;

  BlockBloc(this._blockRepository)
      : super(BlockInitial()) {
    on<BlockEvents>((event, emit) async {
      if (event is BlockStarted) {
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
      else if(event is GetBlockEvent){
        print("GetBlockEvent");

        _blockRepository.getBlocks();

        //  await _nodeRepository.signOut();
        // emit(NodeFailure());

      }


    });
  }
}
