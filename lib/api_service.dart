import 'dart:convert';
import 'package:http/http.dart'as http;
List items=[];

class ApiService{
   
  Future <void> fetchList() async{
    final url="https://api.nstack.in/v1/todos?page=1&limit=10";
    final uri=Uri.parse(url);
    final response=await http.get(uri);
    if(response.statusCode==200){
      final json=jsonDecode(response.body) as Map;
      final result=json["items"] as List;
      items=result;
    }
    else{
     throw Exception('Failed to load list'); 
    }    
  }

  Future<void> addList(String title, String desc)async {
    final url="https://api.nstack.in/v1/todos";
    final uri=Uri.parse(url);
    final body={
      "title":title,
      "description":desc
    };
    final response=await http.post(uri,body: jsonEncode(body),headers: {'Content-Type':'application/json'});    
  }

   Future<void> deleteList(String id)async {
    final url="https://api.nstack.in/v1/todos/${id}";
    final uri=Uri.parse(url);   
    final response=await http.delete(uri); 
    if(response.statusCode==200){
      final result=items.where((element) => element["_id"]!=id).toList();
      items=result;
    }    
  }

  Future<void> editList(String title, String desc,String id)async {
    final url="https://api.nstack.in/v1/todos/${id}";
    final uri=Uri.parse(url);
    final body={
      "title":title,
      "description":desc
    };
    final response=await http.put(uri,body: jsonEncode(body),headers: {'Content-Type':'application/json'});  
     
  }
}