import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/cart_item_model.dart';

class CartItem extends StatefulWidget {
  final CartItemModel cartItem;
  
  const CartItem({super.key, required this.cartItem});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.cartItem);
  }

  void updateQuantity(int quantity) {
    Provider.of<Cart>(context, listen: false)
        .updateQuantity(widget.cartItem, quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            widget.cartItem.product.imagePaths.first,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(widget.cartItem.product.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Размер: ${widget.cartItem.selectedSize}'),
            Text('${widget.cartItem.product.price} ₽ x ${widget.cartItem.quantity}'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () {
                updateQuantity(widget.cartItem.quantity - 1);
              },
            ),
            Text(
              '${widget.cartItem.quantity}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {
                updateQuantity(widget.cartItem.quantity + 1);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: removeItemFromCart,
            ),
          ],
        ),
      ),
    );
  }
}
