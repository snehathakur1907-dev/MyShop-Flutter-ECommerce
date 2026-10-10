
import 'package:flutter_test/flutter_test.dart';
import 'package:myshop/main.dart';

void main() {
  testWidgets('MyShop app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const MyShopApp());

    expect(find.text('MyShop'), findsOneWidget);
    expect(find.text('Popular Products'), findsOneWidget);
  });
}
