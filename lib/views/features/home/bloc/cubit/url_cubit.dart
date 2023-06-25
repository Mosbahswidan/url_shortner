import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_shortner/utils/constants.dart';
import 'package:url_shortner/utils/custom_snack_bar.dart';
import 'package:url_shortner/utils/functions/check_internet.dart';
import 'package:url_shortner/views/controller/url_entity.dart';
import 'package:url_shortner/views/features/home/bloc/cubit/url_state.dart';
import 'package:http/http.dart' as http;
import 'package:url_shortner/views/features/home/views/pages/home.dart';

import '../../views/pages/history.dart';

class UrlCubit extends Cubit<UrlState> {
  UrlCubit() : super(UrlInitial());
  static UrlCubit get(context) => BlocProvider.of(context);
  var navScreen = [
    const HomeBar(),
    const HistoryBar(),
  ];
  List<UrlEntity> history = [];
  int navBarIndex = 0;

  void shortUrl(BuildContext context, String url) async {
    var box = Hive.box<UrlEntity>(kurlBox);

    if (await checkInternet()) {
      var response = await http.post(
          Uri.parse("https://cleanuri.com/api/v1/shorten"),
          body: {"url": url});
      if (response.statusCode == 200) {
        var newUrl = jsonDecode(response.body)['result_url'];
        UrlEntity e = UrlEntity(urlString: newUrl);
        box.add(e);
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Container(
                padding: const EdgeInsets.all(10),
                width: 300,
                height: 200,
                child: Column(children: [
                  Text(
                    "Your link is:\n $newUrl",
                    style: const TextStyle(
                        height: 1.5, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        FlutterClipboard.copy(newUrl).then((value) {});
                      },
                      child: const Text("Copy to clipboard"))
                ]),
              ),
            );
          },
        );
      } else {
        var error = jsonDecode(response.body)['error'];
        // ignore: use_build_context_synchronously
        customSnackBar(context, error);
      }
    } else {
      // ignore: use_build_context_synchronously
      customSnackBar(context, "There is no internet connection");
    }
  }

  void changeNavBarIndex(int index) {
    navBarIndex = index;
    emit(UrlChangeIndex());
  }

  fetchHistoryUrl() {
    var box = Hive.box<UrlEntity>(kurlBox);

    history = box.values.toList();
  }

  deleteItemHive(UrlEntity e, int index) async {
    var box = Hive.box<UrlEntity>(kurlBox);
    await box.deleteAt(index);
    emit(UrlDelIndex());
  }
}
