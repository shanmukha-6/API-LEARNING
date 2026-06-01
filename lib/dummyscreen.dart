import 'dart:convert';
import 'package:api_learning/ApiModels/MoonModal.dart';
import 'package:api_learning/apiservices.dart';
import 'package:flutter/material.dart';

class Dummyscreen extends StatefulWidget {
  Dummyscreen({Key? key}) : super(key: key);

  @override
  _DummyscreenState createState() => _DummyscreenState();
}

class _DummyscreenState extends State<Dummyscreen> {
  MoonModel? dummy;
  Future<void> funny() async {
    try {
      final body = await Apiservices().flutter();
      if (body == null) return;
      final json = jsonDecode(body as String) as Map<String, dynamic>;
      setState(() {
        dummy = MoonModel.fromJson(json);
      });
    } catch (e) {
      debugPrint("Exception.$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: funny, child: Text("hi")),
          if (dummy != null)
            Card(
              color: Colors.pink,
              child: Column(
                children: [
                  Text(
                    "${dummy!.id}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    "${dummy!.title}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    "${dummy!.description}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    "${dummy!.category}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    "${dummy!.price}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    "${dummy!.discountPercentage}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    "${dummy!.rating}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    "${dummy!.stock}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
