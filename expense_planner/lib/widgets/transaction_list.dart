import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('No transactions added yet!'),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover),
                  height: 200,
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 8,
                  ),
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${transactions[index].ammount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                  ),
                );
                //  return Card(
                //    elevation: 5,
                //    child: Row(
                //      children: <Widget>[
                //        Container(
                //          margin: EdgeInsets.symmetric(
                //            vertical: 10,
                //            horizontal: 15,
                //          ),
                //          padding: EdgeInsets.all(10),
                //          decoration: BoxDecoration(
                //              border: Border.all(
                //            color: Theme.of(context).accentColor,
                //            width: 2,
                //          )),
                //          child: Text(
                //            'R\$ ${transactions[index].ammount.toStringAsFixed(2)}',
                //            style: TextStyle(
                //                fontSize: 18,
                //                fontWeight: FontWeight.bold,
                //                color: Theme.of(context).primaryColorDark),
                //            overflow: TextOverflow.ellipsis,
                //          ),
                //        ),
                //        Column(
                //          crossAxisAlignment: CrossAxisAlignment.start,
                //          children: <Widget>[
                //            Text(
                //              transactions[index].title,
                //              style: Theme.of(context).textTheme.title,
                //            ),
                //            Text(
                //              DateFormat.yMMMd().format(transactions[index].date),
                //              style: TextStyle(
                //                color: Colors.grey,
                //              ),
                //            )
                //          ],
                //        )
                //      ],
                //    ),
                //  );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
