import 'package:camara_ui/UIs/Scan/camara_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

late List<CameraDescription> _cameras;

List<CameraDescription> getCameras() {
  return _cameras;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CameraController? _cameracontroller;

  Future<void> splitCamera({required bool frontcamera}) async {
    _cameracontroller =
        CameraController(_cameras[(frontcamera) ? 1 : 0], ResolutionPreset.max);
    _cameracontroller!.initialize().then((_) {  
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (_cameras.isNotEmpty) {
      splitCamera(frontcamera: true);
    }
  }

  @override
  void dispose() {
    if (_cameracontroller != null) {
      _cameracontroller!.dispose();
    }
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 28, 39, 76)),
          useMaterial3: true,
        ),
        home: Camara_Screen(
          cameraController: _cameracontroller!,
          changeCamera: splitCamera,
        ));
  }
}
