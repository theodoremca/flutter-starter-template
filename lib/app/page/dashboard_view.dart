import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/app/api/model/asset_model.dart';
import 'package:nft/app/components/custom_scaffold.dart';
import 'package:nft/app/components/text_widgets.dart';
import 'package:nft/app/controller/asset_controller.dart';

import '../locator.dart';


class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  List<Assets> _assets=[];
  bool _loading=false;
  Future<void> _getData() async {
    setState(() {
      _loading = true;
    });
    _assets = await locator.get<AssetController>().getRequest(context);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        removeImage: true,
        child: Column(
          children: [
            SizedBox(height: 75.h),
            Container(
                width: 85.w,
                height: 18.h,
                child: Image.asset(
                  'assets/pngs/logo.png',
                )),
            SizedBox(height: 66.h),
            _loading ? const CircularProgressIndicator.adaptive() : Expanded(
              child:  _assets.isEmpty ? const SizedBox(): newMethod(),
            )
          ],
        ));
  }

  Widget newMethod() {
    const bool _showCount = !false;
    return _showCount ? regularText('${_assets.length}',color: Colors.white) : ListView.builder(
                itemCount: _assets.length,
                itemBuilder: (context, idx) {
                  return Card(
                      textItem1: "${_assets[idx].id}",
                      textItem2:
                      "not Avalable",
                      textItem3:
                      "Not Available",
                      textItem4:
                      "Not Available",
                      title: _assets[idx].name == null
                          ? "noot Avalable "
                          : _assets[idx].name!.toString(),
                      listText:
                      "${_assets[idx].assetContract!.owner}",
                      image:
                      _assets[idx].imageThumbnailUrl == null
                          ? 'https://via.placeholder.com/300.png'
                          : _assets[idx].imageThumbnailUrl!);


                });
  }
}

class Card extends StatelessWidget {
  const Card({
    Key? key,
    required this.title,
    required this.textItem1,
    required this.textItem2,
    required this.textItem3,
    required this.textItem4,
    required this.listText,
    this.image =
    "https://lh3.googleusercontent.com/IdiZIxUEj5zaR4vIPlQJboqNcjPcf0nPgNSgVKGbiby8yYOnOS9zxmar9JeieGr0x9e5s06QDlsXbZQjz5q-kPz78As_shxsds0-=s250",
  }) : super(key: key);
  final String title;
  final String textItem1;
  final String textItem2;
  final String textItem3;
  final String textItem4;
  final String listText;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 31.h),
      child: Stack(
          alignment: AlignmentDirectional.topStart,
          fit: StackFit.loose,
          clipBehavior: Clip.hardEdge,
          children: <Widget>[
            Center(
                child: Container(
                  width: 305.w,
                  height: 167.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                    color: Color(0xff383838),
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: 14.h, left: 23.h),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 98.h,
                        width: 98.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3f000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Container(
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                height: 30,
                                width: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25)),
                                child: Image.network(
                                  image,
                                  fit: BoxFit.fill,
                                ),
                              )),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      SizedBox(height: 14.h),
                      Column(
                        children: [
                          regularText(listText,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                          regularText("Item Listed",
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Column(
                      children: [
                        regularText(title.substring(0,20),
                            fontSize: 14,
                            letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                        SizedBox(height: 14.h),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ItemCard(text: textItem1, label: 'id'),
                            SizedBox(width: 20.h),
                            ItemCard(
                                text: textItem2.substring(0, 10),
                                label: 'Item'),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ItemCard(text: textItem3, label: 'Item'),
                            SizedBox(width: 20.h),
                            ItemCard(text: textItem4, label: 'Item'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    required this.text,
    required this.label,
    Key? key,
  }) : super(key: key);
  final String text;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84.w,
      height: 47.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        color: Color(0xff6b6b6b),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              text,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Center(
            child: Text(
              label,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
