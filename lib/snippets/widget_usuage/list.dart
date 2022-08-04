// import 'package:flutter/material.dart';
// import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
// import 'package:talk_tailor_app/locator.dart';
// import 'package:talk_tailor_app/singleton/user.dart';

// class ListWidget<T> extends StatefulWidget {
//   const ListWidget(this.feeds, {required this.itemBuilder, Key? key})
//       : super(key: key);

//   final List<T> feeds;
//   final Widget Function(BuildContext, int) itemBuilder;

//   @override
//   State<ListWidget> createState() => _ListWidgetState();
// }

// class _ListWidgetState extends State<ListWidget> {
//   final ItemScrollController itemScrollController = ItemScrollController();
//   final ItemPositionsListener itemPositionsListener =
//       ItemPositionsListener.create();
//   Widget get positionsView => ValueListenableBuilder<Iterable<ItemPosition>>(
//         valueListenable: itemPositionsListener.itemPositions,
//         builder: (context, positions, child) {
//           int? firstItem;
//           int? lastItem;
//           if (positions.isNotEmpty) {
//             // Determine the first visible item by finding the item with the
//             // smallest trailing edge that is greater than 0.  i.e. the first
//             // item whose trailing edge in visible in the viewport.
//             firstItem = positions
//                 .where((ItemPosition position) => position.itemTrailingEdge > 0)
//                 .reduce((ItemPosition first, ItemPosition position) =>
//                     position.itemTrailingEdge < first.itemTrailingEdge
//                         ? position
//                         : first)
//                 .index;
//             // Determine the last visible item by finding the item with the
//             // greatest leading edge that is less than 1.  i.e. the last
//             // item whose leading edge in visible in the viewport.
//             lastItem = positions
//                 .where((ItemPosition position) => position.itemLeadingEdge < 1)
//                 .reduce((ItemPosition last, ItemPosition position) =>
//                     position.itemLeadingEdge > last.itemLeadingEdge
//                         ? position
//                         : last)
//                 .index;
//           }

// //Step-5....
//           locator.get<UserState>().setScrollPosition(firstItem ?? 0);
//           // sharedPreferences?.setInt('scrollPosition', firstItem ?? 0);
//           return const SizedBox.shrink();
//         },
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         ScrollablePositionedList.builder(
//             itemCount: widget.feeds.length,
//             itemScrollController: itemScrollController,
//             itemPositionsListener: itemPositionsListener,
//             initialScrollIndex: locator.get<UserState>().getScrollPosition ?? 0,
//             shrinkWrap: true,
//             itemBuilder: widget.itemBuilder),
//         positionsView
//       ],
//     );
//   }
// }
