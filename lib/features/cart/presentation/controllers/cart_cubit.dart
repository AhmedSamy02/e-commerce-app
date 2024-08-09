import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce/features/cart/data/models/cart.dart';
import 'package:simple_ecommerce/features/cart/domain/repositories/cart_repo.dart';
import 'package:simple_ecommerce/features/cart/domain/use_cases/get_cart_use_case.dart';
import 'package:simple_ecommerce/features/cart/domain/use_cases/update_cart_use_case.dart';
import 'package:simple_ecommerce/features/cart/presentation/controllers/cart_states.dart';
import 'package:simple_ecommerce/features/shop/data/models/product.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepository) : super(CartInitial());
  final CartRepository cartRepository;
  List<Cart> cartItems = [];
  Future<void> getCart() async {
    emit(CartLoading());
    final result = await GetCartUseCase(cartRepository: cartRepository).call();
    result.fold((failure) {
      emit(CartError(message: failure.message));
    }, (items) {
      cartItems = items;
      if (items.isEmpty) {
        emit(CartEmpty());
      } else {
        emit(CartLoaded(cart: items));
      }
    });
  }

  double computeTotalCost() {
    double totalCost = 0;
    for (final cart in cartItems) {
      totalCost += cart.product.price * cart.quantity;
    }
    return totalCost;
  }

  void removeCartItem(Cart cart) {
    cartItems.remove(cart);
    updateCartList();
    if (cartItems.isEmpty) {
      emit(CartEmpty());
    }

    emit(CartLoaded(cart: cartItems));
  }

  void changeQunatity(Cart cart, int quantity) {
    final index = cartItems.indexOf(cart);
    cartItems[index].quantity = quantity;
    updateCartList();
    emit(CartLoaded(cart: cartItems));
  }

  Future<void> addToCart(Product product, int quantity) async {
    final index =
        cartItems.indexWhere((element) => element.product.id == product.id);
    if (index != -1) {
      cartItems[index].quantity += quantity;
    } else {
      cartItems.add(Cart(product: product, quantity: 1));
    }
    updateCartList();
    emit(CartLoaded(cart: cartItems));
  }

  Future<void> updateCartList() async {
    await UpdateCartUseCase(cartRepository: cartRepository).call(cartItems);
  }
}
