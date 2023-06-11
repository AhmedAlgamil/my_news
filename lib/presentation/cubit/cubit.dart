import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_news/modules/news_screen/data/repository/news_repository.dart';
import 'package:g_news/presentation/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/news_screen/data/models/AppNewsModel.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  int defultCount = 20;
  AppNewsModel? newsModel;
  NewsRepository newsRepository = NewsRepository();
  bool isLoaded = false;
  List<Map<String, dynamic>> favAricles = [];
  Database? database;
  List<bool> areLiked = [];

  void createDatabase() async {
    openDatabase(
      "news.db",
      version: 1,
      onCreate: (database, version) {
        database
            .execute("CREATE TABLE favouriteNews(id INTEGER PRIMARY Key,"
                "sourceId TEXT,"
                "sourceName TEXT,"
                "author TEXT,"
                "title TEXT,"
                "description TEXT,"
                "url TEXT,"
                "urlToImage TEXT,"
                "publishedAt TEXT,"
                "content TEXT,"
                "isLiked TEXT"
                ")")
            .then((value) {});
        database
            .execute("CREATE TABLE myNews(id INTEGER PRIMARY Key,"
                "sourceId TEXT,"
                "sourceName TEXT,"
                "author TEXT,"
                "title TEXT,"
                "description TEXT,"
                "url TEXT,"
                "urlToImage TEXT,"
                "publishedAt TEXT,"
                "content TEXT,"
                "isLiked TEXT"
                ")")
            .then((value) {});
      },
      onOpen: (database) {
        selectFromFavouriteTable();
      },
    ).then((value) {
      database = value;
      emit(DataBaseCreated());
    }).catchError((error) {});
  }

  void selectFromFavouriteTable() async {
    await database?.rawQuery("SELECT * FROM favouriteNews").then((value) {
      for (var element in value) {
        favAricles.add(element);
        emit(RetriveFromDatatBase());
      }
    }).catchError((error) {});
  }

  void checkIsLiked(String? url, int index) {
    database
        ?.rawQuery("SELECT * FROM favouriteNews where url like \"$url\"")
        .then((value) {
      if (value.isNotEmpty) {
        newsModel!.articles![index].isLiked = true;
        if (index >= defultCount) {
        } else {
          areLiked.insert(index, true);
        }
      } else {
        newsModel!.articles![index].isLiked = false;
        if (index >= defultCount) {
        } else {
          areLiked.insert(index, false);
        }
      }
    }).catchError((error) {});
  }

  Future<void> insertToFavouriteTable({
    required String sourceId,
    required String sourceName,
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required String publishedAt,
    required String content,
    required bool? isLiked,
    required int index,
  }) async {
    await database
        ?.rawQuery("SELECT * FROM favouriteNews where url like \"$url\"")
        .then((value) async {
      if (value.isEmpty) {
        await database?.transaction((txn) {
          return txn.rawInsert("INSERT INTO favouriteNews"
              "("
              "sourceId,"
              "sourceName,"
              "author,"
              "title,"
              "description,"
              "url,"
              "urlToImage,"
              "publishedAt,"
              "content,"
              "isLiked"
              ")"
              "VALUES("
              "'$sourceId',"
              "'$sourceName',"
              "'$author',"
              "'$title',"
              "'$description',"
              "'$url',"
              "'$urlToImage',"
              "'$publishedAt',"
              "'$content',"
              "'$isLiked')");
        }).then((value) {
          newsModel!.articles![index].isLiked = true;
          emit(SavedToDataBase());
        }).catchError((error) {});
      } else {
        await database?.transaction((txn) {
          return txn
              .rawDelete("delete from favouriteNews WHERE url = \"$url\"");
        }).then((value) {
          newsModel!.articles![index].isLiked = false;
          emit(DeletedFromDatabase());
        }).catchError((error) {});
      }
    }).catchError((error) {});
  }

  Future<void> makeClear() async {
    await database?.transaction((txn) {
      return txn.rawDelete("delete from favouriteNews");
    }).then((value) {
      emit(ClearingState());
    }).catchError((error) {});
  }

  Future getNews({
    String? category,
    int pageSize = 20,
    String? query,
  }) async {
    createDatabase();
    newsRepository
        .getNews(category: category, pageSize: pageSize, query: query)
        .then((value) {
      if (value?.status == "ok") {
        if (defultCount == value?.totalResults) {
        } else {
          newsModel = value;
          isLoaded = true;
          defultCount = newsModel!.articles!.length;
        }
      }
      emit(NewsLoadedSuccessful());
    }).catchError((e) {
      if(e.toString().contains("SocketException")){
        emit(FetshErrorState());
      }
    });
  }
}
