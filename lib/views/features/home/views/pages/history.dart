import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_shortner/views/features/home/bloc/cubit/url_cubit.dart';
import 'package:url_shortner/views/features/home/bloc/cubit/url_state.dart';

class HistoryBar extends StatelessWidget {
  const HistoryBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UrlCubit, UrlState>(
      builder: (context, state) {
        UrlCubit.get(context).fetchHistoryUrl();
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: UrlCubit.get(context).history.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                            UrlCubit.get(context).history[index].urlString),
                        trailing: InkWell(
                          onTap: () {
                            UrlCubit.get(context).deleteItemHive(
                                UrlCubit.get(context).history[index], index);
                          },
                          child: const Icon(Icons.delete),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
