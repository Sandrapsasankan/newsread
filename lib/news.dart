import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsread/Api.dart';
import 'package:newsread/models/article.dart';
import 'package:newsread/newsdetail.dart';
class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
        title: Text("Daily News"),

        ),


      body: FutureBuilder<List<Article>>(
          future: client.getArticle(),
          builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(

                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    var articles=snapshot.data![index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (content)=>Newsdetail(article:articles)));
                      },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child:  Row(
                  children: [
                    Expanded(child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                  image: DecorationImage(
                  image: NetworkImage(snapshot.data![index].urlToImage.toString())
                  )
                  ),

                              ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Column(

                                        children:[
                                          Text(
                                            snapshot.data![index].title.toString(),
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 20,),
                                          Text(
                                          snapshot.data![index].publishedAt.toString(),
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),

                                        ]
                                    ), )
                  ],
                )


              ),
            ),
          );

        });
  }
            return Center(
              child: CircularProgressIndicator(),
            );
        }

      ),

    );
  }
}
