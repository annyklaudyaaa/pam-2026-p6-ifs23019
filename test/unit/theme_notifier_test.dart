// test/unit/theme_notifier_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pam_p6_2026_ifs23019/core/theme/theme_notifier.dart';

void main() {
  group('ThemeNotifier (Logic Test)', () {
    late ThemeNotifier notifier;

    setUp(() {
      // Buat instance baru sebelum setiap test
      notifier = ThemeNotifier(initial: ThemeMode.system);
    });

    tearDown(() {
      notifier.dispose();
    });

    test('nilai awal harus sesuai dengan parameter initial (System)', () {
      expect(notifier.value, equals(ThemeMode.system));
      expect(notifier.isDark, isFalse);
    });

    test('isDark harus mengembalikan true saat mode diatur ke dark', () {
      notifier.setMode(ThemeMode.dark);
      expect(notifier.isDark, isTrue);
    });

    test('isDark harus mengembalikan false saat mode diatur ke light', () {
      notifier.setMode(ThemeMode.light);
      expect(notifier.isDark, isFalse);
    });

    test('logika toggle: dari system (non-dark) harus berubah ke dark', () {
      // System mode dianggap isDark = false, sehingga toggle akan mengarah ke dark
      notifier.setMode(ThemeMode.system);
      notifier.toggle();
      expect(notifier.value, equals(ThemeMode.dark));
    });

    test('logika toggle: dari dark harus berubah ke light', () {
      notifier.setMode(ThemeMode.dark);
      notifier.toggle();
      expect(notifier.value, equals(ThemeMode.light));
    });

    test('logika toggle: dari light harus berubah ke dark', () {
      notifier.setMode(ThemeMode.light);
      notifier.toggle();
      expect(notifier.value, equals(ThemeMode.dark));
    });

    test('logika toggle dua kali: harus kembali ke mode awal (light)', () {
      notifier.setMode(ThemeMode.light);
      notifier.toggle(); // Ke dark
      notifier.toggle(); // Kembali ke light
      expect(notifier.value, equals(ThemeMode.light));
    });

    test('setMode harus mengubah value secara eksplisit dengan benar', () {
      notifier.setMode(ThemeMode.dark);
      expect(notifier.value, equals(ThemeMode.dark));

      notifier.setMode(ThemeMode.light);
      expect(notifier.value, equals(ThemeMode.light));

      notifier.setMode(ThemeMode.system);
      expect(notifier.value, equals(ThemeMode.system));
    });

    test('notifier harus memberitahu listener (UI) saat value berubah', () {
      int callCount = 0;
      notifier.addListener(() => callCount++);

      notifier.toggle(); // Call 1
      notifier.setMode(ThemeMode.light); // Call 2

      expect(callCount, equals(2));
    });
  });
}