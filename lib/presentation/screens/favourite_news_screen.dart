import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/news_screen/data/models/AppNewsModel.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'news_screen_details.dart';

class FavouriteNewsScreen extends StatelessWidget {
  FavouriteNewsScreen({
    Key? key,
    this.categoryTitle,
    this.categoryName,
  }) : super(key: key);

  String? categoryTitle, categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return AppCubit()..createDatabase();
      },
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is DataBaseCreated) {
            AppCubit.get(context).selectFromFavouriteTable();
          }
        },
        builder: (context, state) {
          AppCubit myCubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(categoryTitle!),
            ),
            body: ListView.builder(
              itemCount: myCubit.favAricles.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsScreenDetails(
                              artichleDataDetails: Articles(
                                url: myCubit.favAricles[index]['url'],
                                title: myCubit.favAricles[index]['title'],
                                author: myCubit.favAricles[index]['author'],
                                content: myCubit.favAricles[index]['content'],
                                description: myCubit.favAricles[index]
                                    ['description'],
                                publishedAt: myCubit.favAricles[index]
                                    ['publishedAt'],
                                urlToImage: myCubit.favAricles[index]
                                    ['urlToImage'],
                              ),
                              categoryName: categoryName,
                            ),
                          ),
                        );
                      },
                      leading: myCubit.favAricles[index]['urlToImage'] != ""
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  myCubit.favAricles[index]['urlToImage'],
                                ),
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: const Image(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage("assets/images/blank_image.jpg"),
                              ),
                            ),
                      title: Text(
                        myCubit.favAricles[index]['author'] ?? "unkowen",
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
                            myCubit.favAricles[index]['title']!,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis),
                          ),
                          Text(
                            myCubit.favAricles[index]['publishedAt']!,
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.black54),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
