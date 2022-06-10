import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Initial App Test', () {
    FlutterDriver? driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    test('verify the text on home screen', () async {
      SerializableFinder message = find.text("You have pushed the button this many times:");
      await driver?.waitFor(message);
      final File image = await File('screenshots/${DateTime.now()}.png').create(recursive: true);

      image.writeAsBytesSync(await driver!.screenshot());
      expect(await driver?.getText(message), "You have pushed the button this many times:");
    });

    tearDownAll(() {
      driver?.close();
    });
  });
}
