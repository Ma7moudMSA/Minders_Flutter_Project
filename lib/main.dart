import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'footer.dart';

bool backgroundColor = true; // 1 for dark theme, 0 for light theme
bool isitdark = false;

Widget buildIcon() {
  return backgroundColor == isitdark
      ? Icon(Icons.dark_mode, color: Colors.white)
      : Icon(Icons.dark_mode, color: Colors.black45);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> genres=[
    'horror',
    'sci-fi',
    'thrillers',
    'animated',
    'romance'

  ];

  @override
  Widget build(BuildContext context) {
    //hena al this beydy error ma3rf4 leh
   // TabController _tabController = TabController(length: 3, vsync: this);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MovieMania",
      themeMode: backgroundColor == isitdark ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black38, useMaterial3: true),

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
              print('Icon tapped!');
            },
            child: buildIcon(),
          ),
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
              SizedBox(
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: 10,
                  itemBuilder: (context, itemIndex, pageViewIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: 300,
                        width: 200,
                        color: Colors.yellow,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    //aspectRatio: 16/9
                    height: 300,
                    autoPlay: true,
                    viewportFraction: 0.55,
                    enlargeCenterPage: true,
                    pageSnapping: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                  ),
                ),
              ),
              SizedBox(height: 32,),
             Text("Comedy"),
             SizedBox(
               height: 200,
               width:double.infinity ,
               child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                 physics: BouncingScrollPhysics(),
                 itemCount: 8,
                 itemBuilder: (context,index){
                   return Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: ClipRRect(
                         borderRadius: BorderRadius.circular(8),
                         child: Container(color:Colors.yellow ,height: 200,width:200 )),
                   );
                 },

               ),
             ),
              SizedBox(height: 32,),
              Text("sci-fi"),
             SizedBox(
               height: 200,
               width:double.infinity ,
               child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                 physics: BouncingScrollPhysics(),
                 itemCount: 8,
                 itemBuilder: (context,index){
                   return Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: ClipRRect(
                         borderRadius: BorderRadius.circular(8),
                         child: Container(color:Colors.yellow ,height: 200,width:200 )),
                   );
                 },

               ),
             ),
              SizedBox(height: 32,),
              Text("horror"),
             SizedBox(
               height: 200,
               width:double.infinity ,
               child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                 physics: BouncingScrollPhysics(),
                 itemCount: 8,
                 itemBuilder: (context,index){
                   return Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(8),
                         child: Container(color:Colors.yellow ,height: 200,width:200, )),
                   );
                 },

               ),
             ),

             //m4 3ayza tozbot fe mo4kela fe tabcontroller
             /** Container(
                child: TabBar(controller: _tabController, tabs: [Text("data"),Text("data1"),Text("data2")]),
              ),
              Container(
                child: TabBarView(controller: _tabController, children: [Text("data"),Text("data1"),Text("data2")]),
              )

              **/

        ],
        ),
    ),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}
