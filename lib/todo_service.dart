import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:todo_list/models/todo_item.dart';

class ToDoService {
  static final ToDoService _instance = ToDoService._internal();
  static const fileName = "file.json";

  final _databaseId = "63f9b6474180e9940c61";
  final _collectionId = "63f9b6b856d9f26971f8";

  final Client client = Client();
  late final Databases _db;
  models.Session? _session;
  late final Account _account;
  late final Realtime _realtime;
  late final RealtimeSubscription subscription;

  factory ToDoService() => _instance;

  ToDoService._internal() {
    client
        .setEndpoint('http://172.20.10.4/v1')
        .setProject('63f9b4fc5ab6b00dcd54')
        .setSelfSigned(status: true); //

    _account = Account(client);

    _db = Databases(client);

    if (_session?.current ?? false) {
      print(true);
    } else {
      _account
          .createEmailSession(
              email: "khanfardeen9983@gmail.com", password: "16Kratos@1998")
          .then((value) async {
        _session = value;
        refreshData();
      });
      // _account.deleteSessions().then((value) {
      //
      // });
    }
  }

  List<ToDoItem> items = [];

  addToDoItem(ToDoItem item) async {
    await _db.createDocument(
        databaseId: _databaseId,
        collectionId: _collectionId,
        documentId: ID.unique(),
        data: item.toJson(),
        permissions: [
          Permission.read(Role.any()), // Admins can delete this document
        ]);
    items.add(item);
    refreshData();
  }

  updateToDoItem(ToDoItem model) async {
    await _db.updateDocument(
        databaseId: _databaseId,
        collectionId: _collectionId,
        documentId: model.id,
        data: model.toJson());
    await refreshData();
  }

  deleteToDoItem(String id) async {
    await _db.deleteDocument(
        databaseId: _databaseId, collectionId: _collectionId, documentId: id);
    await refreshData();
  }

  refreshData() async {
    var items = (await _db.listDocuments(
            databaseId: _databaseId, collectionId: _collectionId))
        .documents;
    print(items.length);
  }
}
