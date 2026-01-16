import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/vault_item.dart';

class VaultScreen extends StatefulWidget {
  const VaultScreen({super.key});

  @override
  State<VaultScreen> createState() => _VaultScreenState();
}

class _VaultScreenState extends State<VaultScreen> {
  final _titleController = TextEditingController();
  final _secretController = TextEditingController();

  void _addItem() {
    if (_titleController.text.isEmpty ||
        _secretController.text.isEmpty) {
      return;
    }

    final box = Hive.box<VaultItem>('vault');

    box.add(
      VaultItem(
        title: _titleController.text,
        secret: _secretController.text,
      ),
    );

    _titleController.clear();
    _secretController.clear();
    Navigator.pop(context);
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.black,
        title: const Text("Add Secret"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: _secretController,
              decoration: const InputDecoration(labelText: "Password / Note"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: _addItem,
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<VaultItem>('vault');

    return Scaffold(
      appBar: AppBar(
        title: const Text("🔐 Encrypted Vault"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder<Box<VaultItem>>(
        valueListenable: box.listenable(),
        builder: (context, box, _) {
          if (box.isEmpty) {
            return const Center(
              child: Text("No secrets stored"),
            );
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final item = box.getAt(index);

              return Card(
                color: Colors.grey[900],
                child: ListTile(
                  title: Text(item!.title),
                  subtitle: Text(item.secret),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => box.deleteAt(index),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
