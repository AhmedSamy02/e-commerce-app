import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

const kAuthMainLink = 'http://10.0.2.2:3000/auth';
final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
    colors: true,
    printEmojis: true,
  ),
);
final getit = GetIt.instance;