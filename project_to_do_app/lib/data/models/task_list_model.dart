class TaskListModel {
  String? status;
  List<Data>? taskList;

  TaskListModel({this.status, this.taskList});

  TaskListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      taskList = <Data>[];
      json['data'].forEach((v) {
        taskList!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  String? sId;
  String? title;
  String? description;
  String? status;
  String? email;
  String? createdDate;

  Data(
      {this.sId,
        this.title,
        this.description,
        this.status,
        this.email,
        this.createdDate});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    email = json['email'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['email'] = this.email;
    data['createdDate'] = this.createdDate;
    return data;
  }
}
