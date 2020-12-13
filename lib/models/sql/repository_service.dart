import '../user_model.dart';
import 'database_creator.dart';
import 'dart:async';

class RepositoryServiceProfile {
  static Future<User> getProfile() async {
    final sql = ''' SELECT * FROM ${DatabaseCreator.table} ''';
    final data = await db.rawQuery(sql);
    DatabaseCreator.databaseLog('Add get', sql, null);
    return User.fromJson(data.first);
  }

  static Future<void> addProfile(User profile) async {
    final sql = '''INSERT INTO ${DatabaseCreator.table}
    (
      ${DatabaseCreator.id},
      ${DatabaseCreator.firstName},
      ${DatabaseCreator.secondName},
      ${DatabaseCreator.login},
      ${DatabaseCreator.country},
      ${DatabaseCreator.city},
      ${DatabaseCreator.imageUrl},
      ${DatabaseCreator.colorScheme},
      ${DatabaseCreator.tikTok},
      ${DatabaseCreator.vk},
      ${DatabaseCreator.inst},
      ${DatabaseCreator.twitter},
      ${DatabaseCreator.about}
    )
    VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)''';
    List<dynamic> params = [
      1,
      profile.name,
      profile.secondName,
      profile.login,
      profile.country,
      profile.city,
      profile.imageUrl,
      profile.colorScheme,
      profile.tikTokId,
      profile.vkId,
      profile.instId,
      profile.twitterId,
      profile.about
    ];
    final result = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add todo', sql, null, result, params);
  }

  static Future<void> updateProfile(User profile) async {
    final sql = '''UPDATE ${DatabaseCreator.table}
    SET 
        ${DatabaseCreator.firstName},
        ${DatabaseCreator.secondName},
        ${DatabaseCreator.login},
        ${DatabaseCreator.country},
        ${DatabaseCreator.city},
        ${DatabaseCreator.imageUrl},
        ${DatabaseCreator.colorScheme},
        ${DatabaseCreator.tikTok},
        ${DatabaseCreator.vk},
        ${DatabaseCreator.inst},
        ${DatabaseCreator.twitter},
        ${DatabaseCreator.about}
    WHERE
        ${DatabaseCreator.id} = 1
    ''';

    List<dynamic> params = [
      profile.name,
      profile.secondName,
      profile.login,
      profile.country,
      profile.city,
      profile.imageUrl,
      profile.colorScheme,
      profile.tikTokId,
      profile.vkId,
      profile.instId,
      profile.twitterId,
      profile.about
    ];
    final result = await db.rawUpdate(sql, params);
    DatabaseCreator.databaseLog('Update todo', sql, null, result, params);
  }

  static Future<void> deleteProfile() async {
    final sql = '''DELETE FROM ${DatabaseCreator.table}
        WHERE
        ${DatabaseCreator.id} = 1''';
    final result = await db.rawUpdate(sql);

    DatabaseCreator.databaseLog('Delete profile', sql, null, result);
  }
}
