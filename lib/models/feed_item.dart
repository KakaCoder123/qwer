import 'package:a1/models/class_discovery.dart';
import 'package:a1/models/class_users.dart';

class FeedItem {
  final ClassUsers users;
  final ClassDiscovery post;

  FeedItem({
   required this.users,
   required this.post
});
}