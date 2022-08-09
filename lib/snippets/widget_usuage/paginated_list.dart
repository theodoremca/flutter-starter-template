import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsk/utils/colors.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


class PaginatedListWidget<T> extends ConsumerStatefulWidget {
  final void Function(int)? setScrollPosition;
  final void Function(int)? handleScrollWithIndex;
  final int? initialIndex;
  final Widget Function(int) itemBuilder;
    final Widget? loadingIndicator;
  final Future Function() onRefresh;
  final bool isFetch;
  final List<T>? data;
  final Color? color;
  const PaginatedListWidget(
      {required this.setScrollPosition,
      required this.handleScrollWithIndex,
      required this.data,
      required this.initialIndex,
      required this.onRefresh,
      required this.itemBuilder,
      required this.isFetch,
        this.loadingIndicator,
      this.color,
      Key? key})
      : super(key: key);

  @override
  createState() => _PaginatedListState();
}

class _PaginatedListState extends ConsumerState<PaginatedListWidget> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  Widget get positionsView => ValueListenableBuilder<Iterable<ItemPosition>>(
        valueListenable: itemPositionsListener.itemPositions,
        builder: (context, positions, child) {
          int? firstItem;
          int? lastItem;
          if (positions.isNotEmpty) {
            // Determine the first visible item by finding the item with the
            // smallest trailing edge that is greater than 0.  i.e. the first
            // item whose trailing edge in visible in the viewport.
            firstItem = positions
                .where((ItemPosition position) => position.itemTrailingEdge > 0)
                .reduce((ItemPosition first, ItemPosition position) =>
                    position.itemTrailingEdge < first.itemTrailingEdge
                        ? position
                        : first)
                .index;
            // Determine the last visible item by finding the item with the
            // greatest leading edge that is less than 1.  i.e. the last
            // item whose leading edge in visible in the viewport.
            lastItem = positions
                .where((ItemPosition position) => position.itemLeadingEdge < 1)
                .reduce((ItemPosition last, ItemPosition position) =>
                    position.itemLeadingEdge > last.itemLeadingEdge
                        ? position
                        : last)
                .index;
          }

//Step-5....
//           locator.get<UserState>().setScrollPosition(firstItem ?? 0);
          // sharedPreferences?.setInt('scrollPosition', firstItem ?? 0);
          if (widget.setScrollPosition != null) {
            widget.setScrollPosition!(firstItem ?? 0);
          }
          return const SizedBox.shrink();
        },
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.isFetch)
                  widget.loadingIndicator ??  Align(
            child:
                LinearProgressIndicator(color: widget.color ?? AppColors.primary),
            alignment: Alignment.bottomCenter,
          ),
        RefreshIndicator(
          color: widget.color ?? AppColors.primary,
          onRefresh: widget.onRefresh,
          child: ScrollablePositionedList.builder(
              itemCount: widget.data?.length ?? 0,
              // itemCount: paginationController.list?.length ?? 0,
              itemScrollController: itemScrollController,
              itemPositionsListener: itemPositionsListener,
              initialScrollIndex: widget.initialIndex ?? 0,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                // paginationControllerState.handleScrollWithIndex(index);
                if (widget.handleScrollWithIndex != null) {
                  widget.handleScrollWithIndex!(index);
                }
                return widget.itemBuilder(index);
              }),
        ),
        positionsView
      ],
    );
  }
}

// final paginationController =
// ref.watch(locator.get<PostService>().feedsListControllerProvider);
// final paginationControllerState = ref
//     .watch(locator.get<PostService>().feedsListControllerProvider.notifier);

// PaginatedListWidget<postSchema.Data>(
// initialIndex: locator.get<UserState>().getScrollPosition,
// onRefresh: () async {
// ref.refresh(locator.get<PostService>().feedsListControllerProvider);
// },
// itemBuilder: (index) {
// return Column(children: [
// (paginationController.list?[index].media?.isEmpty ?? ''.isEmpty)
// ? PostReferencedFeed(paginationController.list![index])
//     : PostFeed(paginationController.list![index]),
// Padding(
// padding: EdgeInsets.only(
// left: 8.w, right: 8.w, top: 20.h, bottom: 20.h),
// child: const Divider(),
// ),
// ]);
// },
// setScrollPosition: (idx) {
// locator.get<UserState>().setScrollPosition(idx);
// },
// data: paginationController.list,
// handleScrollWithIndex: (int index) {
// paginationControllerState.handleScrollWithIndex(index);
// },
// isFetch: paginationController.isFetching,
// )
