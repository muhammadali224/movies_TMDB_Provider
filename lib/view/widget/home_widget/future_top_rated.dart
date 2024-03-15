import 'package:flutter/cupertino.dart';
import 'section_list.dart';

import '../../../data/model/movie_model/movie_model.dart';
import '../shred_component/handling_error.dart';
import '../shred_component/loadin_indicator.dart';

class TopRated extends StatelessWidget {
  final Future<List<MovieModel>?>? future;
  const TopRated({super.key, this.future});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        return snapshot.hasError
            ? HandlingError(errorMessage: snapshot.error.toString())
            : snapshot.hasData
                ? SectionList(movieModel: snapshot.data!)
                : const LoadingIndicator();
      },
    );
  }
}
