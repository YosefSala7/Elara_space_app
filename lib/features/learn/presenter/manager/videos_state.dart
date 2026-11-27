import 'package:space_app/features/learn/data/models/video.dart';
import 'package:space_app/features/learn/data/models/video.dart';

class VideosState {
  List<Video> videos;
  String? error;
  bool isLoading;

  VideosState({
    this.isLoading = false,
    this.error,
    this.videos = const [],
  });
}