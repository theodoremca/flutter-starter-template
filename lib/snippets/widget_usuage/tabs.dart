import 'package:tab_container/tab_container.dart';

class TabMapper {
  final Widget title;
  final Widget child;
  TabMapper({required this.title, required this.child});
}

List<TabMapper> tabItems = [
  TabMapper(title: const AppText("People"), child: constText('People Child ')),
  TabMapper(title: const AppText("Post"), child: const Text('Post Child '))
];


TabContainer(
              isStringTabs: false,
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              children: tabItems.map((e) => e.child).toList(),
              tabs: tabItems.map((TabMapper tab) => tab.title).toList(),
            )