import 'package:bloc_api/cubit/post_fetch_cubit.dart';
import 'package:bloc_api/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bloc Api"),
        ),
        body: Center(
          child: BlocBuilder<PostFetchCubit, PostFetchState>(
            builder: (context, state) {
              if (state is PostFetchLoading) {
                return const CircularProgressIndicator();
              } else if (state is PostFetchError) {
                return Text(state.failure.message);
              } else if (state is PostFetchLoaded) {
                final postList = state.postList;
                return postList.isEmpty
                    ? const Text('No any posts')
                    : ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          final Post singlePost = postList[index];
                          return Card(
                            elevation: 50,
                            shadowColor: Colors.black,
                            color: Colors.grey[100],
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              onTap: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.lightGreen,
                                  content: Text(singlePost.id.toString(),
                                      textAlign: TextAlign.center),
                                  duration: Duration(seconds: 1),
                                ));
                                print(
                                    ' >>>>>>>>>> ${singlePost.id.toString()} <<<<<<<<<< ');

                                //singlePost.id.toString();
                              },
                              title: Text(singlePost.title.toString()),
                              subtitle: Text(singlePost.body.toString()),
                              leading: CircleAvatar(
                                child: Text(singlePost.id.toString()),
                              ),
                            ),
                          );
                        });
              }
              return const SizedBox.shrink();
            },
          ),
        ));
  }
}
