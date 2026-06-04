import 'package:find/features/products/product.dart';
import 'package:find/features/sale/model/sale_item.dart';
import 'features/due/customer_due.dart';


List<Product> products = [
  Product(code: 'TS001-L', name: 'টি-শার্ট', variant: 'L', buyPrice: 320, sellPrice: 450, stock: 12),
  Product(code: 'RC010', name: 'চাল', variant: '5kg', buyPrice: 340, sellPrice: 390, stock: 8),
  Product(code: 'CH05', name: 'চার্জার', variant: 'Type-C', buyPrice: 230, sellPrice: 320, stock: 3),
  Product(code: 'CR007', name: 'ক্রিম', variant: '50ml', buyPrice: 130, sellPrice: 180, stock: 15),
];

Map<String, List<SaleItem>> dailySales = {
  '2026-05-12': [
    SaleItem(code: 'TS001-L', name: 'টি-শার্ট', qty: 2, total: 900, profit: 260),
    SaleItem(code: 'CH05', name: 'চার্জার', qty: 1, total: 320, profit: 90),
    SaleItem(code: 'RC010', name: 'চাল', qty: 1, total: 390, profit: 50),
  ],
  '2026-05-13': [
    SaleItem(code: 'CR007', name: 'ক্রিম', qty: 3, total: 540, profit: 150),
    SaleItem(code: 'RC010', name: 'চাল', qty: 2, total: 780, profit: 100),
  ],
  '2026-05-14': [
    SaleItem(code: 'TS001-L', name: 'টি-শার্ট', qty: 1, total: 450, profit: 130),
    SaleItem(code: 'CH05', name: 'চার্জার', qty: 2, total: 640, profit: 180),
  ],
};

List<CustomerDue> dueCustomers = [
  CustomerDue(name: 'রহিম', phone: '01712-000000', due: 1250),
  CustomerDue(name: 'করিম', phone: '01822-000000', due: 680),
  CustomerDue(name: 'সুমন', phone: '01933-000000', due: 420),
];