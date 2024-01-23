import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mgreen_app/view/component/RowDropDownBtn.dart';

import '../../../view_model/account_viewModal.dart';
import '../../component/TextFieldWithIcon.dart';

class AccountForm extends StatelessWidget{
  const AccountForm({super.key,required this.accountViewModal});

  final AccountViewModal accountViewModal;
  @override
  Widget build(BuildContext context){
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
          height: MediaQuery.of(context).size.height*0.2,
          width: MediaQuery.of(context).size.width*0.25,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20,10,10,10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 3, color: Colors.grey, spreadRadius: 2)
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50.0,
                  child: Image.asset('assets/images/user-logo.png'),
                ),
              ),
              Container(
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(10,20,20,20),
                height: 120,
                width: 170,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.asset('assets/images/homepage-slideshow.jpg',height: 100,fit: BoxFit.cover),
                ),
              )
            ],
          ),
        ),
        Container(
          color: Colors.white,
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Bạn đã đổi được: 0 VNĐ từ 0 kg rác tái chế",style: TextStyle(fontSize: 15,color: Colors.black),),
              TextFiledWithIcon(textEditingController: accountViewModal.nameTextController,iconData: FontAwesomeIcons.user,labelText: 'Họ và tên ',),
              TextFiledWithIcon(textEditingController: accountViewModal.contactTextController,iconData: FontAwesomeIcons.phone,labelText: 'Số điện thoại',),
              Container(
                width: MediaQuery.of(context).size.width *1,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  controller: accountViewModal.dateTextController, //editing controller of this TextField
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(fontWeight: FontWeight.w400,color: Colors.grey),
                    hintText: 'Ngày sinh',
                    prefixIcon: Icon(FontAwesomeIcons.calendarDays,color: Colors.green[300]),
                  ),
                  readOnly: true,  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context, initialDate: DateTime.now(),
                        firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101)
                    );

                    if(pickedDate != null ){
                      print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      accountViewModal.setTextDate(formattedDate);
                    }else{
                      print("Date is not selected");
                    }
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width *1,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                decoration:const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 0.5,
                        color: Colors.grey
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child:Icon(FontAwesomeIcons.marsAndVenus,color: Colors.green[300],size: 30,),
                    ),
                    SizedBox(
                      width: 150,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: const Text('Male'),
                        leading: Radio<GenderType>(
                          fillColor: MaterialStateColor.resolveWith((states) => Colors.green),
                          value: GenderType.male,
                          groupValue: accountViewModal.gender,
                          onChanged: (GenderType? value) {
                            accountViewModal.setGender(value);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: const Text('Female'),
                        leading: Radio<GenderType>(
                          fillColor: MaterialStateColor.resolveWith((states) => Colors.green),
                          value: GenderType.female,
                          groupValue: accountViewModal.gender,
                          onChanged: (GenderType? value) {
                            accountViewModal.setGender(value);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const RowDropDownBtn(buttonName: 'Tỉnh/Thành phố'),
              const RowDropDownBtn(buttonName: 'Quận/Huyện'),
              const RowDropDownBtn(buttonName: 'Phường/Xã'),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width *1,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          color: Colors.white,
          child: TextFormField(
            controller: accountViewModal.nameTextController,
            keyboardType: TextInputType.name,
            decoration:  InputDecoration(
              hintStyle: const TextStyle(fontWeight: FontWeight.w400,color: Colors.grey),
              hintText: 'Địa chỉ chi tiết',
              prefixIcon: Icon(FontAwesomeIcons.building,color: Colors.green[300]),
            ),
            maxLines: 1,
          ),
        ),
        Container(
          // width: MediaQuery.of(context).size.width*0.8,
          // height: MediaQuery.of(context).size.height*0.3,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          color: Colors.white,

          child: ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width*0.7, 30),
              backgroundColor: Colors.green[400],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
            ),
            child: const Text("Cập nhật",style: TextStyle(color: Colors.white),),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width*1,
          height: MediaQuery.of(context).size.height*0.2,
          color: Colors.white,
        )
      ],
    );
  }
}