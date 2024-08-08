import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:simple_ecommerce/core/constants/values.dart';
import 'package:simple_ecommerce/core/errors/unexpected_failure.dart';
import 'package:simple_ecommerce/features/shop/data/models/product.dart';
import 'package:simple_ecommerce/features/shop/domain/repositories/shop_repo.dart';
import 'package:simple_ecommerce/features/shop/domain/use_cases/get_products_use_case.dart';
import 'package:simple_ecommerce/features/shop/presentation/controllers/shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());
  static const _pageSize = 15;
  final PagingController<int, Product> pagingController =
      PagingController(firstPageKey: 0);
  Future<void> initializePaging() async {
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
  }

  Future<void> fetchPage(int pageKey) async {
    final response =
        await GetProductsUseCase(repository: getit.get<ShopRepository>())
            .call(pageKey, _pageSize);
    response.fold((failure) {
      if (failure is UnexpectedFailure) {
        logger.e(failure.message);
      }
      pagingController.error = failure.message;
    }, (newItems) {
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        pagingController.appendPage(newItems, nextPageKey);
      }
    });
  }
}
