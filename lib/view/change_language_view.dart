import 'package:flutter/material.dart';
import 'package:myapp/models/language_model.dart';
import 'package:myapp/resources/color_manager.dart';
import 'package:myapp/resources/string_manager.dart';

class ChooseLanguageView extends StatefulWidget {
  const ChooseLanguageView({super.key});

  @override
  State<ChooseLanguageView> createState() => _ChooseLanguageViewState();
}

class _ChooseLanguageViewState extends State<ChooseLanguageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringManager.chooseLanguage),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              StringManager.chooseLanguage,
              style: TextStyle(
                  fontSize: 30,
                  color: ColorManager.whiteColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 100,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: supportedLanguages.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      setState(() {});
                    },
                    title: Text(supportedLanguages[index].name),
                    trailing: Icon(Icons.language),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
