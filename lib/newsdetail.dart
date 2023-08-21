import 'package:flutter/material.dart';
import 'package:newsread/models/article.dart';
class Newsdetail extends StatelessWidget {
  final Article article;
   Newsdetail({required this.article}) ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("News Details"),

        ),

      body: ListView(
        shrinkWrap: true,
          children: [
            SizedBox(height: 25.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                  article.title.toString(),
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      )
              ),
            ),

            Container(
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(article.urlToImage.toString())
                  )
              ),

            ),

            Padding(
              padding: const EdgeInsets.only(left:20,right: 20,top: 4),
              child: Text( article.description.toString(),style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,)),
            ),




          ]
      ),


    );
  }
}
