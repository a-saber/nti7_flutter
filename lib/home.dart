import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti7_flutter/core/helper/my_navigator.dart';
import 'package:nti7_flutter/get_tasks_model.dart';

import 'add_task_view.dart';
import 'dio_helper.dart';


class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
    required this.username,
    required this.imagePath,
    required this.accessToken,
  });

  final String? username;
  final String? imagePath;
  final String accessToken;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    getTasks();
    super.initState();
  }

  bool isLoading = false;
  List<TaskModel> tasks = [];

  Future getTasks() async {
    try {
      setState(() {
        isLoading = true;
      });
      var result = await dio.get(
        'my_tasks',
        options: Options(
          headers: {'Authorization': 'Bearer ${widget.accessToken}'},
        ),
      );
      print(result.data.toString());
      var mapResponse = result.data as Map<String, dynamic>;
      GetTasksResponseModel model = GetTasksResponseModel.fromJson(mapResponse);
      setState(() {
        tasks = model.tasks ?? [];
        isLoading = false;
      });
    } catch (e) {
      handleDioException(e,);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff149954),
        shape: CircleBorder(),
        onPressed: () async {
          // DateTime? selectedDate =  await showDatePicker(context: context, firstDate: DateTime.now() ,
          //       lastDate: DateTime.now().add(Duration(days:365)));
          //  TimeOfDay? selectedTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());

          // bool? fetch = await Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => AddTaskView(
          //     accessToken: widget.accessToken,
          //   )),
          // );

          bool? fetch = await goTo(context, page: AddTaskView(accessToken: widget.accessToken));
          if(fetch == true){
            getTasks();
          }
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundImage: widget.imagePath != null
                  ? NetworkImage(widget.imagePath!)
                  : AssetImage('assets/images/flag.png'),
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello!',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff24252C),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  widget.username??'-',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff24252C),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: isLoading
          ? CircularProgressIndicator()
          : tasks.isEmpty
          ? Center(
              child: Text(
                'No Tasks',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: Color(0xff6E6A7C),
                ),
              ),
            )
          : RefreshIndicator(
            onRefresh: () async{
              getTasks();
            },
            child: ListView.separated(
                padding: REdgeInsets.symmetric(horizontal: 22),
                itemBuilder: (context, index) => TaskItemBuilder(
                  taskData: tasks[index],
                ),
                separatorBuilder: (context, index) => SizedBox(height: 20.h),
                itemCount: tasks.length,
              ),
          ),
    );
  }
}

class TaskItemBuilder extends StatelessWidget {
  const TaskItemBuilder({super.key, required this.taskData});

  final TaskModel taskData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffCEEBDC),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
            color: Colors.black.withValues(alpha: 0.25),
          ),
        ],
      ),
      padding: REdgeInsets.all(13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskData.title??'-',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: Color(0xff6E6A7C),
                  ),
                ),
                SizedBox(height: 13.h),
                Text(
                  taskData.description??'-',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp,
                    color: Color(0xff24252C),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Text(
              taskData.createdAt??'-',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: Color(0xff6E6A7C),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class MainLayout extends StatefulWidget {
//   const MainLayout({super.key});
//
//   @override
//   State<MainLayout> createState() => _MainLayoutState();
// }
//
// class _MainLayoutState extends State<MainLayout> {
//
//   List<Widget> tabs = [
//     HomeView(),
//     ProfileView(),
//     SettingsView()
//   ];
//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
//         ],
//         currentIndex: currentIndex,
//         onTap: (int index){
//           setState(() {
//             currentIndex = index;
//           });
//         },
//       ),
//       body: tabs[currentIndex],
//     );
//   }
// }
//
//
// class HomeView extends StatelessWidget {
//   const HomeView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//     );
//   }
// }
// class ProfileView extends StatelessWidget {
//   const ProfileView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//     );
//   }
// }
//
// class SettingsView extends StatelessWidget {
//   const SettingsView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Settings'),
//       ),
//     );
//   }
// }
