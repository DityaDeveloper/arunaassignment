import 'package:arunaassignmentoaditya/domain/blog_model/blog_model.dart';
import 'package:flutter/material.dart';

class BlogDetailWidget extends StatefulWidget {
  const BlogDetailWidget({Key? key, required this.blog}) : super(key: key);
  final BlogModel blog;

  @override
  State<BlogDetailWidget> createState() => _BlogDetailWidgetState();
}

class _BlogDetailWidgetState extends State<BlogDetailWidget> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                const Text(
                  'Blog ID : ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                Text(
                  widget.blog.id.toString(),
                  style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            )
          ],
        ),
      ),
      body: SizedBox(
        width: screenSize.width,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.blog.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: screenSize.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.blog.body,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
