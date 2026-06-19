// lib/main.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Forcer Google Fonts à utiliser le fichier local si disponible
  GoogleFonts.config.allowRuntimeFetching = false;

  runApp(const GlycoCareApp());
}