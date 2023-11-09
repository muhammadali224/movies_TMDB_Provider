import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/details_provider/details_provider.dart';
import '../../../core/constant/color.dart';
import '../../../core/extension/space_extension.dart';
import '../../../data/model/movie_model/movie_model.dart';
import '../../widget/details_screen/back_button_container.dart';
import '../../widget/details_screen/borded_container.dart';
import '../../widget/details_screen/rate_dialog.dart';
import '../../widget/shred_component/cached_network.dart';
import '../../widget/shred_component/rating_row.dart';

class DetailsScreen extends StatefulWidget {
  final MovieModel movieModel;

  const DetailsScreen({super.key, required this.movieModel});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final detailsProvider =
        Provider.of<DetailsProvider>(context, listen: false);
    print(widget.movieModel.id);
    detailsProvider.getState(
        widget.movieModel.id!, detailsProvider.getMediaType(widget.movieModel));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(
      builder: (context, controller, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          backgroundColor: Colors.blueGrey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          onPressed: () => controller.changeFavorite(
              context,
              widget.movieModel.id!,
              controller.getMediaType(widget.movieModel)),
          child: Icon(
            controller.isFavorite
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            color: Colors.red,
            size: 35,
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              leading: const BackButtonContainer(),
              elevation: 10,
              backgroundColor: AppColor.scaffoldBgColor,
              expandedHeight: 500,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    widget.movieModel.name ?? widget.movieModel.title!,
                    textAlign: TextAlign.center,
                  ),
                ),
                background: CustomCachedNetwork(
                  imageUrl: "${widget.movieModel.posterPath}",
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    10.height,
                    ListTile(
                      onTap: () => showRatingDialog(
                          context,
                          widget.movieModel.id!,
                          controller.getMediaType(widget.movieModel)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      tileColor: Colors.blueGrey,
                      title: Text("Your Rating",
                          style: Theme.of(context).textTheme.titleLarge),
                      trailing: RatingRow(
                        rateNumber: "${controller.rating}/5",
                      ),
                    ),
                    10.height,
                    Text("OverView",
                        style: Theme.of(context).textTheme.headlineLarge),
                    10.height,
                    Text(widget.movieModel.overview!,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w400)),
                    20.height,
                    Row(
                      children: [
                        BorderContainer(
                            title:
                                'Popularity: ${widget.movieModel.popularity!}'),
                        10.width,
                        BorderContainer(
                            title:
                                'Released Date: ${widget.movieModel.name != null ? widget.movieModel.firstAirDate.toString().split(" ").first : widget.movieModel.releaseDate!.toString().split(" ").first}'),
                      ],
                    ),
                    10.height,
                    Row(
                      children: [
                        BorderContainer(
                          widget: RatingRow(
                            rateNumber:
                                "${widget.movieModel.voteAverage!.toStringAsFixed(1)}/10",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
