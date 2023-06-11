import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../generated/l10n.dart';
import '../../modules/news_screen/data/models/AppNewsModel.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class NewsScreenDetails extends StatelessWidget {
  NewsScreenDetails({
    Key? key,
    this.artichleDataDetails,
    this.categoryName,
  }) : super(key: key);

  Articles? artichleDataDetails;
  String? categoryName, sourceName;

  @override
  Widget build(BuildContext context) {
    String? myUrl = artichleDataDetails!.urlToImage;
    return BlocProvider(
      create: (context) {
        return AppCubit()..getNews();
      },
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                  artichleDataDetails!.author == null
                      ? "${S.of(context).Source} ${S.of(context).author}"
                      : artichleDataDetails!.author!,
                  style: const TextStyle(fontSize: 15)),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      artichleDataDetails!.author == null
                          ? artichleDataDetails!.title!
                          : artichleDataDetails!.title!
                              .replaceAll(artichleDataDetails!.author!, ""),
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        categoryName == "favourite"
                            ? sourceName == null
                                ? "${S.of(context).Source} ${S.of(context).Unknown}"
                                : "${S.of(context).Source} : $sourceName"
                            : artichleDataDetails!.source!.name == null
                                ? "${S.of(context).Source} ${S.of(context).Unknown}"
                                : "${S.of(context).Source} : ${artichleDataDetails!.source!.name!}",
                        style: const TextStyle(fontSize: 15),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: myUrl != null && myUrl != ""
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  myUrl,
                                ),
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: const Image(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage("assets/images/blank_image.jpg"),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        artichleDataDetails!.description == null
                            ? S.of(context).noDescription
                            : artichleDataDetails!.description!,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        artichleDataDetails!.content == null
                            ? S.of(context).noContent
                            : artichleDataDetails!.content!,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        artichleDataDetails!.publishedAt!.substring(
                            0, artichleDataDetails!.publishedAt!.indexOf("T")),
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              label: Text(S.of(context).moreDetails),
              icon: const Icon(Icons.details),
              onPressed: () async {
                final Uri url = Uri.parse(artichleDataDetails!.url!);
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
            ),
          );
        },
      ),
    );
  }
}
