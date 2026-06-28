import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti7_flutter/let_start_view.dart';
import 'package:nti7_flutter/features/auth/presentation/views/login_view.dart';

import 'core/components/custom_btn.dart';
import 'core/components/custom_text_field.dart';
import 'core/helper/show_snack_bar.dart';
import 'dio_helper.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key, required this.accessToken});
  final String accessToken;
  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {

  var title = TextEditingController();
  var description = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(22.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset('assets/images/flag.png',
                  width: 260.w,
                  height: 207.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 30.h,),
              CustomTextField(controller: title, hintText: 'title'),
              SizedBox(height: 15.h,),
              CustomTextField(controller: description, hintText: 'description'),
              SizedBox(height: 30.h,),
              if(isLoading)
                CircularProgressIndicator()
              else
              CustomBtn(text: 'Add Task', onTap: onAddTaskPresses)

            ],

          ),
        ),
      ),
    );
  }
  void onAddTaskPresses()async {
    setState(() {
      isLoading = true;
    });

    try{
      var result = await dio.post('new_task',
          data: FormData.fromMap({
            'title': title.text,
            'description': description.text,
          }),
        options: Options(
          headers: {
            'Authorization': 'Bearer ${widget.accessToken}'
          }
        )
      );
      var mapResponse = result.data as Map<String, dynamic>;
      String message = mapResponse['message'];
      showCustomSnackBar(context, text: message, status: SnackBarStatus.success);

      Navigator.pop(context, true);
    }
    catch(e){
      handleDioException(e, context);
    }



    setState(() {
      isLoading = false;
    });

  }

}
