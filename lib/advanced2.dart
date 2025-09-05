import 'package:flutter/material.dart';
import 'package:flutter_basics/controller/post_controller.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    Provider.of<PostController>(context, listen: false).fetchApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Screen'),
        centerTitle: true,
      ),
      body: Consumer<PostController>(builder: (context, value, child) {
        return CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: ElevatedButton(
                  onPressed: () {
                    value.addPost();
                  },
                  child: Text('Add Post')),
            ),
            SliverToBoxAdapter(
              child: ElevatedButton(
                  onPressed: () {
                    value.updatePost();
                  },
                  child: Text('Update Post')),
            ),
            SliverToBoxAdapter(
              child: ElevatedButton(
                  onPressed: () {
                    value.patchPost();
                  },
                  child: Text('Patch Post')),
            ),
            SliverToBoxAdapter(
              child: ElevatedButton(
                  onPressed: () {
                    value.deletePost();
                  },
                  child: Text('Delete Post')),
            ),
            SliverList.builder(
                itemCount: value.dataList.length,
                itemBuilder: (context, index) => ListTile(
                      leading: Text(value.dataList[index].id.toString()),
                      title: Text(value.dataList[index].title.toString()),
                      subtitle: Text(value.dataList[index].body.toString()),
                    )),
          ],
        );
      }),
    );
  }
}
