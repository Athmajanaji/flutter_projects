import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List usertransactions;
  final Function del;
  TransactionList(this.usertransactions, this.del);
  @override
  Widget build(BuildContext context) {
    return usertransactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No Transactions Yet...',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 20),
                Container(
                  height: constraints.maxHeight * .6,
                  child: Image.asset(
                    'image/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                          child: Text('${usertransactions[index].amount}')),
                    ),
                  ),
                  title: Text(
                    '${usertransactions[index].title}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(usertransactions[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 360
                      // ignore: deprecated_member_use
                      ? FlatButton.icon(
                          onPressed: () => del(index),
                          icon: Icon(Icons.delete),
                          label: Text('delete'),
                          textColor: Theme.of(context).errorColor,
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => del(index),
                          color: Theme.of(context).errorColor,
                        ),
                ),
              );
            },
            itemCount: usertransactions.length,
          );
  }
}
