import 'package:sushi_restaurant_app/domain/entities/menu_item.dart';

abstract class MenuRepository {
  Future<List<MenuItem>> getMenuItems();
}
