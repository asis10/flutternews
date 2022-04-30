import 'package:flutternews/models/category_model.dart';
import 'package:flutter/material.dart';

List<CategoryModel> getCategories() 
{
  List<CategoryModel> category =  <CategoryModel>[];
  CategoryModel categoryModel = new CategoryModel();

  // 1
  categoryModel.categoryName = "Music";
  categoryModel.imageUrl = "https://static1.colliderimages.com/wordpress/wp-content/uploads/2022/02/michael-jackson.jpg";
  category.add(categoryModel);

  //2
  categoryModel =  CategoryModel();
  categoryModel.categoryName = "Football";
  categoryModel.imageUrl="https://editorial.uefa.com/resources/026c-12f705c46a6c-9f2eb0579483-1000/format/wide1/messi_graphic.jpg";
  category.add(categoryModel);

  
  //3
  categoryModel = CategoryModel();
  categoryModel.categoryName="Science";
  categoryModel.imageUrl="https://starwalk.space/gallery/images/full-moon-january/1920x1080.jpg";
  category.add(categoryModel);

  //4
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Art";
  categoryModel.imageUrl="https://www.theartist.me/wp-content/uploads/2015/07/The-Starry-Night.jpg";
  category.add(categoryModel);

  //5
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imageUrl="https://www.incimages.com/uploaded_files/image/1920x1080/getty_180152187_970679970450042_64007.jpg";
  category.add(categoryModel);

  //6
  categoryModel = CategoryModel();
  categoryModel.categoryName="Series";
  categoryModel.imageUrl="https://m.media-amazon.com/images/M/MV5BZDc2NTg5YWUtZGZlZC00Y2VmLTgwZjEtZDUxM2QyNGRmYjZlXkEyXkFqcGdeQWFybm8@._V1_QL75_UX500_CR0,0,500,281_.jpg";
  category.add(categoryModel);

   return category;
}