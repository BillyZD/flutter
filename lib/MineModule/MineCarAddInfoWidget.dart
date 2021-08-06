
import 'package:flutter/material.dart';


class MineCarAddInfoWidget extends StatelessWidget {

   MineCarAddInfoWidget({Key? key , required this.tapAddCar}) ;

  final Function() tapAddCar;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = (width - 32) * (78/343);
    return Container(
      padding: EdgeInsets.only(left: 16 , right: 16),
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('images/addCar_bg.png' ,fit: BoxFit.fitWidth, width: width - 32,),
          Positioned(
              right: 16,
              top: (height - 34 )/2 ,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: Container(
                  height: 34,
                  width: 90,
                  color: Color.fromRGBO(255, 129, 59, 1),
                  child: TextButton(
                    child: Center(
                      child: Text('添加爱车',style: TextStyle(
                          fontSize: 14,
                          color: Colors.white
                      ),),
                    ),
                    onPressed: (){
                      this.tapAddCar();
                    },
                  ),
                ),
              )
          )
          
        ],
      ),
    );
  }
}


