class TaskModel{
  String? title;
  String? description;
  int? id;
  String? imagePath;
  String? createdAt;

  TaskModel({this.title, this.description, this.id, this.imagePath, this.createdAt});
  TaskModel.fromJson(Map<String, dynamic> json){
    title = json['title'];
    description = json['description'];
    id = json['id'];
    imagePath = json['image_path'];
    createdAt = json['created_at'];
  }

}


class GetTasksResponseModel{

  bool? status;
  List<TaskModel>? tasks;

  GetTasksResponseModel({this.status, this.tasks});
  GetTasksResponseModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    if(json['tasks'] != null){
      tasks = [];
      json['tasks'].forEach(
          (e){
            tasks!.add(TaskModel.fromJson(e));
          }
      );
    }
  }
}