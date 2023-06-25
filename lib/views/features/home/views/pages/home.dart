import 'package:flutter/widgets.dart';

import '../../bloc/cubit/url_cubit.dart';
import '../widgets/custom_button_auth.dart';
import '../widgets/custom_text_form_auth.dart';

class HomeBar extends StatelessWidget {
  const HomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController urlController = TextEditingController();
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Image(
                image: AssetImage("assets/images/shortey.png"),
                width: double.infinity,
                height: 200,
              ),
              const Text(
                "Shrotey is a powerful and user-friendly URL shortening app that simplifies your web experience. With Shrotey, you can transform long, cumbersome URLs into concise and shareable links with just a few clicks. Whether you're sharing links on social media, sending them via messages, or simply organizing your bookmarks, Shrotey provides a seamless solution to save space, enhance readability, and track clicks.",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextFormAuth(
                lable: "url",
                controller: urlController,
                hint: "Url",
                valid: (p0) {
                  if (p0!.isEmpty) {
                    return "error";
                  } else {
                    return p0;
                  }
                },
              ),
              CustomButton(
                text: "Shortey",
                pressed: () {
                  UrlCubit.get(context).shortUrl(context, urlController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
