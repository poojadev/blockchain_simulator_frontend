import 'package:equatable/equatable.dart';

abstract class NodeState extends Equatable {
  const NodeState();

  @override
  List<Object?> get props => [];
}

class NodeInitial extends NodeState {
  @override
  List<Object?> get props => [];
}


