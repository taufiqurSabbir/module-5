import 'package:flutter/material.dart';

void main() {
 runApp(MyApp());
}

class MyApp extends StatelessWidget {  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assignment',
      home:HomeScreen(),
    );
  }
}



class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}




class _HomeScreenState extends State<HomeScreen> {

  List<Widget>widgetList = const[
  Text('This page-1', style: TextStyle(fontSize: 30,color: Colors.red, fontWeight: FontWeight.bold)),
  Text('This  page-2', style: TextStyle(fontSize: 30,color: Colors.green, fontWeight: FontWeight.bold)),
  Text('This  page-3', style: TextStyle(fontSize: 30,color: Colors.deepPurple, fontWeight: FontWeight.bold)),

  ];


  List<Widget>fcolour = const[
    Text('Colors.red'),
    Text('Colors.green'),
    Text('Colors.deepPurple'),

  ];

  int myindex =0;

  List<Color> fabColors = [Colors.red, Colors.green, Colors.deepPurple];



  void _selectPage(int index) {
    setState(() {
      myindex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Home'),
      ),
      drawer:  Drawer(
        child: ListView(
          children:  [
            Container(
              height: 80,
              child: Center(child: Text(
                'Home'
                ,style:
              TextStyle(
                color:Colors.grey[200],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              )),
              color: Colors.red,
            ),


            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home', style: TextStyle(fontSize: 20),
              ),
              onTap: (){
                _selectPage(0);
              },
            ),
            ListTile(
              selectedColor: Colors.red,
              leading: Icon(Icons.manage_accounts_sharp),
              title: Text('Members',
                style:TextStyle(
                    fontSize: 20
                ),
              ),
              onTap: (){
                _selectPage(1);
              },
            ),

            ListTile(
              leading: Icon(Icons.medical_services),
              title: Text('Service',
                style:
                TextStyle(
                    fontSize: 20
                ),),

              onTap: (){
                _selectPage(2);
              },

            ),


          ],
        ),
      ),
      body: Center(
       child: widgetList[myindex],
      ),


      floatingActionButton: FloatingActionButton(onPressed: () {  },

        backgroundColor: fabColors[myindex],
        child: Text((myindex+1).toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
      ),




      bottomNavigationBar:

      BottomNavigationBar(
        onTap: (index){
          setState(() {
            myindex=index;
          });
        },
        currentIndex: myindex,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),
        label: 'home',
          backgroundColor: Colors.red
        ),
        BottomNavigationBarItem(icon: Icon(Icons.manage_accounts),
            label: 'home',
            backgroundColor: Colors.green
        ),
        BottomNavigationBarItem(icon: Icon(Icons.medical_services_outlined),
            label: 'home',
            backgroundColor: Colors.deepPurple
        ),
      ],),
    );
  }
}