
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Tool/ToolToastWidget.dart';

/*维修厂详情Widget*/
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
          Expanded(child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Image.asset('images/banner_place.png' , fit: BoxFit.fitWidth, width: width,),
                    this.createInfoWidget(),
                    SizedBox(height: 10,),
                    this.createGoodBrand(),
                    SizedBox(height: 10,),
                    this.createTeamWidget(),
                    SizedBox(height: 10,),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(top: 15 , left: 16) ,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Text('客户评价',style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SliverList(delegate: SliverChildBuilderDelegate((BuildContext cnx , int index){
                return createEvaluationWidget();
              },
                childCount: 3
              ),)
            ],
          )),
          SafeArea(child:  this.createBottomWidget())
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
                child: IconButton(
                  icon: Image.asset('images/image_nav.png'),
                  onPressed: (){
                    ToolToast.showLongToast('点击导航');
                  },
                ),
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
      padding: EdgeInsets.only(left: 16 , right: 16 , top: 15 , bottom: 15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('擅长品牌' , style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 15,),
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: Container(
                height: 50,
                color: Color.fromRGBO(249, 249, 249, 1),
              ),),
              SizedBox(width: 12,),
              Expanded(child: Container(
                height: 50,
                color: Color.fromRGBO(249, 249, 249, 1),
              ),),
              SizedBox(width: 12,),
              Expanded(child: Container(
                height: 50,
                color: Color.fromRGBO(249, 249, 249, 1),
              ),),
            ],
          )
        ],
      ),
    );
  }

  /*创建技术团队Widget*/
  Widget createTeamWidget() {
    return Container(
      padding: EdgeInsets.only(left: 16 , top: 15 , bottom: 15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('技师团队' , style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 15,),
          Container(
            height: 90,
            child: ListView.builder(itemBuilder: (cnx , index){
              return Container(
                height: 90,
                width: 170,
                child: Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 155,
                      height: 88,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                              offset: Offset(0, 8),
                              blurRadius: 0.4,
                              spreadRadius: 0.1,
                            ),
                          ]
                        ),
                      ),
                  ],
                )
              );
            },
              itemCount: 20,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }

  /*创建底部按钮*/
  Widget createBottomWidget(){
    return Container(
      height: 50,
      color: Colors.white,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(child: TextButton(
            onPressed: (){
              ToolToast.showLongToast('点击联系门店');
            },
            child: Container(
              height: 50,
              child: Center(
                child: Text('联系门店',style: TextStyle(
                    color: Color.fromRGBO(255, 129, 59, 1),
                    fontSize: 17
                ),),
              )
            )
          )),
          Expanded(child: TextButton(
            onPressed: (){
              ToolToast.showLongToast('点击预约服务');
            },
            child: Container(
              height: 50,
              child: Center(
                child: Text('预约服务', style: TextStyle(
                    fontSize: 17,
                    color: Colors.white
                ),),
              )
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) => Color.fromRGBO(255, 129, 59, 1)), // 设置背景色
              shape: MaterialStateProperty.all(BeveledRectangleBorder(borderRadius: BorderRadius.zero)) // 设置不需要圆角
            ),
          ))
        ],
      ),
    );
  }

  /*创建评价cell*/
  Widget createEvaluationWidget() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 15 , left: 16) ,
      child: Flex(
        direction: Axis.vertical,
        children: [
          this.createEvaluationUserWidget(),
          SizedBox(height: 18,),
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Text('保养不错，服务热情，店面整洁，施工专业，价格非常给力。施工专业，价格非常给力。' , maxLines: 2 , overflow: TextOverflow.ellipsis, style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(51, 51, 51, 1)
            ),),
          ),
          SizedBox(height: 15,),
          Divider(height: 0.5,),
        ],
      ),
    );
  }

  Widget createEvaluationUserWidget() {
    return  Container(
      padding: EdgeInsets.only(right: 16),
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('images/mine_place_icon.png' , width: 50 , height: 50,),
          SizedBox(width: 10,),
          Expanded(child: Container(
            padding: EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(child: Text('李晓满' , maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),),),
                    SizedBox(width: 10,),
                    Container(
                      height: 10,
                      width: 0.5,
                      color: Color.fromRGBO(228, 228, 228, 1),
                    ),
                    SizedBox(width: 10,),
                    Text('上海大众',maxLines: 1,overflow: TextOverflow.clip, style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(153, 153, 153, 1)
                    ),)
                  ],
                ),
                SizedBox(height: 3,),
                Row(
                    children: [
                      Icon(Icons.star , color: Color.fromRGBO(255, 129, 59, 1), size: 12,),
                      SizedBox(width: 3,),
                      Text('4.8' , style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(255, 129, 59, 1)
                      ),),
                    ]
                ),
              ],
            ),
          )),
          Text('2020.10.12',style: TextStyle(
              fontSize: 12,
              color: Color.fromRGBO(153, 153, 153, 1)
          ),)
        ],
      ),
    );
  }

}
