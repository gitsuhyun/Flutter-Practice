import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '폼 검증 데모',
      home: Scaffold(
        appBar: AppBar(title: Text('폼 검증 데모'),
      ),
      body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {

  @override
 MyCustomFormState createState() {
  return MyCustomFormState();
 }
}

class MyCustomFormState extends State<MyCustomForm> {
  //form 위젯에 유니크한 키값을 부여하고 검증시 사용
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    //form 위젯에 _formKey를 지정
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        TextFormField(
          validator: (value) {
            if (value!.isEmpty){
              return '글자를 입력하세요';
            }
            return null;
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
            onPressed: (){
              //폼을 검증하여 통과하면 true, 실패하면 false 리턴
              if(_formKey.currentState!.validate()) {
                //검증이 통과하면 스낵바 표시
                ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('검증 완료')));
              }
            },
            child: Text('검증'),
          ),
          ),
        ],
        ), 
    );
  }
}
