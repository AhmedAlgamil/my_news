import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'news_screen_details.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({
    Key? key,
    this.categoryName,
    this.categoryBackGroundColor,
    this.categoryTitle,
    this.colorTitle,
  }) : super(key: key);

  String? categoryName, categoryTitle;
  Color? categoryBackGroundColor, colorTitle;
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return AppCubit()..getNews(category: categoryName);
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
          if (state is NewsLoadedSuccessful) {
            for (int i = 0; i < AppCubit.get(context).defultCount; i++) {
              AppCubit.get(context).checkIsLiked(
                  AppCubit.get(context).newsModel!.articles![i].url, i);
            }
          }
        },
        builder: (context, state) {
          AppCubit myCubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: categoryBackGroundColor,
              title: Text(
                categoryTitle!,
                style: TextStyle(color: colorTitle),
              ),
            ),
            body: RefreshIndicator(
              onRefresh: () {
                return myCubit.getNews(category: categoryName);
              },
              child: myCubit.isLoaded
                  ? ListView.builder(
                      controller: scrollController,
                      itemCount: myCubit.defultCount,
                      itemBuilder: (context, index) {
                        if (index == myCubit.defultCount - 1) {
                          if (myCubit.defultCount >=
                              myCubit.newsModel!.totalResults!) {
                          } else {
                            myCubit.getNews(
                                category: categoryName,
                                pageSize: myCubit.defultCount += 20);
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
                                leading: myCubit.newsModel?.articles?[index]
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
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 15,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      myCubit.newsModel!.articles![index].title!,
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    Text(
                                      myCubit.newsModel!.articles![index]
                                          .publishedAt!,
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  icon:
                                      myCubit.newsModel!.articles![index].isLiked!
                                          ? const Icon(Icons.favorite)
                                          : const Icon(Icons.favorite_border),
                                  color: Colors.redAccent,
                                  onPressed: () async {
                                    myCubit.insertToFavouriteTable(
                                      sourceId: myCubit.newsModel!.articles![index]
                                              .source!.id!,
                                      sourceName: myCubit.newsModel!
                                          .articles![index].source!.name!,
                                      author: myCubit
                                          .newsModel!.articles![index].author!,
                                      title: myCubit
                                          .newsModel!.articles![index].title!,
                                      description: myCubit.newsModel!
                                              .articles![index].description ??
                                          "",
                                      url: myCubit
                                          .newsModel!.articles![index].url!,
                                      urlToImage: myCubit.newsModel!
                                              .articles![index].urlToImage ??
                                          "",
                                      publishedAt: myCubit.newsModel!
                                          .articles![index].publishedAt!,
                                      content: myCubit.newsModel!.articles![index]
                                              .content ??
                                          "",
                                      isLiked: true,
                                      index: index,
                                    );
                                  },
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
                          color: Colors.blue, size: 100),
                    ),
            ),
          );
        },
      ),
    );
  }
}
