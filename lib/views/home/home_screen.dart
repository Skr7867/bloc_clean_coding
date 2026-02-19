import 'package:bloc_clean_coding/bloc/movies/movies_bloc.dart';
import 'package:bloc_clean_coding/config/component/internet_exception.dart';
import 'package:bloc_clean_coding/config/routes/routes_name.dart';
import 'package:bloc_clean_coding/main.dart';
import 'package:bloc_clean_coding/services/storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/enums.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MoviesBloc moviesBloc;

  @override
  void initState() {
    super.initState();
    moviesBloc = MoviesBloc(moviesRepository: getIt());
  }

  @override
  void dispose() {
    moviesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              LocalStorage localStorage = LocalStorage();
              localStorage.clearValue('token').then((value) {
                localStorage.clearValue('isLogin').then((value) {
                  Navigator.pushNamed(context, RoutesName.loginScreen);
                });
              });
            },
            icon: Icon(Icons.login),
          ),
        ],
      ),
      body: BlocProvider(
        create: (_) => moviesBloc..add(MoviesFetched()),
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (BuildContext context, state) {
            switch (state.moviesList.status) {
              case Status.loading:
                return Center(child: CircularProgressIndicator());
              case Status.error:
                if (state.moviesList.message == 'No Internet Connection') {
                  return Center(
                    child: InternetException(
                      onPress: () {
                        moviesBloc.add(MoviesFetched());
                      },
                    ),
                  );
                }
                return Center(child: Text(state.moviesList.message.toString()));
              case Status.completed:
                if (state.moviesList.data == null) {
                  return Text('No data Found');
                }
                final moviesList = state.moviesList.data!;
                return ListView.builder(
                  itemCount: moviesList.tvShow.length,
                  itemBuilder: (context, index) {
                    final tvShows = moviesList.tvShow[index];

                    return Card(
                      child: ListTile(
                        leading: Image.network(tvShows.imageThumnnailPath),
                        title: Text(tvShows.name.toString()),
                        subtitle: Text(tvShows.network.toString()),
                        trailing: Text(tvShows.status.toString()),
                      ),
                    );
                  },
                );
              default:
                return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
