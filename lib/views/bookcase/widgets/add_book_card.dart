/*
 * @Author: 刘林
 * @Date: 2021-10-18 14:51:04
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-18 18:04:43
 */
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AddBookCard extends StatelessWidget {
  const AddBookCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void addNovel() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['txt'],
      );
      // print(result);
      if (result != null) {
        String path = result.files.single.path!;
        print(path);
        File file = File(path);
        // Stream<List<int>> stream = file.openRead();
        // Stream<String> lines = stream
        //     .transform(utf8.decoder)
        //     .transform<String>(const LineSplitter());
        // try {
        //   await for (String first in lines) {
        //     print(first);
        //     // print('$line: ${line.length} characters');
        //   }
        //   print('File is now closed.');
        // } catch (e) {
        //   print('Error: $e');
        // }
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            addNovel();
          },
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.asset("assets/img/book_add.png"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
