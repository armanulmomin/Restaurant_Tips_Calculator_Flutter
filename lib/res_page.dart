import 'package:flutter/material.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  TextEditingController txtcontroller = TextEditingController();
  List<bool> _selectionlist = [true, false, false];
  String? tip;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

           if(tip!=null)
             Padding(padding: EdgeInsets.all(10),
             child: Text(
               tip! , style: TextStyle(fontSize: 30),
             ),),


            Text('Total Amount'),
            SizedBox(
              width: 60,
              child: TextField(
                controller: txtcontroller,
                  textAlign: TextAlign.center,
                  // keyboardType: TextInputType.numberWithOptions(decimal: true),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: '\$100')),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: ToggleButtons(
                  children: [Text('10%'), Text('15%'), Text('20%')],
                  isSelected: _selectionlist,
              onPressed: updateSelection,
              ),
            ),
            ElevatedButton(

              onPressed: calculate,
              child: const Text('Calculate Tip'),
            ),
          ],
        ),
      ),
    );
  }
  void updateSelection(int selectedIndex){
    //print(selectedIndex);
    setState(() {
      for(int i=0;i<_selectionlist.length;i++)
      {
        if(selectedIndex == i)
          {
            _selectionlist[i] = true;
          }
        else
          {
            _selectionlist[i] = false;
          }
        //_selectionlist[i] = selectedIndex == i;

      }
    });


  }

  void calculate(){
    final totalamount = double.parse(txtcontroller.text) ;
    final selectedIndex = _selectionlist.indexWhere((element) =>element);
    final totaltip= [.1,.2,.3][selectedIndex];

    final totalcal = (totalamount*totaltip).toStringAsFixed(2);
    setState(() {
      tip = 'Total tip to pay : \$$totalcal';
    });
  }

}
