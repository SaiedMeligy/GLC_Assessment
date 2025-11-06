import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/network/local/cach_repository.dart';
import '../data/models/service_item.dart';
import 'home_states.dart';
import 'package:flutter/material.dart';


class HomeCubit extends Cubit<HomeState> {
  final CacheRepository _repo;

  HomeCubit({required CacheRepository repo})
      : _repo = repo,
        super(HomeInitial());

  Future<void> loadInitial() async {
    emit(HomeLoading());
    try {
      final defaultServices = [
          ServiceItem(id: 'electric', title: 'Electricity', icon: Icons.electrical_services),
          ServiceItem(id: 'schools', title: 'Schools', icon: Icons.menu_book_outlined),
          ServiceItem(id: 'university', title: 'University Tuition', icon: Icons.school_outlined),
          ServiceItem(id: 'gas', title: 'Gas', icon: Icons.local_fire_department_outlined),
          ServiceItem(id: 'water', title: 'Water', icon: Icons.water_drop_outlined),
          ServiceItem(id: 'installments', title: 'Installments', icon: Icons.request_quote_outlined),
          ServiceItem(id: 'fakka', title: 'Fakka Cards Recharge', icon: Icons.discount_outlined),
          ServiceItem(id: 'mobile_internet', title: 'Mobile Internet', icon: Icons.swap_vert_outlined),
          ServiceItem(id: 'vodafone_bill', title: 'Vodafone Bill', icon: Icons.receipt_long_outlined),
          ServiceItem(id: 'card_to_Wallet', title: 'Card to wallet', icon: Icons.account_balance_wallet_outlined),
          ServiceItem(id: 'donations', title: 'Donations', icon: Icons.volunteer_activism_outlined),
          ServiceItem(id: 'atm_transactions', title: 'ATM Transactions', icon: Icons.atm),
      ];

      final services = await _repo.getServices();

      if (services.isEmpty || services.length < defaultServices.length) {
        await _repo.setServices(defaultServices);
        if (services.isEmpty) {
          await _repo.setBalance(1.48);
          await _repo.setUsername("أحمد");
        }
      }

      final balance = await _repo.getBalance();
      final username = await _repo.getUsername();
      final loadedServices = await _repo.getServices();

      emit(HomeLoaded(balance: balance, username: username, services: loadedServices));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

}
