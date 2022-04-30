import 'package:flutter/foundation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/helper/data.dart';
import 'package:flutternews/helper/news.dart';
import 'package:flutternews/models/article_model.dart';
import 'package:flutternews/models/category_model.dart';
import 'package:flutternews/views/article_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
    //yo garnu ra List<CategoryModel> ko object nabanai , List<CategoryModel> categories = getCategories(); garnu eutai ho
  }

  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading =false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text('Flutter',style: TextStyle(color: Colors.black),),
           Text('News',style: TextStyle(color: Colors.blue),)
         ],
       ),
       backgroundColor: Colors.white,
       elevation: 0.0,
     ),
     body:_loading? Center(
       child: Container(
         child: CircularProgressIndicator(),
       ),
     ):
      SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
         child: Column(
           children: [
             ///Categories
             Container(
               //padding: EdgeInsets.symmetric(horizontal: 16),
               height: 100,
               child: ListView.builder(
                 itemCount: categories.length,
                 shrinkWrap: true,
                 scrollDirection: Axis.horizontal,
                 itemBuilder: ((context, index) => CategoryTile(
                              imageUrl: categories[index].imageUrl,
                              categoryName: categories[index].categoryName,
                            )),
                      ),
                    ),

            // mathi ko ra yo eutai ho
            //  itemBuilder: (context, index){
            //        return CategoryTile(imageUrl : categories[index].imageUrl, categoryName : categories[index].categoryName);
            //        //CategoryTile Consists two arguments as defined below in CategoryTile widget
            //      }),
            //  ),
                   
      
              //Blogs
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(), //yo vaena vani scroll nai hudaina
                // scrollDirection: Axis.vertical, 
                  itemBuilder: (context, index)
                  {
                    return BlogTile(
                      imageUrl: articles[index].urlToImage,
                      title: articles[index].title,
                      desc: articles[index].description,
                      url: articles[index].url,
                    
                    );
                  }),
              )
           ],
         ),
           ),
      ),
    );
  }
}
class CategoryTile extends StatelessWidget {

  CategoryTile({this.imageUrl,this.categoryName});
  //yo ra yo tala ko garnu eutai ho ... tala ko stf extend garda afai aako ho .. mathi ko ease ko lagi banako maile
  // const CategoryTile({Key? key, this.imageUrl, this.categoryName})
 // : super(key: key);

  final imageUrl, categoryName;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl:imageUrl, width: 120,height: 70,fit: BoxFit.cover,)),
              // child: Image.network(imageUrl, width: 120,height: 70,fit: BoxFit.cover,)), //without using cached image
            Container(
              alignment: Alignment.center,
              width: 120, height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6), 
                color: Colors.black26,
              ),
              
              child: Text(categoryName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
            )
          ],
        ),  
      ),
    );
  }
}

class BlogTile extends StatelessWidget {

  final imageUrl , title, desc,url;
  const BlogTile({ Key? key ,@required this.imageUrl,@required this.title ,@required this.desc,@required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         Navigator.push(context, MaterialPageRoute(
           builder: (context)=> ArticleView(
             blogUrl: url,
           )
           ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl)),
            SizedBox(height: 15,),
            Text(title,style: TextStyle(fontSize: 20,),),
            Text(desc,style: TextStyle(color: Colors.black38),)
          ],
        ),      
      ),
    );
  }
}