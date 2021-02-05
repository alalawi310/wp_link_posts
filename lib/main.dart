import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wp_link_posts/fetchposts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textiTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'news app',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            color: Colors.deepOrange,
            textTheme: GoogleFonts.montserratTextTheme(textiTheme).copyWith(
                // ignore: deprecated_member_use
                title: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: Colors.white70, fontSize: 20),
                    fontWeight: FontWeight.w700))),
        textTheme: GoogleFonts.montserratTextTheme(textiTheme.copyWith(
            // ignore: deprecated_member_use
            body1: GoogleFonts.montserrat(fontSize: 18))),
        primarySwatch: Colors.amber,
      ),
      home: HomePage(),
      // initialRoute:HomePage.routeName,
      // routes: {
      //   HomePage.routeName : (BuildContext context) => HomePage(),
      //   DetalleDelPost.routeName: (BuildContext context) => DetalleDelPost(),
      // },
    );
  }
}

class HomePage extends StatelessWidget {
final  CategoryModel categoryModel = CategoryModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('news app'),
        actions: [],
      ),
      body: FutureBuilder(
        future: fetchcatposts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, int index) {
                var posts = snapshot.data;
                return Card(
                  child: Text(posts['date']),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
