import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app.dart';

import 'package:dlive/utils/host_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HostProvider>(
          create: (_) => HostProvider(),
        ),
      ],
      child: DLive(),
    )
  );

  if (Platform.isMacOS) {
    final windowManager = WindowManager.instance;
    windowManager.setMinimumSize(const Size(1650, 1600));
    windowManager.setMaximumSize(const Size(1650, 1600));
  }
}
