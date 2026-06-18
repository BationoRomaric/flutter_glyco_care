// C:\Users\openIT\StudioProjects\flutter_glyco_care\create_icons.dart
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  print('Création des icônes placeholder...');

  // Créer le dossier icons
  final iconsDir = Directory('assets/icons');
  if (!await iconsDir.exists()) {
    await iconsDir.create(recursive: true);
    print('✓ Dossier assets/icons créé');
  }

  // Créer les icônes
  await _createAppIcon();
  await _createAppIconForeground();
  await _createAppIconBackground();
  await _createNotificationIcon();

  print('✓ Toutes les icônes ont été créées avec succès!');
}

Future<void> _createAppIcon() async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder, const Rect.fromLTWH(0, 0, 1024, 1024));

  // Fond bleu
  final bgPaint = Paint()
    ..color = const Color(0xFF004CCD)
    ..style = PaintingStyle.fill;
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      const Rect.fromLTWH(50, 50, 924, 924),
      const Radius.circular(200),
    ),
    bgPaint,
  );

  // Croix médicale blanche
  final crossPaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;

  // Barre verticale
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      const Rect.fromLTWH(462, 250, 100, 524),
      const Radius.circular(50),
    ),
    crossPaint,
  );

  // Barre horizontale
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      const Rect.fromLTWH(250, 462, 524, 100),
      const Radius.circular(50),
    ),
    crossPaint,
  );

  final picture = recorder.endRecording();
  final img = await picture.toImage(1024, 1024);
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

  await File('assets/icons/app_icon.png').writeAsBytes(
    byteData!.buffer.asUint8List(),
  );
  print('✓ app_icon.png créé (1024x1024)');
}

Future<void> _createAppIconForeground() async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder, const Rect.fromLTWH(0, 0, 1024, 1024));

  // Cercle avec croix médicale (fond transparent)
  final circlePaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;
  canvas.drawCircle(const Offset(512, 512), 400, circlePaint);

  // Croix bleue
  final crossPaint = Paint()
    ..color = const Color(0xFF004CCD)
    ..style = PaintingStyle.fill;

  // Barre verticale
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      const Rect.fromLTWH(470, 280, 84, 464),
      const Radius.circular(42),
    ),
    crossPaint,
  );

  // Barre horizontale
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      const Rect.fromLTWH(280, 470, 464, 84),
      const Radius.circular(42),
    ),
    crossPaint,
  );

  final picture = recorder.endRecording();
  final img = await picture.toImage(1024, 1024);
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

  await File('assets/icons/app_icon_foreground.png').writeAsBytes(
    byteData!.buffer.asUint8List(),
  );
  print('✓ app_icon_foreground.png créé (1024x1024)');
}

Future<void> _createAppIconBackground() async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder, const Rect.fromLTWH(0, 0, 1024, 1024));

  // Fond bleu uni
  final bgPaint = Paint()
    ..color = const Color(0xFF004CCD)
    ..style = PaintingStyle.fill;
  canvas.drawRect(const Rect.fromLTWH(0, 0, 1024, 1024), bgPaint);

  final picture = recorder.endRecording();
  final img = await picture.toImage(1024, 1024);
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

  await File('assets/icons/app_icon_background.png').writeAsBytes(
    byteData!.buffer.asUint8List(),
  );
  print('✓ app_icon_background.png créé (1024x1024)');
}

Future<void> _createNotificationIcon() async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder, const Rect.fromLTWH(0, 0, 96, 96));

  // Cercle rouge
  final circlePaint = Paint()
    ..color = const Color(0xFFBA1A1A)
    ..style = PaintingStyle.fill;
  canvas.drawCircle(const Offset(48, 48), 48, circlePaint);

  // Chiffre blanc
  final textPainter = TextPainter(
    text: const TextSpan(
      text: '1',
      style: TextStyle(
        color: Colors.white,
        fontSize: 48,
        fontWeight: FontWeight.w700,
      ),
    ),
    textDirection: TextDirection.ltr,
  );
  textPainter.layout();
  textPainter.paint(canvas, const Offset(30, 20));

  final picture = recorder.endRecording();
  final img = await picture.toImage(96, 96);
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

  await File('assets/icons/notification_badge.png').writeAsBytes(
    byteData!.buffer.asUint8List(),
  );
  print('✓ notification_badge.png créé (96x96)');
}