import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_shortner/views/features/home/bloc/cubit/url_cubit.dart';
import 'package:url_shortner/views/features/home/bloc/cubit/url_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UrlCubit, UrlState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Shortey"),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: UrlCubit.get(context).navBarIndex,
            onTap: (index) {
              UrlCubit.get(context).changeNavBarIndex(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), label: 'History'),
            ],
          ),
          body: UrlCubit.get(context)
              .navScreen[UrlCubit.get(context).navBarIndex],
        );
      },
    );
  }
}
