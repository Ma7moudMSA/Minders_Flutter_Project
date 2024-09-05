import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moviemania/screen/login.dart';
import '../Widgets/MovieSlider.dart';
import '../Widgets/TrendingMovies.dart';
import '../Widgets/footer.dart';


bool backgroundColor = true; // 1 for dark theme, 0 for light theme
bool isitdark = false;

Widget buildIcon() {
  return backgroundColor == isitdark
      ? Icon(Icons.dark_mode, color: Colors.white,)
      : Icon(Icons.dark_mode, color: Colors.black45);
}




class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MovieMania",
      themeMode: backgroundColor == isitdark ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black38, useMaterial3: true,
      ),

      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(child: Text("Moviemania")),
          leading: GestureDetector(

            onTap: () {
              setState(() {
                isitdark = !isitdark;
              });
            },
            child: buildIcon(),

          ),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
            }, icon: Icon(Icons.output)),
          ],
        ),
        body: SingleChildScrollView(

          physics: const BouncingScrollPhysics(),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Trending"),
              ),
              SizedBox(
                height: 3,
              ),
              TrendingMovies(),
              SizedBox(height: 32,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Comedy"),
              ),
              MovieSlider(),
              SizedBox(height: 32,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Sci-fi"),
              ),
              MovieSlider(),
              SizedBox(height: 32,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Horror"),
              ),
              MovieSlider(),


            ],
          ),
        ),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}


