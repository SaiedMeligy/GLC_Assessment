import 'dart:convert';
import 'package:glc_assessment/core/network/local/cache_helper.dart';
import '../../../Features/home/data/models/service_item.dart';
import 'cache_keys.dart';

class CacheRepository {
  final CacheHelper cache;

  CacheRepository(this.cache);

  Future<double> getBalance() async {
    final data = await cache.get(CacheKeys.balance);
    return data != null ? (data as num).toDouble() : 0.0;
  }

  Future<void> setBalance(double value) async {
    await cache.put(CacheKeys.balance, value);
  }

  Future<String> getUsername() async {
    final data = await cache.get(CacheKeys.username);
    return data ?? "";
  }

  Future<void> setUsername(String value) async {
    await cache.put(CacheKeys.username, value);
  }

  Future<List<ServiceItem>> getServices() async {
    final data = await cache.get(CacheKeys.services);
    if (data == null) return [];
    return (data as List).map((e) => ServiceItem.fromJson(e)).toList();
  }

  Future<void> setServices(List<ServiceItem> list) async {
    await cache.put(CacheKeys.services, list.map((e) => e.toJson()).toList());
  }
}
