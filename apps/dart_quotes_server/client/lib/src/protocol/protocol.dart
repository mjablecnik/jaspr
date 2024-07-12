/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'quote.dart' as _i2;
import 'quote_init.dart' as _i3;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i4;
export 'quote.dart';
export 'quote_init.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Quote) {
      return _i2.Quote.fromJson(data) as T;
    }
    if (t == _i3.QuoteInit) {
      return _i3.QuoteInit.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Quote?>()) {
      return (data != null ? _i2.Quote.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.QuoteInit?>()) {
      return (data != null ? _i3.QuoteInit.fromJson(data) : null) as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i4.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.Quote) {
      return 'Quote';
    }
    if (data is _i3.QuoteInit) {
      return 'QuoteInit';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i4.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Quote') {
      return deserialize<_i2.Quote>(data['data']);
    }
    if (data['className'] == 'QuoteInit') {
      return deserialize<_i3.QuoteInit>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
