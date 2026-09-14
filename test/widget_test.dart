import 'package:flutter_test/flutter_test.dart';
import 'package:drivevault/main.dart';

void main() {
  testWidgets('DriveVault loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const DriveVaultApp());

    expect(find.text('DRIVEVAULT'), findsOneWidget);
    expect(find.textContaining('FIND YOUR'), findsOneWidget);
    expect(find.text('BMW M5'), findsOneWidget);
    expect(find.text('Porsche 911'), findsOneWidget);
    expect(find.text('Ford Mustang'), findsOneWidget);
  });
}