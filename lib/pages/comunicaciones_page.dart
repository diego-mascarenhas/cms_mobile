import 'package:flutter/material.dart';
import 'package:cms_mobile/models/user.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cms_mobile/menu.dart' as my_menu;

enum Actions { share, delete, archive }

class ComunicacionesPage extends StatefulWidget {
  const ComunicacionesPage({Key? key}) : super(key: key);

  @override
  State<ComunicacionesPage> createState() => _ComunicacionesPageState();
}

class _ComunicacionesPageState extends State<ComunicacionesPage> {
  List<User> users = allUsers;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Comunicaciones'),
        ),
        drawer: const my_menu.NavigationDrawer(),
        body: SlidableAutoCloseBehavior(
          closeWhenOpened: true,
          child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];

                return Slidable(
                    key: Key(user.name),
                    startActionPane: ActionPane(
                      motion: const StretchMotion(),
                      dismissible: DismissiblePane(
                        onDismissed: () => _onDismissed(index, Actions.share),
                      ),
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.green,
                          icon: Icons.share,
                          label: 'Compartir',
                          onPressed: (context) =>
                              _onDismissed(index, Actions.share),
                        ),
                        SlidableAction(
                          backgroundColor: Colors.blue,
                          icon: Icons.archive,
                          label: 'Archivar',
                          onPressed: (context) =>
                              _onDismissed(index, Actions.archive),
                        ),
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: const BehindMotion(),
                      dismissible: DismissiblePane(
                        onDismissed: () => _onDismissed(index, Actions.delete),
                      ),
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          label: 'Borrar',
                          onPressed: (context) =>
                              _onDismissed(index, Actions.delete),
                        ),
                      ],
                    ),
                    child: buildUserListTile(user));
              }),
        ),
      );

  void _onDismissed(int index, Actions action) {
    final user = users[index];
    setState(() => users.removeAt(index));

    switch (action) {
      case Actions.delete:
        _showSnackBar(context, '${user.name} fue eliminado', Colors.red);
        break;
      case Actions.archive:
        _showSnackBar(context, '${user.name} fue guardado', Colors.blue);
        break;
      case Actions.share:
        _showSnackBar(context, '${user.name} fue compartido', Colors.green);
        break;
    }
  }

  void _showSnackBar(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(content: Text(message), backgroundColor: color);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget buildUserListTile(User user) => ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(user.name),
        subtitle: Text(user.email),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(user.image),
        ),
        onTap: () {
          final slidable = Slidable.of(context)!;
          final isClosed = slidable.actionPaneType.value = ActionPaneType.none;
          // ignore: unrelated_type_equality_checks
          if (isClosed == true) {
            slidable.openStartActionPane();
          } else {
            slidable.close;
          }
        },
      );
}
