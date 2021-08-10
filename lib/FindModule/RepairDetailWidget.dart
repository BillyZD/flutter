
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RepairDetailWidget extends StatefulWidget {
  const RepairDetailWidget({Key? key}) : super(key: key);

  @override
  _RepairDetailWidgetState createState() => _RepairDetailWidgetState();
}

class _RepairDetailWidgetState extends State<RepairDetailWidget> {

  int star = 3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3) , (){
      this.star = 5;
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation:0,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(90, 90, 90, 1)
        ),
        title: Text('测试维修厂' , style: TextStyle(
          fontSize: 18,
          color: Color.fromRGBO(51, 51, 51, 1),
        ),),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('images/banner_place.png' , fit: BoxFit.fitWidth, width: width,),
                this.createInfoWidget(),
                SizedBox(height: 10,),
                this.createGoodBrand(),
                Container(
                  height: 400,
                  color: Colors.yellow,
                ),
              ],
            )
          )),

          SafeArea(child:  Container(
            height: 70,
            color: Colors.red,
          ))

        ],
      )
    );
  }

  Widget createInfoWidget() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 15 , left: 16) ,
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.vertical,
        children: [
          Text('徐虎美车堂养车普善路店' , maxLines: 1 , overflow: TextOverflow.ellipsis , style: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(51, 51, 51, 1),
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 10,),
          this.createStarWidget(),
          SizedBox(height: 10,),
          Wrap(
            spacing: 8,
            children: [
              this.createFlagWidget('全国诚信'),
              this.createFlagWidget('一类机动车维修',),
              this.createFlagWidget('4S'),
            ],
          ),
          SizedBox(height: 10,),
          Text('营业时间：09:00-19:00',style: TextStyle(
            fontSize: 13,
            color: Color.fromRGBO(51, 51, 51, 1),
          ),),
          SizedBox(height: 10,),
          Wrap(
            spacing: 8,
            runSpacing: 10,
            children: [
              this.createEffectWidget('漆面养护'),
              this.createEffectWidget('车身改色'),
              this.createEffectWidget('汽车改装'),
              this.createEffectWidget('汽车改装'),
              this.createEffectWidget('汽车改装漆面养护'),
              this.createEffectWidget('漆面养护')
            ],
          ),
          SizedBox(height: 15,),
          Divider(height: 0.5,),
          this.createAdressWidget()
        ],
      ),
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
          children: this.createStar(this.star),
        ),
        SizedBox(width: 4,),
        Expanded(child: Text('质量信誉优良企业' , maxLines: 1, overflow: TextOverflow.ellipsis,style: TextStyle(
            fontSize: 12,
            color: Color.fromRGBO(185, 135, 0, 1)
        ),),),
      ],
    );
  }

  /*创建星星*/
  List<Widget> createStar(int count) {
    List<Widget> tempArr = [];
    for ( var i = 0 ; i < count ; i ++) {
      tempArr.add(Image.asset('images/image_a.png'));
    }
    return tempArr;
  }

  /*创建标签Widget*/
  Widget createFlagWidget(String text) {
    return  Container(
      padding: EdgeInsets.only(left: 4 , right: 4 ,top: 1.5),
      height: 18,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2)),
          border: Border.all(
              color: Color.fromRGBO(255, 129, 59, 1),
              width: 0.5
          )
      ),
      child: Text(text , style: TextStyle(
          fontSize: 12,
          color: Color.fromRGBO(255, 129, 59, 1)
      ),),
    );
  }

  /*创建功能widget*/
  Widget createEffectWidget(String text){
    return  Container(
      padding: EdgeInsets.only(left: 4 , right: 4 ,top: 1.5),
      height: 18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2)),
        color: Color.fromRGBO(245, 245, 245, 1),
      ),
      child: Text(text , style: TextStyle(
          fontSize: 12,
          color: Color.fromRGBO(102, 102, 102, 1)
      ),),
    );
  }

  /*创建地址信息widget*/
  Widget createAdressWidget() {
    return Container(
      padding: EdgeInsets.only(top: 16 , bottom: 16),
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.horizontal,
        children: [
          Image.asset('images/image_adress.png'),
          SizedBox(width: 10,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('上海市徐汇区大木桥路288弄', maxLines: 1 , overflow: TextOverflow.ellipsis , style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(51, 51, 51, 1)
              ),),
              SizedBox(height: 4,),
              Text('1.2km', style: TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(153, 153, 153, 1)
              ),),
            ],
          )),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 0.5,
                color: Color.fromRGBO(228, 228, 228, 1),
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 16 , right: 16),
                child: Image.asset('images/image_nav.png'),
              )
            ],
          ),
        ],
      ),
    );
  }

  /*创建擅长品牌Widget*/
  Widget createGoodBrand() {
    return Container(
      
    );
  }

}
