import 'package:flutter_example_widget_test/provider/todo_list_provider.dart';
import 'package:flutter_test/flutter_test.dart';

///Dòng lệnh đầu tiên khởi tạo một đối tượng TodoProvider
///, được sử dụng để thao tác với danh sách công việc (todo list) của ứng dụng.

final _provider = TodoProvider();

void main() {
  List<String> _list = [];

  ///Hàm group() được sử dụng để nhóm các unit test liên quan đến chức năng quản lý danh sách công việc.
  group(
    "todo functionality unit test:",
    () {
      ///Hàm test() được sử dụng để thực hiện một unit test cụ thể.

      /// add to todo list unit test
      test(
        "add todo list test",
        () {
          _provider.addTodo("data0");
          expect(_provider.todoList.first, "data0");
          expect(_provider.textController.text == "", true);
        },
      );

      ///Unit test này kiểm tra tính năng thêm công việc mới vào danh sách. Hàm addTodo() được gọi để thêm
      ///một công việc mới vào danh sách và sau đó hai lệnh expect() được sử dụng để kiểm tra tính đúng đắn của kết quả.
      ///Cụ thể:
      // expect(_provider.todoList.first, "data0") kiểm tra xem công việc được thêm mới có đúng là "data0" không.
      // expect(_provider.textController.text == "", true) kiểm tra xem giá trị của textController
      // đã được reset về rỗng ("" - empty string) sau khi thêm công việc mới hay không.

      /// remove from tod list unit test
      test(
        "remove from todo list test",
        () {
          _provider.removeTodo("data0");
          expect(_provider.todoList.isEmpty, true);
        },
      );

      /// Hàm removeTodo() được gọi để xóa công việc "data0" khỏi danh sách và sau đó hàm expect() được sử dụng để kiểm tra tính đúng đắn của kết quả.
      /// Hàm expect(_provider.todoList.isEmpty, true) kiểm tra xem danh sách công việc đã trống hay chưa.
    },
  );
}
