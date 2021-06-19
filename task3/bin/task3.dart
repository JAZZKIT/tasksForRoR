import 'dart:io';
import 'dart:math';

int sum = 50;
int maxResult = 0;
var bag;

class Town {
  List<String> good = ['salt', 'fish', 'cloth', 'copper', 'furs'];
  Map<String, int> goods = {};
  bool visitStatus = false;

  void createPriceList() {}

  void buySupply(String city) {
    var lowPrice = goods.values.reduce(min);
    var ourGood =
        goods.keys.firstWhere((k) => goods[k] == lowPrice, orElse: () => '');
    sum >= lowPrice
        ? sum -= lowPrice
        : print('Sorry, you don\' have enough money');
    bag = ourGood;
    print('Buy $ourGood for $lowPrice coins in $city. $sum coins left.');
    visitStatus = true;
  }

  void sellSupply(String city) {
    var profit = goods[bag];
    sum += profit!;
    print('Sell $bag for $profit coins in $city. $sum coins left');
    bag = '';
  }
}

class Lubeck extends Town {
  final List<int> _price = [20, 50, 60, 36, 96];
  final String city = 'Lubeck';

  @override
  void createPriceList() {
    goods = Map<String, int>.fromIterables(good, _price);
    //print(goods);
  }
}

class Reval extends Town {
  final List<int> _price = [35, 50, 40, 60, 45];
  final String city = 'Reval';

  @override
  void createPriceList() {
    goods = Map<String, int>.fromIterables(good, _price);
    print(sum);
  }
}

class Bergen extends Town {
  final List<int> _price = [62, 15, 18, 82, 54];
  final String city = 'Bergen';

  @override
  void createPriceList() {
    goods = Map<String, int>.fromIterables(good, _price);
  }
}

void main(List<String> arguments) {
  //I'm terrible sorry for this code, but dart with new NullSafty broked the library which I'd used before.
  var options = <String>['LRB', 'LBR', 'RLB', 'RBL', 'BLR', 'BRL'];
  Lubeck lubeck = Lubeck();
  lubeck.createPriceList();
  Reval reval = Reval();
  reval.createPriceList();
  Bergen bergen = Bergen();
  bergen.createPriceList();
  for (var i = 0; i < 6; i++) {
    print('Run ${i + 1}');
    switch (options[i]) {
      case 'LRB':
        {
          lubeck.buySupply(lubeck.city);
          reval.sellSupply(reval.city);
          reval.buySupply(reval.city);
          bergen.sellSupply(bergen.city);
          print('Final coins: $sum\n');
          sum > maxResult ? maxResult = sum : maxResult = maxResult;
          sum = 50;
        }
        break;

      case 'LBR':
        {
          lubeck.buySupply(lubeck.city);
          bergen.sellSupply(bergen.city);
          bergen.buySupply(bergen.city);
          reval.sellSupply(reval.city);
          print('Final coins: $sum\n');
          sum > maxResult ? maxResult = sum : maxResult = maxResult;
          sum = 50;
        }
        break;

      case 'RLB':
        {
          reval.buySupply(reval.city);
          lubeck.sellSupply(lubeck.city);
          lubeck.buySupply(lubeck.city);
          bergen.sellSupply(bergen.city);
          print('Final coins: $sum\n');
          sum > maxResult ? maxResult = sum : maxResult = maxResult;
          sum = 50;
        }
        break;

      case 'RBL':
        {
          reval.buySupply(reval.city);
          bergen.sellSupply(bergen.city);
          bergen.buySupply(bergen.city);
          lubeck.sellSupply(lubeck.city);
          print('Final coins: $sum\n');
          sum > maxResult ? maxResult = sum : maxResult = maxResult;
          sum = 50;
        }
        break;

      case 'BLR':
        {
          bergen.buySupply(bergen.city);
          lubeck.sellSupply(lubeck.city);
          lubeck.buySupply(lubeck.city);
          reval.sellSupply(reval.city);
          print('Final coins: $sum\n');
          sum > maxResult ? maxResult = sum : maxResult = maxResult;
          sum = 50;
        }
        break;

      case 'BRL':
        {
          bergen.buySupply(bergen.city);
          reval.sellSupply(reval.city);
          reval.buySupply(reval.city);
          lubeck.sellSupply(lubeck.city);
          print('Final coins: $sum\n');
          sum > maxResult ? maxResult = sum : maxResult = maxResult;
          sum = 50;
        }
        break;
      default:
        {
          print('Invalid choice');
        }
        break;
    }
    print('Max Result: $maxResult');
  }
}
