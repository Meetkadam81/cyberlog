import 'package:hive/hive.dart';

part 'vault_item.g.dart';

@HiveType(typeId: 0)
class VaultItem extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String secret;

  VaultItem({
    required this.title,
    required this.secret,
  });
}
