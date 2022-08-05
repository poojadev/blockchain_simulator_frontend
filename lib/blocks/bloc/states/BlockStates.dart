import 'package:equatable/equatable.dart';

abstract class BlockState extends Equatable {
  const BlockState();

  @override
  List<Object?> get props => [];
}

class BlockInitial extends BlockState {
  @override
  List<Object?> get props => [];
}

class BlockSuccess extends BlockState {
  final String? message;
  const BlockSuccess({this.message});

  @override
  List<Object?> get props => [message];
}

class BlockFailure extends BlockState {
  @override
  List<Object?> get props => [];
}