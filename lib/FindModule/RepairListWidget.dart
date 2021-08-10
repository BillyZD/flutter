
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RepairListWidget extends StatefulWidget {
  const RepairListWidget({Key? key}) : super(key: key);

  @override
  _RepairListWidgetState createState() => _RepairListWidgetState();
}

class _RepairListWidgetState extends State<RepairListWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 15 , left: 16 , right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('images/placeholder_image.png'),
          SizedBox(width: 10,),
          Flexible(child: this.createInfoWidget()),
        ],
      ),
    );
  }

  
  Widget createInfoWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('一路相伴汽车养护中心汽车中心', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(51, 51, 51, 1)
        ),),
        SizedBox(height: 10,),
        this.createStarWidget(),
        SizedBox(height: 15,),
        this.createFlagWidget(),
        SizedBox(height: 15,),
        this.createProductWidget(),
        SizedBox(height: 15,),
        this.createDistance(),
        SizedBox(height: 15,),
        Divider(height: 0.5,color: Color.fromRGBO(150, 150, 150, 1),)
      ],
    );
  }

  /*创建星星评分Widget*/
  Widget createStarWidget() {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Wrap(
          spacing: 2,
          runSpacing: 0,
          children: [
            Image.asset('images/image_a.png'),
            Image.asset('images/image_a.png'),
            Image.asset('images/image_a.png'),
          ],
        ),
        SizedBox(width: 4,),
        Expanded(child: Text('质量信誉优良企业' , maxLines: 1, overflow: TextOverflow.ellipsis,style: TextStyle(
            fontSize: 12,
            color: Color.fromRGBO(185, 135, 0, 1)
        ),),),
        SizedBox(width: 4,),
        Icon(Icons.star , color: Color.fromRGBO(255, 129, 59, 1), size: 14,),
        Text('4',style: TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(255, 129, 59, 1)
        ),)
      ],
    );
  }

  Widget createFlagWidget(){
    return Wrap(
      spacing: 8,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(2)),
            border: Border.all(
              color: Color.fromRGBO(255, 129, 59, 1),
              width: 0.5
            )
          ),
          height: 18,
          padding: EdgeInsets.only(left: 4 , right: 4),
          child: Text('全国诚信', style: TextStyle(
            fontSize: 11,
            color: Color.fromRGBO(255, 129, 59, 1)
          ),),
        ),

        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              border: Border.all(
                  color: Color.fromRGBO(255, 129, 59, 1),
                  width: 0.5
              )
          ),
          height: 18,
          padding: EdgeInsets.only(left: 4 , right: 4),
          child: Text('一类机动车维修', style: TextStyle(
              fontSize: 11,
              color: Color.fromRGBO(255, 129, 59, 1)
          ),),
        )

      ],
    );
  }

  Widget createProductWidget(){
    return Wrap(
      spacing: 8,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              color: Color.fromRGBO(245, 245, 245, 1)
          ),
          height: 16,
          padding: EdgeInsets.only(left: 4 , right: 4),
          child: Text('漆面养护', style: TextStyle(
              fontSize: 11,
              color: Color.fromRGBO(102, 102, 102, 1)
          ),),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              color: Color.fromRGBO(245, 245, 245, 1)
          ),
          height: 16,
          padding: EdgeInsets.only(left: 4 , right: 4),
          child: Text('车身改色', style: TextStyle(
              fontSize: 11,
              color: Color.fromRGBO(102, 102, 102, 1)
          ),),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              color: Color.fromRGBO(245, 245, 245, 1)
          ),
          height: 16,
          padding: EdgeInsets.only(left: 4 , right: 4),
          child: Text('汽车改装', style: TextStyle(
              fontSize: 11,
              color: Color.fromRGBO(102, 102, 102, 1)
          ),),
        ),
      ],
    );
  }


  Widget createDistance() {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          child: Text('上海徐汇区北艾路1224号' , maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(
            fontSize: 12,
            color: Color.fromRGBO(153, 153 , 153, 1)
          ),),
        ),
        Text('4km', style: TextStyle(
          fontSize: 12,
          color: Color.fromRGBO(153, 153, 153, 1)
        ),)
      ],
    );
  }
  
}
