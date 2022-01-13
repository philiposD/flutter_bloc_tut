import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_v8_api_tut/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_v8_api_tut/services/boredService.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(RepositoryProvider.of<BoredService>(context))
            ..add(LoadApiEvent()),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Activities for vored people"),
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is HomeLoadedState) {
                return Column(
                  children: [
                    Text(state.activityType),
                    Text(state.activityName),
                    Text("${state.participants}"),
                    ElevatedButton(
                        onPressed: () => BlocProvider.of<HomeBloc>(context)
                            .add(LoadApiEvent()),
                        child: Text("Refresh"))
                  ],
                );
              }

              return Container();
            },
          )),
    );
  }
}
