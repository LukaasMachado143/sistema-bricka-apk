import 'package:apk/core/navigation/app_navigation.dart';
import 'package:apk/core/widgets/brk_snackbar.dart';
import 'package:dio/dio.dart';
import '../storage/local_storage.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await LocalStorage.getToken();

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    options.headers['x-platform'] = 'APK';

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final status = err.response?.statusCode;

    if (status == 403) {
      BrkSnackbar.info('Você não tem acesso a esse recurso');
      err.requestOptions.extra['handled'] = true;
      AppNavigator.goToLogin();
    }

    if (status == 401) {
      BrkSnackbar.warning('Sessão expirada');
      await LocalStorage.clearToken();
      err.requestOptions.extra['handled'] = true;
      AppNavigator.goToLogin();
    }

    return handler.next(err);
  }
}
