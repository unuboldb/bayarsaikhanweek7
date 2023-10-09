import 'item.dart';

class GlobalItems {
  static final GlobalItems _item = GlobalItems._instance();

  factory GlobalItems() {
    return _item;
  }
  GlobalItems._instance();

  List<Item> items = [
    Item(1, "iPhone 13", "6.1-inch"),
    Item(2, "iPhone 13 Mini", "5.4-inch"),
    Item(3, "iPhone 13 Pro", "6.1-inch"),
    Item(4, "iPhone 13 Pro Max", "6.7-inch"),
    Item(5, "iPhone SE", "4.7-inch"),
    Item(6, "iPhone 12", "6.1-inch"),
    Item(7, "iPhone 12 Mini", "5.4-inch"),
    Item(8, "iPhone 12 Pro", "6.1-inch"),
    Item(9, "iPhone 12 Pro Max", "6.7-inch"),
    Item(10, "iPhone 11", "6.1-inch"),
  ];
}
