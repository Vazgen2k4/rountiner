part of 'start_bloc.dart';

sealed class StartState extends Equatable {
  const StartState();
  
  @override
  List<Object> get props => [];
}

final class StartInitial extends StartState {}
