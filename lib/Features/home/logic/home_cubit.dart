import 'package:flutter/foundation.dart';
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
      // Load from cache first (works offline)
      double balance = await _repo.getBalance();
      String username = await _repo.getUsername();
      List<ServiceItem> services = await _repo.getServices();
      
      // Define default services for seeding
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

      // Seed default data if cache is empty or outdated
      if (services.isEmpty || services.length < defaultServices.length) {
        await _repo.setServices(defaultServices);
        if (services.isEmpty) {
          await _repo.setBalance(1.48);
          await _repo.setUsername("أحمد");
          // Update local variables after seeding
          balance = 1.48;
          username = "أحمد";
        }
        // Reload services after seeding
        services = await _repo.getServices();
      }

      // Emit HomeLoaded state with final data
      emit(HomeLoaded(
        balance: balance,
        username: username,
        services: services,
      ));
    } catch (e) {
      // Fallback: try to load from cache even if seeding failed
      try {
        final fallbackBalance = await _repo.getBalance();
        final fallbackUsername = await _repo.getUsername();
        final fallbackServices = await _repo.getServices();
        
        if (fallbackServices.isNotEmpty || fallbackBalance > 0) {
          emit(HomeLoaded(
            balance: fallbackBalance,
            username: fallbackUsername,
            services: fallbackServices,
          ));
        } else {
          emit(HomeError('Failed to load data: ${e.toString()}'));
        }
      } catch (_) {
        emit(HomeError('Failed to load data: ${e.toString()}'));
      }
    }
  }

}
