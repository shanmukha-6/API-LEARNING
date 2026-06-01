import 'package:api_learning/ApiModels/MoonModal.dart';
import 'package:flutter/material.dart';
import '../ApiService/api_service.dart';
import '../Model/user_model.dart';

class PostApiScreen extends StatefulWidget {
  const PostApiScreen({super.key});

  @override
  State<PostApiScreen> createState() => _PostApiScreenState();
}

class _PostApiScreenState extends State<PostApiScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  MoonModal? userData;

  bool isLoading = false;

  Future<void> createUser() async {
    setState(() {
      isLoading = true;
    });

    userData = await ApiService().createUser(
      nameController.text,
      int.parse(ageController.text),
    );

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("POST API")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Enter Name"),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "Enter Age"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(onPressed: createUser, child: const Text("Submit")),

            const SizedBox(height: 30),

            if (isLoading) const CircularProgressIndicator(),

            if (userData != null)
              Card(
                color: Colors.blue,
                child: Column(
                  children: [
                    Text("ID : ${userData!.id}"),
                    Text("Name : ${userData!.firstName}"),
                    Text("Age : ${userData!.age}"),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
