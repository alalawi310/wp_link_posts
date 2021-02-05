import 'package:ai_awesome_message/ai_awesome_message.dart';
import 'package:flutter/material.dart';

class DetalleDelPost extends StatelessWidget {
  static const routeName = 'detalle';

  @override
  Widget build(BuildContext context) {
    Map post = ModalRoute.of(context).settings.arguments as Map;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),
              Divider(),
              Divider(),
              Divider(),
              Text(post['title']['rendered']),
              IconButton(icon: Icon(Icons.home), onPressed: (){
                Navigator.push(
                  context,
                  AwesomeMessageRoute(
                    awesomeMessage: AwesomeHelper.createAwesome(
                        title: post['title']['rendered'], message: post['date']),
                    theme: Theme.of(context),
                    settings: RouteSettings(name: "/home"),
                  ),
                );

              }),
              Text(post['content']['rendered']),
            ],
          ),
        ),
      );
  }
}
