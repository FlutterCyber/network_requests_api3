import 'package:flutter/material.dart';
import 'package:untitled1/services/http_service.dart';

import '../model/post_model.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String data;

  void _apiPostList() {
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
          print(response),
          _showResponse(response!),
        });
  }

  void _apiCreatePost(Post post1) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(post1))
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _apiUpdatePost(Post post1) {
    Network.PUT(Network.API_UPDATE + post1.id.toString(),
            Network.paramsUpdate(post1))
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _apiDeletePost(Post post1) {
    Network.DELETE(
            Network.API_DELETE + post1.id.toString(), Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _showResponse(String response) {
    setState(() {
      data = response;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var post = new Post(id: 1, title: "Birnimala", body: "Talim", userId: 1);
    _apiDeletePost(post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data != null ? data : "No data"),
      ),
    );
  }
}
