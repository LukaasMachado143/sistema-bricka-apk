import 'package:dio/dio.dart';
import '../widgets/brk_snackbar.dart';

class ApiErrorHelper {
  static void handle(
    Object error, {
    String defaultMessage = 'Erro inesperado',
  }) {
    if (error is DioException) {
      final handled = error.requestOptions.extra['handled'] == true;

      if (!handled) {
        BrkSnackbar.error(defaultMessage);
      }
    } else {
      BrkSnackbar.error(defaultMessage);
    }
    print('API ERROR: $error');
  }
}
