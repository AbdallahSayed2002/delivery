import 'package:delivery/core/constant/const_image.dart';
import 'package:delivery/data/model/categories_model.dart';
import 'package:delivery/data/model/items_model.dart';
import '../../model/onboarding_model.dart';

List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(AppImageAssets.onBoardingImageOneTop, AppImageAssets.onBoardingImageOne, 'Purchase Online !!', 'Lorem ipsum dolor sit amet, consectetur adipiscing,\n sed do eiusmod tempor ut labore'),
    OnBoardingModel(AppImageAssets.onBoardingImageTwoTop, AppImageAssets.onBoardingImageTwo, 'Track order !!', 'Lorem ipsum dolor sit amet, consectetur adipiscing,\n sed do eiusmod tempor ut labore'),
    OnBoardingModel(AppImageAssets.onBoardingImageThreeTop, AppImageAssets.onBoardingImageThree, 'Get your order !!', 'Lorem ipsum dolor sit amet, consectetur adipiscing,\n sed do eiusmod tempor ut labore'),
];
//==================================== Categories =================================
List<CategoriesModel> categoriesList = [
    CategoriesModel(AppImageAssets.mobile,"mobile"),
    CategoriesModel(AppImageAssets.laptop,"laptop"),
    CategoriesModel(AppImageAssets.camera,"camera"),
    CategoriesModel(AppImageAssets.shoes,"shoes"),
    CategoriesModel(AppImageAssets.dress,"dress"),
];
//==================================== items =================================
List<ItemsModel> itemsList = [
    ItemsModel(id:1, image : [AppImageAssets.mobileImage],name: "Iphone X",title: "Mobile Iphone X",price: 60.0,type: "mobile",dec: "Catapult your creativity to the next level with the ultra-powerful Galaxy Book4 Ultra. This laptop provides ultimate power for your most intense processing needs, along with a stunning display.",numberOfItem: 9,rating: 4),
    ItemsModel(id:2, image:  [AppImageAssets.laptopImage, AppImageAssets.laptopImage2, AppImageAssets.laptopImage3],name: "Samsung",title: "Laptop Samsung T650",price: 199.99,type: "laptop",dec: "Catapult your creativity to the next level with the ultra-powerful Galaxy Book4 Ultra. This laptop provides ultimate power for your most intense processing needs, along with a stunning display.",numberOfItem: 5,rating: 3),
    ItemsModel(id:3, image : [AppImageAssets.laptopImage4],name: "Asus",title: "Laptop Asus GT420",price: 149.99,type: "laptop",dec: "Catapult your creativity to the next level with the ultra-powerful Galaxy Book4 Ultra. This laptop provides ultimate power for your most intense processing needs, along with a stunning display.",numberOfItem: 3,rating: 5),
    ItemsModel(id:4, image : [AppImageAssets.cameraImage],name: "Cano",title: "Camera Cano M50",price: 55.0,type: "camera",dec: "Catapult your creativity to the next level with the ultra-powerful Galaxy Book4 Ultra. This laptop provides ultimate power for your most intense processing needs, along with a stunning display.",numberOfItem: 5,rating: 5),
    ItemsModel(id:5, image : [AppImageAssets.shoesImage],name: "Nike",title: "Sport Shoes Nike ",price: 19.99,type: "shoes",dec: "Catapult your creativity to the next level with the ultra-powerful Galaxy Book4 Ultra. This laptop provides ultimate power for your most intense processing needs, along with a stunning display.",numberOfItem: 3,rating: 2),
    ItemsModel(id:6, image : [AppImageAssets.dressImage],name: "Ruffle prom",title: "Dress Ruffle prom blue",price: 1200.0,type: "dress",dec: "Catapult your creativity to the next level with the ultra-powerful Galaxy Book4 Ultra. This laptop provides ultimate power for your most intense processing needs, along with a stunning display.",numberOfItem: 3,rating: 4),
];