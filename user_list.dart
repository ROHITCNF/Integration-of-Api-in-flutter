import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  final Future<List<Map<String, dynamic>>> data;
  const UserList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //print(snapshot.data!.length);
          for (int i = 0; i < snapshot.data!.length; i++) {
            print(snapshot.data![i]);
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final item = snapshot.data![index];
                  return ListTile(
                    title: Text('${item['first_name']} ${item['last_name']}'),
                    subtitle: Text(item['email']),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(item['avatar']),
                    ),
                  );
                },
              ),
            ),
          );

        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
