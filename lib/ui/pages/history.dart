import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({
    super.key,
  });

  final history = Hive.box("History");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "History",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
              onPressed: () {
                history.clear();
              },
              child: Text(
                "Delete all",
                style: TextStyle(color: Colors.black, fontSize: 20.sp),
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: ValueListenableBuilder(
            valueListenable: history.listenable(),
            builder: (context, box, _) {
              final data = history.values.toList();
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 6.h),
                      elevation: 3,
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                              "${data.indexOf(data[index]) + 1}. ${data[index].title.toString()}"),
                        ),
                        subtitle: Text(data[index].description.toString()),
                        trailing: IconButton(
                          onPressed: () {
                            history.deleteAt(data.indexOf(data[index]));
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
