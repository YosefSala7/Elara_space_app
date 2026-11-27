import 'package:dartz/dartz.dart';
import 'package:space_app/features/learn/data/models/video.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<Either<String, List<Video>>> getApiVideos() async {
  try {
    final response = await Supabase.instance.client
        .from('En_Videos')
        .select()
        .order('id', ascending: true);
    final videos = response
        .map<Video>((row) => Video.fromMap(Map<String, dynamic>.from(row)))
        .toList();
    return Right(videos);
  } on PostgrestException catch (e) {
    return Left(e.message);
  } catch (e) {
    return Left(e.toString());
  }
}
