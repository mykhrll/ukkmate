import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ukkmate/main.dart';
import 'package:ukkmate/features/splash/splash_screen.dart';
import 'package:ukkmate/features/navigation/main_navigation.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('aplikasi menampilkan splash lalu halaman login', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({'has_seen_onboarding': true});

    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // Verify splash screen is displayed
    expect(find.byType(SplashScreen), findsOneWidget);

    // Advance timer past splash duration (4 seconds)
    await tester.pump(const Duration(seconds: 4));
    await tester.pumpAndSettle();

    // Verify login portal is reached
    expect(find.text('Portal Masuk UKKMate'), findsOneWidget);
  });

  testWidgets('MainNavigation menampilkan tour interaktif popup untuk pengguna baru', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({'has_seen_menu_tour': false});

    await tester.pumpWidget(
      const MaterialApp(
        home: MainNavigation(),
      ),
    );
    await tester.pump();
    await tester.pumpAndSettle();

    // Verify first step popup of tour is displayed
    expect(find.text('Menu Beranda'), findsOneWidget);
    expect(find.text('PANDUAN DASAR • 1 DARI 5'), findsOneWidget);

    // Tap 'Lanjut'
    await tester.tap(find.text('Lanjut'));
    await tester.pumpAndSettle();

    // Verify second step
    expect(find.text('Menu Latihan'), findsOneWidget);
    expect(find.text('PANDUAN DASAR • 2 DARI 5'), findsOneWidget);

    // Tap 'Lewati' to dismiss
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();

    // Verify tour dismissed
    expect(find.text('PANDUAN DASAR • 2 DARI 5'), findsNothing);
  });
}
