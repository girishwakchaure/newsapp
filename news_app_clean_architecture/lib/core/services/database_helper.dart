import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../data/models/article_model.dart';

class DatabaseHelper {
  static Database? _db;

  Future<Database> get database async {
    return _db ??= await initDb();
  }

  Future<Database> initDb() async {
    final path = join(await getDatabasesPath(), 'articles.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE articles (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            imageUrl TEXT,
            author TEXT,
            content TEXT,
            publishedAt TEXT,
            url TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertArticles(List<ArticleModel> articles) async {
    final db = await database;
    await db.delete('articles'); 
    for (var article in articles) {
      await db.insert('articles', article.toMap());
    }
  }

  Future<List<ArticleModel>> getCachedArticles() async {
    final db = await database;
    final maps = await db.query('articles');
    return maps.map((e) => ArticleModel.fromMap(e)).toList();
  }
}
