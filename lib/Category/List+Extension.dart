

extension ZDList on List{

  /*
  *   是否包含子数组
  * */
  bool isContains(List _subList) {
    for (var value in _subList) {
      if (this.contains(value) == false) {
        return false;
      }
    }
    return true;
  }
}

abstract class  Base {

  final double price;

  double getDiscount();

  Base({required this.price});

}

mixin cc on Base {

  double getDiscount() {
    if (this.price > 100) {
      return this.price - 20;
    }
    return this.price;
  }

}

mixin dd on Base {

  double getDiscount() {
    if (this.price > 100) {
      return this.price * 0.8;
    }
    return this.price;
  }
}

mixin ee {

  static String getShowText(double price) {
    price = price * 100;
    print(price.truncateToDouble());
    return '${price.truncateToDouble()/100.0}';
  }

}

class B extends Base {

  B({required double price}) : super(price: price);

  @override
  double getDiscount() {
    // TODO: implement getDiscount
    //throw UnimplementedError();
    return 10;
  }
}

abstract class MyFactory {

   Base createBase();

}

class Strategy {

  Base? _base;

  Base init(MyFactory myFactory) {
    this._base = myFactory.createBase();
    return this._base!;
  }


}


class A extends Base with  cc ,dd , ee {

  A({required double price}) : super(price: price);

  static String test() {
    return ee.getShowText(120.5698);
  }

}
