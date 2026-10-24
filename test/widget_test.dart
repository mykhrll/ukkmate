import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ukkmate/main.dart';
import 'package:ukkmate/features/splash/splash_screen.dart';

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
    expect(find.textContaining('UKKMate'), findsWidgets);

    // Advance timer past splash duration (4 seconds)
    await tester.pump(const Duration(seconds: 4));
    await tester.pumpAndSettle();

    // Verify login portal is reached
    expect(find.text('Portal Masuk UKKMate'), findsOneWidget);
  });
}
