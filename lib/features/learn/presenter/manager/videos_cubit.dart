import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/learn/data/repos/get_videos.dart';
import 'package:space_app/features/learn/presenter/manager/videos_state.dart';

class VideosCubit extends Cubit<VideosState> {
  VideosCubit() : super(VideosState());

  Future<void> getVideos() async {
    emit(VideosState(isLoading: true));

    final result = await getApiVideos();

    result.fold(
      (error) {
        emit(
          VideosState(
            isLoading: false,
            error: error,
          ),
        );
      },
      (videos) {
        emit(
          VideosState(
            isLoading: false,
            videos: videos,
          ),
        );
      },
    );
  }
}
