import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_news/presentation/screens/search_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../generated/l10n.dart';
import '../../modules/news_screen/data/models/categories.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'favourite_news_screen.dart';
import 'news_screen.dart';
import 'news_screen_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    List<Category?> cats = [
      Category(
        title: S.of(context).Health,
        imageAsset: "assets/images/health.png",
        parameterJson: "health",
        colorBorder: const Color(0xffebd9b5),
        colorBackground: const Color(0xfffef5e6),
      ),
      Category(
        title: S.of(context).Entertainment,
        imageAsset: "assets/images/entertainment.png",
        parameterJson: "entertainment",
        colorBorder: const Color(0xff62acce),
        colorBackground: const Color(0xffb0cad5),
      ),
      Category(
        title: S.of(context).Business,
        imageAsset: "assets/images/business.png",
        parameterJson: "business",
        colorBorder: const Color(0xffe33f32),
        colorBackground: const Color(0xfffbafbc),
      ),
      Category(
        title: S.of(context).Technologies,
        imageAsset: "assets/images/technology.png",
        parameterJson: "technology",
        colorBorder: const Color(0xff9acace),
        colorBackground: const Color(0xffe5f4f6),
      ),
      Category(
        title: S.of(context).General,
        imageAsset: "assets/images/general.png",
        parameterJson: "general",
        colorBorder: const Color(0xffb9c2e1),
        colorBackground: const Color(0xffe1e7fc),
      ),
      Category(
        title: S.of(context).Science,
        imageAsset: "assets/images/science.png",
        parameterJson: "science",
        colorBorder: const Color(0xff1a2c61),
        colorBackground: const Color(0xff7e8cb1),
      ),
      Category(
        title: S.of(context).Sports,
        imageAsset: "assets/images/sports.png",
        parameterJson: "sports",
        colorBorder: const Color(0xff3060e3),
        colorBackground: const Color(0xff8999d3),
      ),
    ];
    return BlocProvider(
      create: (context) {
        return AppCubit()..getNews(category: "general");
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
                title: Text(
                  S.of(context).MyNews,
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchNews(
                            categoryBackGroundColor: const Color(0xffe1e7fc),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.search),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavouriteNewsScreen(
                            categoryTitle: S.of(context).Favourites,
                            categoryName: "favourite",
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.star_border,
                    ),
                  ),
                ]),
            body: RefreshIndicator(
              onRefresh: () {
                return myCubit.getNews(category: "general");
              },
              child: Column(
                children: [
                  if (myCubit.isLoaded) ...[
                    ListTile(
                      leading: Text(S.of(context).TopHeadLine),
                      trailing: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsScreen(
                                categoryBackGroundColor:
                                    const Color(0xffe1e7fc),
                                colorTitle: const Color(0xffb9c2e1),
                                categoryName: "general",
                                categoryTitle: S.of(context).General,
                              ),
                            ),
                          );
                        },
                        child: Text(S.of(context).ShowAll),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: const Color(0xfff9f9f9),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: myCubit.newsModel!.articles!.map((e) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Ink(
                                  width: mq.size.width * 0.7,
                                  height: mq.size.height * 0.45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: InkWell(
                                    customBorder: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              NewsScreenDetails(
                                            artichleDataDetails: e,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                if (e.urlToImage != null)
                                                  Expanded(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      child: Image(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.15,
                                                        image: NetworkImage(
                                                          e.urlToImage,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                else
                                                  Expanded(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      child: Image(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.15,
                                                        fit: BoxFit.cover,
                                                        image: const AssetImage(
                                                            "assets/images/blank_image.jpg"),
                                                      ),
                                                    ),
                                                  ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      e.author == null
                                                          ? S
                                                              .of(context)
                                                              .Unknown
                                                          : e.author!,
                                                      maxLines: 2,
                                                      softWrap: true,
                                                      textAlign:
                                                          TextAlign.right,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: const TextStyle(
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              e.author == null
                                                  ? e.title!
                                                  : e.title!.replaceAll(
                                                      e.author!, ""),
                                              textAlign: TextAlign.right,
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                e.publishedAt!.substring(
                                                    0,
                                                    e.publishedAt!
                                                        .indexOf("T")),
                                                textAlign: TextAlign.left,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ] else ...[
                    Center(
                      child: LoadingAnimationWidget.waveDots(
                        color: Colors.blue,
                        size: 100,
                      ),
                    )
                  ],
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: GridView.count(
                        crossAxisCount: 3,
                        children: cats.map((item) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Ink(
                              width: mq.size.width * 0.1,
                              height: mq.size.height * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: item!.colorBackground!,
                              ),
                              child: InkWell(
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NewsScreen(
                                        categoryBackGroundColor:
                                            item.colorBackground,
                                        categoryName: item.parameterJson,
                                        categoryTitle: item.title,
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                        image: AssetImage(item.imageAsset!),
                                        width: mq.size.height * 0.05),
                                    Text(
                                      item.title!,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: mq.size.width * 0.035,
                                          color: item.colorBorder,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
