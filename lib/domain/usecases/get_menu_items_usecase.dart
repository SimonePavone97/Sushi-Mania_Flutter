import 'package:sushi_restaurant_app/domain/entities/menu_item.dart';
import 'package:sushi_restaurant_app/domain/repositories/menu_repository.dart';

class GetMenuItemsUseCase {
  final MenuRepository _repository;

  GetMenuItemsUseCase(this._repository);

  Future<List<MenuItem>> execute() async {
    return _repository.getMenuItems();
  }
}
