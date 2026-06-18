// C:\Users\openIT\StudioProjects\flutter_glyco_care\create_assets.dart
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  print('Création des assets placeholder...');

  // Créer le dossier images
  final imagesDir = Directory('assets/images');
  if (!await imagesDir.exists()) {
    await imagesDir.create(recursive: true);
    print('✓ Dossier assets/images créé');
  }

  // Créer les images placeholder
  await _createWelcomeIllustration();
  await _createDoctorIllustration();
  await _createAvatarPlaceholder();
  await _createLogo();

  print('✓ Tous les assets ont été créés avec succès!');
}

Future<void> _createWelcomeIllustration() async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder, const Rect.fromLTWH(0, 0, 576, 576));

  // Fond bleu clair
  final bgPaint = Paint()
    ..color = const Color(0xFFDBE1FF)
    ..style = PaintingStyle.fill;
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      const Rect.fromLTWH(20, 20, 536, 536),
      const Radius.circular(24),
    ),
    bgPaint,
  );

  // Cercle décoratif
  final circlePaint = Paint()
    ..color = const Color(0xFF004CCD).withOpacity(0.1)
    ..style = PaintingStyle.fill;
  canvas.drawCircle(const Offset(288, 220), 120, circlePaint);

  // Cœur médical
  final heartPaint = Paint()
    ..color = const Color(0xFF004CCD)
    ..style = PaintingStyle.fill
    ..strokeWidth = 3;

  final path = Path();
  path.moveTo(288, 380);
  path.cubicTo(288, 330, 240, 290, 240, 260);
  path.cubicTo(240, 240, 255, 225, 275, 245);
  path.cubicTo(282, 252, 288, 265, 288, 265);
  path.cubicTo(288, 265, 294, 252, 301, 245);
  path.cubicTo(321, 225, 336, 240, 336, 260);
  path.cubicTo(336, 290, 288, 330, 288, 380);
  canvas.drawPath(path, heartPaint);

  // Texte "Welcome"
  final textPainter = TextPainter(
    text: TextSpan(
      text: 'WELCOME',
      style: TextStyle(
        color: const Color(0xFF004CCD).withOpacity(0.3),
        fontSize: 48,
        fontWeight: FontWeight.w700,
      ),
    ),
    textDirection: TextDirection.ltr,
  );
  textPainter.layout();
  textPainter.paint(canvas, const Offset(180, 100));

  final picture = recorder.endRecording();
  final img = await picture.toImage(576, 576);
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

  await File('assets/images/welcome_illustration.png').writeAsBytes(
    byteData!.buffer.asUint8List(),
  );
  print('✓ welcome_illustration.png créé (576x576)');
}

Future<void> _createDoctorIllustration() async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder, const Rect.fromLTWH(0, 0, 800, 600));

  // Fond vert clair
  final bgPaint = Paint()
    ..color = const Color(0xFF92EFEE).withOpacity(0.2)
    ..style = PaintingStyle.fill;
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      const Rect.fromLTWH(20, 20, 760, 560),
      const Radius.circular(32),
    ),
    bgPaint,
  );

  // Silhouette de médecin (simplifiée)
  final doctorPaint = Paint()
    ..color = const Color(0xFF004CCD).withOpacity(0.3)
    ..style = PaintingStyle.fill;

  // Tête
  canvas.drawCircle(const Offset(400, 200), 60, doctorPaint);

  // Corps
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      const Rect.fromLTWH(350, 270, 100, 150),
      const Radius.circular(20),
    ),
    doctorPaint,
  );

  // Tablette
  final tabletPaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      const Rect.fromLTWH(420, 320, 120, 80),
      const Radius.circular(10),
    ),
    tabletPaint,
  );

  // Écran de la tablette (graphique)
  final screenPaint = Paint()
    ..color = const Color(0xFF004CCD).withOpacity(0.2)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  for (int i = 0; i < 5; i++) {
    canvas.drawLine(
      Offset(430, 350 + i * 10.0),
      Offset(520, 350 + i * 10.0),
      screenPaint,
    );
  }

  final picture = recorder.endRecording();
  final img = await picture.toImage(800, 600);
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

  await File('assets/images/doctor_illustration.png').writeAsBytes(
    byteData!.buffer.asUint8List(),
  );
  print('✓ doctor_illustration.png créé (800x600)');
}

Future<void> _createAvatarPlaceholder() async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder, const Rect.fromLTWH(0, 0, 200, 200));

  // Cercle de fond
  final bgPaint = Paint()
    ..color = const Color(0xFFDBE1FF)
    ..style = PaintingStyle.fill;
  canvas.drawCircle(const Offset(100, 100), 100, bgPaint);

  // Tête
  final headPaint = Paint()
    ..color = const Color(0xFF004CCD).withOpacity(0.5)
    ..style = PaintingStyle.fill;
  canvas.drawCircle(const Offset(100, 70), 30, headPaint);

  // Corps
  final bodyPaint = Paint()
    ..color = const Color(0xFF004CCD).withOpacity(0.5)
    ..style = PaintingStyle.fill;
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      const Rect.fromLTWH(60, 110, 80, 80),
      const Radius.circular(20),
    ),
    bodyPaint,
  );

  // Bordure cercle
  final borderPaint = Paint()
    ..color = const Color(0xFF004CCD).withOpacity(0.2)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;
  canvas.drawCircle(const Offset(100, 100), 98, borderPaint);

  final picture = recorder.endRecording();
  final img = await picture.toImage(200, 200);
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

  await File('assets/images/avatar_placeholder.png').writeAsBytes(
    byteData!.buffer.asUint8List(),
  );
  print('✓ avatar_placeholder.png créé (200x200)');
}

Future<void> _createLogo() async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder, const Rect.fromLTWH(0, 0, 512, 512));

  // Cercle de fond
  final bgPaint = Paint()
    ..color = const Color(0xFF004CCD)
    ..style = PaintingStyle.fill;
  canvas.drawCircle(const Offset(256, 256), 180, bgPaint);

  // Croix médicale blanche
  final crossPaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;

  // Barre verticale
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      const Rect.fromLTWH(236, 170, 40, 172),
      const Radius.circular(10),
    ),
    crossPaint,
  );

  // Barre horizontale
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      const Rect.fromLTWH(170, 236, 172, 40),
      const Radius.circular(10),
    ),
    crossPaint,
  );

  final picture = recorder.endRecording();
  final img = await picture.toImage(512, 512);
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

  await File('assets/images/logo.png').writeAsBytes(
    byteData!.buffer.asUint8List(),
  );
  print('✓ logo.png créé (512x512)');
}