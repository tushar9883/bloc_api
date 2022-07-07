import 'package:bloc_api/cubit/post_fetch_cubit.dart';
import 'package:bloc_api/repo/api_repo.dart';
import 'package:bloc_api/screen/home.dart';
import 'package:bloc_api/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    apiService: ApiService(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.apiService}) : super(key: key);

  final ApiService apiService;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostFetchCubit>(
            create: (context) =>
                PostFetchCubit(apiRepo: ApiRepo(apiService: apiService))
                  ..fetchPostApi())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
