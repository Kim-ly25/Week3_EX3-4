enum DeliveryType { delivery, pickup }

class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}

class OrderItem {
  final Product product;
  final int quantity;

  OrderItem(this.product, this.quantity);
  double get totalPrice => product.price * quantity;
}

class Order {
  final List<OrderItem> items;
  final DeliveryType deliveryType;
  final String? address;

  Order({required this.items, required this.deliveryType, this.address});

  void printInvoice() {
    print("No  Product         Qty       Price       Total");
    for (int i = 0; i < items.length; i++) {
      var item = items[i];
      print(
          "${i + 1}   ${item.product.name.padRight(14)} ${item.quantity.toString().padLeft(3)}  ${item.product.price.toStringAsFixed(2).padLeft(10)}\$  ${item.totalPrice.toStringAsFixed(2).padLeft(10)}\$");
    }
    if (deliveryType == DeliveryType.delivery) {
      print("====");
      print("Delivery: \$1.50");
    }
    print("====");
    print("TOTAL_Amount: \$${totalAmount.toStringAsFixed(2)}");
  }

  double get totalAmount {
    double total = 0;
    for (var item in items) {
      total += item.totalPrice;
    }
    return total;
  }
}
void main() {

  var Pizza = Product('Pizza', 8.5);
  var Chicken = Product('Chicken', 5.0);
  var COCA = Product('COCA', 1.2);

  // order items for Order 1 (Delivery)
  var item1 = OrderItem(Pizza, 4);
  var item2 = OrderItem(Chicken, 2);
  var item3 = OrderItem(COCA, 3);

  var order1 = Order(
    items: [item1, item2, item3],
    deliveryType: DeliveryType.delivery,
    address: "Phnom Penh, Cambodia",
  );

  // order items for Order 2 (Pickup)
  var item4 = OrderItem(Pizza, 1);
  var item5 = OrderItem(COCA, 2);

  var order2 = Order(
    items: [item4, item5],
    deliveryType: DeliveryType.pickup,  // No address needed for pickup
  );

  // Order 1
  print("=== ORDER 1 ===");
  print("Delivery Method: ${order1.deliveryType.name}");
  print("Delivery Address: ${order1.address}");
  order1.printInvoice();

  print("\n=== ORDER 2 ===");
  // Order 2
  print("Delivery Method: ${order2.deliveryType.name}");
  print("Delivery Address: ${order2.address ?? 'No address (pickup)'}");
  order2.printInvoice();
}
