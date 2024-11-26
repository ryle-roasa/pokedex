import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  Debouncer() : _debouncerByKey = <String, Timer>{};

  final Map<String, Timer> _debouncerByKey;

  void run({
    required String key,
    required VoidCallback action,
    Duration? duration,
  }) {
    final timer = _debouncerByKey[key];
    timer?.cancel();
    _debouncerByKey[key] = Timer(
      duration ?? _defaultDuration,
      action,
    );
  }

  static const Duration _defaultDuration = Duration(milliseconds: 500);
}
