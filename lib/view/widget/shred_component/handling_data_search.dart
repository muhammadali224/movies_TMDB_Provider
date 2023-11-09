import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/enum/search_enum.dart';
import '../../../generated/assets.dart';

class HandlingDataSearch extends StatelessWidget {
  final SearchState searchState;

  final Widget resultWidget;

  const HandlingDataSearch(
      {super.key, required this.searchState, required this.resultWidget});

  @override
  Widget build(BuildContext context) {
    return searchState == SearchState.none
        ? Container()
        : searchState == SearchState.initial
            ? Container()
            : searchState == SearchState.loading
                ? const Center(child: CircularProgressIndicator())
                : searchState == SearchState.noResult
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(Assets.lottieNoData,
                                height: 250, width: 250, repeat: false),
                            Text("Failed to Get Data",
                                style:
                                    Theme.of(context).textTheme.displayLarge),
                          ],
                        ),
                      )
                    : resultWidget;
  }
}
