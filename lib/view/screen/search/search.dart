import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:provider/provider.dart';

import '../../../controller/search_provider/search_provider.dart';
import '../../../core/function/valid_input.dart';
import '../../widget/search/search_result_container.dart';
import '../../widget/shred_component/handling_data_search.dart';
import '../../widget/shred_component/input_form_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SearchProvider>(
        builder: (context, controller, child) => SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InputFormField(
                controller: controller.searchController,
                onIconTap: () =>
                    controller.getSearch(controller.searchController.text),
                validate: (val) {
                  return validInput(val!, 3, 15);
                },
                onSubmit: (val) => controller.getSearch(val!),
                hintTitle: 'Search Movies,Tv Show ...',
                icon: IconBroken.Search,
              ),
              HandlingDataSearch(
                searchState: controller.searchState,
                resultWidget: Expanded(
                  child: ListView.builder(
                      itemCount: controller.searchResult.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => SearchResultContainer(
                            movieModel: controller.searchResult[index],
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
