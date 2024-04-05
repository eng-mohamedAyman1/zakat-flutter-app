// ignore_for_file: file_names
// ignore: duplicate_ignore
// ignore: file_names

import 'package:flutter/material.dart';

import 'help package/ButtonUsed.dart';
import 'help package/TextFieldUsed.dart';
import 'help package/constVariable.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   GlobalKey <FormState> formKey= GlobalKey();

  int money=0;
  int price=0;
  String buttonTexts="أدخل ";
  String result='''''';
   bool  obscureTextsFormField=false;
   bool  obscureTexts=false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: backgroundColor,
          title:const Center(
            child:  Text(
              ' إحسب زكاتك ',

              style: TextStyle(
                fontWeight:  FontWeight.bold,
                fontSize: 24,
                color: Colors.white
              ),
            ),
          ),
        ),
        backgroundColor: Colors.green,
        body: Form(
          key:formKey ,
          child: ListView(
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  padding: const EdgeInsetsDirectional.all(20),
                  margin: const EdgeInsetsDirectional.all(20),
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(15)
                  ),

                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        ' زكاة المال ',
                        style: TextStyle(
                            fontWeight:  FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFieldUsed(
                        hintText: "أدخل المبلغ",
                        onChanged:(data){
                          if(formKey.currentState!.validate()){
                            money=int.parse(data);

                          }
                          money=int.parse(data);
                        },
                        validator: (data){
                          if (data == null || data.isEmpty) {
                            return 'أدخل المبلغ الذي تملكه ';
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(data)) {
                            return 'ادخل رقم من فضلك';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      (obscureTextsFormField)? TextFieldUsed(
                        hintText: "أدخل سعر جرام الذهب عيار 24 اليوم ",
                        onChanged:(data){
                          if(formKey.currentState!.validate()){
                            price=int.parse(data);

                          }
                          price=int.parse(data);
                        },
                        validator: (data){
                          if (data == null || data.isEmpty) {
                            return 'نرجو من حضرتك ادخال السعر  ';
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(data)) {
                            return 'ادخل رقم من فضلك';
                          }
                          return null;
                        },
                      ): const SizedBox(
                        height: 0,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ButtonUsed(text: buttonTexts,onTap: (){
                        if(formKey.currentState!.validate()){
                          setState(() {
                            obscureTextsFormField=true;
                            buttonTexts="أحسب ";
                            if(price>0&&money>0){
                              obscureTexts=true;
                              if(price*85<=money){
                                result ='''لحساب نسبة الزكاة من المال:\n أولاً:\n يجب معرفة النصاب: وهو الحد الأدنى من المال الذي تجب فيه الزكاة.\nنصاب الذهب: 85 جرامًا من الذهب عيار 24.\n نصاب الفضة: 595 جرامًا من الفضة.\n  نصاب المال: ما يعادل قيمة نصاب الذهب أو الفضة بالعملة المحلية. \n ثانياً: \nيجب معرفة حُول الزكاة: وهو مرور عام هجري كامل على المال دون صرفه.\n  ثالثاً:\n حساب نسبة الزكاة: وهي 2.5% من قيمة المال.\n في حالتك:\n مقدار المال قد تجاوز نصاب الذهب قيمة المال:$money\n نسبة الزكاة: 2.5%  حساب الزكاة:$money * 2.5% = ${money*2.5/100}\nملاحظة: \nهذه الحسابات تقريبية.  \nيُنصح بمراجعة مُفتٍ أو عالم دين مختص لتحديد مقدار الزكاة بدقة.
                              ''';
                              }
                              else{
                                result ='''
                              
                   لحساب نسبة الزكاة من المال:
                            أولاً: يجب معرفة النصاب: وهو الحد الأدنى من المال الذي تجب فيه الزكاة.
                            
                            نصاب الذهب: 85 جرامًا من الذهب عيار 24.
                            نصاب الفضة: 595 جرامًا من الفضة.
                            نصاب المال: ما يعادل قيمة نصاب الذهب أو الفضة بالعملة المحلية.
                            ثانياً: يجب معرفة حُول الزكاة: وهو مرور عام هجري كامل على المال دون صرفه.
                            
                            ثالثاً: حساب نسبة الزكاة: وهي 2.5% من قيمة المال.
                            
                            في حالتك:
                            مقدار المال لم يتجاوز نصاب الذهب 
                            قيمة المال: $money
                            نسبة الزكاة:0
                            ملاحظة:
                            
                            هذه الحسابات تقريبية.
                            يُنصح بمراجعة مُفتٍ أو عالم دين مختص لتحديد مقدار الزكاة بدقة.
                              ''';
                              }
                            }
                          });

                        }

                      },),
                      const SizedBox(
                        height: 15,
                      ),
                      (obscureTexts)?Container(
                        color: Colors.green[200],
                        child:  Text(result),
                      ):const SizedBox(height: 15,),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
