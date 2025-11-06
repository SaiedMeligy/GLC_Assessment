import 'package:flutter/material.dart';

class ServiceItem {
  final String id;
  final String title;
  final IconData icon;

  ServiceItem({
    required this.id,
    required this.title,
    required this.icon,
  });

  factory ServiceItem.fromJson(Map<String, dynamic> json) {
    return ServiceItem(
      id: json['id'],
      title: json['title'],
      icon: _iconForId(json['id'] as String? ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}

IconData _iconForId(String id) {
  switch (id) {
    case 'electric':
      return Icons.electrical_services;
    case 'schools':
      return Icons.menu_book_outlined;
    case 'university':
      return Icons.school_outlined;
    case 'gas':
      return Icons.local_fire_department_outlined;
    case 'water':
      return Icons.water_drop_outlined;
    case 'installments':
      return Icons.request_quote_outlined;
    case 'fakka':
      return Icons.discount_outlined;
    case 'mobile_internet':
      return Icons.swap_vert_outlined;
    case 'vodafone_bill':
      return Icons.receipt_long_outlined;
    case 'card_to_Wallet':
      return Icons.account_balance_wallet_outlined;
    case 'donations':
      return Icons.volunteer_activism_outlined;
    case 'atm_transactions':
      return Icons.atm;
    case 'transfer':
      return Icons.sync_alt;
    case 'recharge':
      return Icons.phone_android;
    case 'flex':
      return Icons.autorenew;
    default:
      return Icons.apps;
  }
}
