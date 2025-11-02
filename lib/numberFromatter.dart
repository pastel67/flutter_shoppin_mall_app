import 'package:intl/intl.dart';

class PriceFormatter{

  PriceFormatter(this.productPrice);

  int productPrice;

  String  priceFormat() {
    String formattedPrice = NumberFormat.decimalPattern().format(productPrice); 
    return formattedPrice;
  }
}