import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});
  final box = Hive.box("Favourite");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        backgroundColor: const Color.fromARGB(246, 245, 254, 245),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 3, 104, 7),
          title: Text("Favourite",style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold),),
          actions: [
            TextButton(
            
                onPressed: () {
                  box.clear();
                },
                child: Text(
                  "Delete all",
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                ))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, box, _) {
                final data = box.values.toList();
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 8,
                        child: ListTile(
                          title: Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: Text(
                                "${data.indexOf(data[index]) + 1}. ${data[index].title.toString()}"),
                          ),
                          subtitle: Text(data[index].description.toString()),
                          trailing: IconButton(
                            onPressed: () {
                              box.deleteAt(data.indexOf(data[index]));
                            },
                            icon: const Icon(Icons.delete,color: Colors.black,),
                          ),
                        ),
                      );
                    });
              }),
        ),
      ),
    );
  }
}
