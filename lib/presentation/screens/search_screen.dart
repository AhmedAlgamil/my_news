import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../generated/l10n.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'news_screen_details.dart';

class SearchNews extends StatelessWidget {
  SearchNews({
    Key? key,
    this.categoryBackGroundColor,
  }) : super(key: key);

  Color? categoryBackGroundColor;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return AppCubit();
      },
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is FetshErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text("you are offline"),
              ),
            );
          }
        },
        builder: (context, state) {
          AppCubit myCubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: categoryBackGroundColor,
              title: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: S.of(context).Search,
                  suffixIcon: IconButton(
                    onPressed: () {
                      searchController.text = "";
                      myCubit.getNews();
                    },
                    icon: const Icon(Icons.close),
                  ),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                onChanged: (value) {
                  myCubit.getNews(query: value);
                },
              ),
            ),
            body: myCubit.isLoaded
                ? ListView.builder(
                    itemCount: myCubit.defultCount,
                    itemBuilder: (context, index) {
                      if (index == myCubit.defultCount - 1) {
                        if (myCubit.defultCount >=
                            myCubit.newsModel!.totalResults!) {
                        } else {
                          myCubit.getNews(pageSize: myCubit.defultCount += 20);
                        }
                      } else {
                        return Column(
                          children: [
                            ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewsScreenDetails(
                                      artichleDataDetails:
                                          myCubit.newsModel?.articles![index],
                                    ),
                                  ),
                                );
                              },
                              leading: myCubit.newsModel?.articles![index]
                                          .urlToImage !=
                                      null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          myCubit.newsModel?.articles![index]
                                              .urlToImage,
                                        ),
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: const Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "assets/images/blank_image.jpg"),
                                      ),
                                    ),
                              title: Text(
                                myCubit.newsModel!.articles![index].author ==
                                        null
                                    ? "unkowen"
                                    : myCubit
                                        .newsModel!.articles![index].author!,
                                maxLines: 2,
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 15,
                                ),
                              ),
                              subtitle: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.1,
                                child: Text(
                                  myCubit.newsModel!.articles![index].title!,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              trailing: Text(
                                myCubit.newsModel!.articles![index].publishedAt!
                                    .substring(
                                        0,
                                        myCubit.newsModel!.articles![index]
                                            .publishedAt!
                                            .indexOf('T')),
                              ),
                            ),
                            const Divider(color: Colors.black54),
                          ],
                        );
                      }
                      return null;
                    },
                  )
                : Center(
                    child: LoadingAnimationWidget.fourRotatingDots(
                        color: Colors.blue, size: 100)),
          );
        },
      ),
    );
  }
}
