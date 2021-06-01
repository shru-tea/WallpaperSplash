import 'package:wallpaper_app/model/category_model.dart';

// HARD CODED VALUES

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [];
  //1
  CategoryModel categoryModel = CategoryModel();
  categoryModel.categoryName = 'Tropical';
  categoryModel.categoryImageUrl =
      'https://images.pexels.com/photos/994605/pexels-photo-994605.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260';
  categories.add(categoryModel);

  //2
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Floral';
  categoryModel.categoryImageUrl =
      'https://images.pexels.com/photos/1037998/pexels-photo-1037998.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
  categories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Retro';
  categoryModel.categoryImageUrl =
      'https://images.pexels.com/photos/159613/ghettoblaster-radio-recorder-boombox-old-school-159613.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
  categories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Geometric';
  categoryModel.categoryImageUrl =
      'https://images.pexels.com/photos/430207/pexels-photo-430207.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
  categories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Neon Sign';
  categoryModel.categoryImageUrl =
      'https://images.pexels.com/photos/939962/pexels-photo-939962.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
  categories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Quotes';
  categoryModel.categoryImageUrl =
      'https://images.pexels.com/photos/5981818/pexels-photo-5981818.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
  categories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Street Art';
  categoryModel.categoryImageUrl =
      'https://images.pexels.com/photos/1647121/pexels-photo-1647121.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
  categories.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Minimalistic';
  categoryModel.categoryImageUrl =
      'https://images.pexels.com/photos/3028961/pexels-photo-3028961.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
  categories.add(categoryModel);

  return categories;
}
