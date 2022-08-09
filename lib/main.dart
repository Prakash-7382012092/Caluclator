import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key?key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: MyHomePage(title:'Caluclator'));
  }
}
class MyHomePage extends StatefulWidget{
  MyHomePage({Key?key,required this.title}):super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => MyHome();
}
class MyHome extends State<MyHomePage>{
  late double i,j,op=0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),centerTitle:true,backgroundColor: Colors.red),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(

          children: [

            Text("Simple Caluclator",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.redAccent),textAlign: TextAlign.center,),
            Padding(padding: EdgeInsets.only(top: 40)),
            Row(

              children:[

                CustomTextField(
                  onChanged: (s){
                    hint:'1st Number';
                    i=double.parse(s);
                    print(i);
                  },
                ),
                Padding(padding: EdgeInsets.only(left: 20)),
                CustomTextField(
                  onChanged: (s){
                    j=double.parse(s);
                    print(j);
                  },
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                CustomButton(
                    symbol: '+',
                    Tap:(){
                      setState((){
                        op=i+j;
                      });
                    }
                ),

                CustomButton(
                    symbol: '-',
                    Tap:(){
                      setState((){
                        op=i-j;
                      });
                    }
                ),

                CustomButton(
                    symbol: '*',
                    Tap:(){
                      setState((){
                        op=i*j;
                      });
                    }
                ),

                CustomButton(
                    symbol: '/',
                    Tap:(){
                      setState((){
                        op=i/j;
                      });
                    }
                ),


              ],
            ),
            Padding(padding: EdgeInsets.only(top: 40)),
            Text(op.toStringAsFixed(0),style: TextStyle(fontSize: 25,color: Colors.red),),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget{
  CustomTextField({Key?key,this.onChanged,this.hint}):super(key: key);
  final String ? hint;
  final Function(String) ? onChanged;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hint,

        ),


      ),
    );
  }
}

class CustomButton extends StatelessWidget{
  CustomButton({Key?key,this.Tap,this.symbol}):super(key:key);
  final String ? symbol;
  final Function()? Tap;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: Tap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.red),
        child: Center(
          child: Text(symbol!,style: TextStyle(fontSize: 40,color: Colors.white),),
        ),
      ),
    );
  }
}
