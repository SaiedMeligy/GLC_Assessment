
import '../data/models/service_item.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final double balance;
  final String username;
  final List<ServiceItem> services;

  HomeLoaded({required this.balance, required this.username, required this.services});
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
