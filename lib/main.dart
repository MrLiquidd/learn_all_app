import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'core/di/app_component/app_component.dart';
import 'lear_all_app.dart';
import 'utils/services/firebase/firebase_options.dart';
import 'utils/services/hive/main_box.dart';

void main() async {
  // await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  await MainBoxMixin.initHive('');
  await initAppComponentLocator();
  runApp(const LearnAllApp());
}

