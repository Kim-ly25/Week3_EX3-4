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
  // Sample products
  var Pizza = Product('Pizza', 8.5);
  var Chicken = Product('Chicken', 5.0);
  var COCA = Product('COCA', 1.2);

  // Sample order items
  var item1 = OrderItem(Pizza, 4);
  var item2 = OrderItem(Chicken, 2);
  var item3 = OrderItem(COCA, 3);

  // Create an order (delivery)
  var order1 = Order(
    items: [item1, item2, item3],
    deliveryType: DeliveryType.delivery, 
    address: "Phnom Penh, Cambodia",
  );

  // Output
  print("Delivery Method: ${order1.deliveryType.name}");
  print("Delivery Address: ${order1.address}");
  order1.printInvoice();
}