import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

const kAuthMainLink = 'http://10.0.2.2:3000/auth';
const kMainLink = 'http://10.0.2.2:3000/';
const kProductsLink = 'https://api.escuelajs.co/api/v1';
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
const kShopBox = 'products';
const kCartBox = 'cart';
