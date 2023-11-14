import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '스텝1: 기본 코드 작성',
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

//첫번째 페이지
class BmiMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BmiMainState();

}

class _BmiMainState extends State<BmiMain> {
  final _formKey = GlobalKey<FormState>(); //폼의 상태를 얻기 위한 키

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('비만도 계산기')),
      body: Container(
        padding: const EdgeInsets.all(16.0), 
        child: Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '키',
            ),
          keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 16.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '몸무게',
            ),
            keyboardType: TextInputType.number,
          ),
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            alignment: Alignment.centerRight,
            child:ElevatedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){

                }
              },
              child: Text('결과'),
            ),
          )
        ],
        ),
      ),
      ),
    );   
  }
}

//두번째 페이지
class BmiResult extends StatelessWidget {


}