import 'package:hive/hive.dart';

part 'vault_item.g.dart';

@HiveType(typeId: 0)
class VaultItem {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String secret;

  VaultItem(this.title, this.secret);
}
