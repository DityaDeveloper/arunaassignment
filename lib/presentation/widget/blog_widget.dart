import 'package:arunaassignmentoaditya/domain/blog_model/blog_model.dart';
import 'package:flutter/material.dart';

import 'blog_detail_widget.dart';

class BlogWidget extends StatefulWidget {
  const BlogWidget({Key? key, required this.blog}) : super(key: key);

  final List<BlogModel> blog;

  @override
  State<BlogWidget> createState() => _BlogWidgetState();
}

class _BlogWidgetState extends State<BlogWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildBlogWidget(widget.blog);
  }

  Widget _buildBlogWidget(List<BlogModel> blog) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      padding: const EdgeInsets.only(left: 10),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: blog.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              right: 10,
            ),
            child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => BlogDetailWidget(
                            blog: blog[index],
                          )));
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  //width: 100,
                  child: Padding(
                      padding: const EdgeInsets.all(.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: screenSize.width,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  blog[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    // height: 1.4,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenSize.width,
                            child: Card(
                              color: const Color.fromARGB(255, 211, 212, 212),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  blog[index].body,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    //  height: 1.4,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                )),
          );
        },
      ),
    );
  }
}
