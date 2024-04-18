import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/controllers/addincomeexpenseController.dart';
import 'package:hbb/src/ui/widgets/commonClasses.dart';
import 'package:hbb/src/utils/uidata/text_styles.dart';
// import 'package:hbb/src/utils/uidata/text_styles.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class AddIncomeexpense extends StatelessWidget {
  AddIncomeexpense({super.key});
  final AddIncomeExpenseController _ = Get.find<AddIncomeExpenseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        // ),
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_outlined,
                  size: Get.width * 0.05,
                  color: Colors.black,
                )),
            Text(
              'Add Income Expense',
              style: UIDataTextStyles.headingtextbold,
            ).paddingSymmetric(horizontal: Get.width * 0.015),
          ],
        ).marginSymmetric(
            vertical: Get.height * .02, horizontal: Get.width * .04),
        // DateField
        SizedBox(
            width: Get.width / 1.09,
            child: TextFormField(
              onFieldSubmitted: (__) {
                // _.updateCheck.value ? _.Update2(i) : _.Update();
                // _.cs.fetchedItems();
              },
              style: TextStyle(color: Colors.black),
              controller: _.dateinput,
              decoration: const InputDecoration(
                  labelText: "Enter Date",
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  )),
              readOnly: true,
              onTap: () async {
                DateTime currentDate = DateTime.now();
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: currentDate);

                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);

                  _.dateinput.text = formattedDate;
                } else {
                  print("Date is not selected");
                }
              },
            )),
        // Amount TextField
        GoalsTextField(
          width: Get.width / 1.09,
          controller: _.amount,
          hintText: '',
          heading: 'Add Amount',
          readonly: false,
        ).marginOnly(left: Get.width * 0.02),
        // Select Type Income or Expense
        Container(
          width: Get.width / 1.09,
          height: Get.height * .045,
          child: DropdownButtonFormField(
              style: TextStyle(
                fontSize: Get.width * .025,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: "Select Income or Expense",
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: Get.width * .025,
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: Get.height * .01, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  gapPadding: 0.0,
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
              ),
              iconEnabledColor: Colors.black,
              iconSize: Get.width * .04,
              value: _.selectedIncomeExpense,
              items: const [
                DropdownMenuItem<String>(
                  value: 'Income',
                  child: Text('Income'),
                ),
                DropdownMenuItem<String>(
                  value: 'Expense',
                  child: Text('Expense'),
                ),
              ],
              onChanged: (value) {
                _.selectedIncomeExpense = value;
                // print(_.selectedIncomeExpense);
                if (_.selectedIncomeExpense == 'Expense') {
                  _.isExpense.value = true;
                } else {
                  _.isExpense.value = false;
                }
              }),
        ),

        // Select Reason

        Obx(
          () => _.isExpense.value
              ? Container(
                  width: Get.width / 1.09,
                  height: Get.height * .045,
                  child: DropdownButtonFormField(
                      style: TextStyle(
                        fontSize: Get.width * .025,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: "Select Reason",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: Get.width * .025,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: Get.height * .01, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          gapPadding: 0.0,
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      iconEnabledColor: Colors.black,
                      iconSize: Get.width * .04,
                      value: _.selectedReason,
                      items: const [
                        DropdownMenuItem<String>(
                          value: '1',
                          child: Text('Advertising'),
                        ),
                        DropdownMenuItem<String>(
                          value: '2',
                          child: Text('Air Fare'),
                        ),
                        DropdownMenuItem<String>(
                          value: '4',
                          child: Text('Bank Charges'),
                        ),
                        DropdownMenuItem<String>(
                          value: '5',
                          child: Text('Books, publications'),
                        ),
                        DropdownMenuItem<String>(
                          value: '6',
                          child: Text('Bus and Taxi fares'),
                        ),
                        DropdownMenuItem<String>(
                          value: '30',
                          child: Text('Business Association'),
                        ),
                        DropdownMenuItem<String>(
                          value: '7',
                          child: Text('Business Opportunity Meeting'),
                        ),
                        DropdownMenuItem<String>(
                          value: '8',
                          child: Text('Cell Phone'),
                        ),
                        DropdownMenuItem<String>(
                          value: '9',
                          child: Text('Computers'),
                        ),
                        DropdownMenuItem<String>(
                          value: '10',
                          child: Text('Entertainment'),
                        ),
                        DropdownMenuItem<String>(
                          value: '35',
                          child: Text('Home Biz Books Free'),
                        ),
                        DropdownMenuItem<String>(
                          value: '11',
                          child: Text('Home Office'),
                        ),
                        DropdownMenuItem<String>(
                          value: '12',
                          child: Text('Home Office Maintainence'),
                        ),
                        DropdownMenuItem<String>(
                          value: '13',
                          child: Text('Home Office Supplies'),
                        ),
                        DropdownMenuItem<String>(
                          value: '14',
                          child: Text('Home Office Utilities'),
                        ),
                        DropdownMenuItem<String>(
                          value: '15',
                          child: Text('Home Phone'),
                        ),
                        DropdownMenuItem<String>(
                          value: '19',
                          child: Text('Insurance'),
                        ),
                        DropdownMenuItem<String>(
                          value: '20',
                          child: Text('Internet Access'),
                        ),
                        DropdownMenuItem<String>(
                          value: '32',
                          child: Text('Laundary Services'),
                        ),
                        DropdownMenuItem<String>(
                          value: '33',
                          child: Text('Leagal Fees'),
                        ),
                        DropdownMenuItem<String>(
                          value: '21',
                          child: Text('Lodging'),
                        ),
                        DropdownMenuItem<String>(
                          value: '18',
                          child: Text('Marketing Supplies'),
                        ),
                        DropdownMenuItem<String>(
                          value: '22',
                          child: Text('Meals'),
                        ),
                        DropdownMenuItem<String>(
                          value: '34',
                          child: Text('Membership Fees'),
                        ),
                        DropdownMenuItem<String>(
                          value: '23',
                          child: Text('Mileage'),
                        ),
                        DropdownMenuItem<String>(
                          value: '24',
                          child: Text('Parking'),
                        ),
                        DropdownMenuItem<String>(
                          value: '25',
                          child: Text('Postage'),
                        ),
                        DropdownMenuItem<String>(
                          value: '26',
                          child: Text('Prizes, Awards'),
                        ),
                        DropdownMenuItem<String>(
                          value: '28',
                          child: Text('Tolls'),
                        ),
                        // DropdownMenuItem<String>(
                        //   value: 'Other',
                        //   child: Text('Other'),
                        // ),
                      ],
                      onChanged: (value) {
                        _.selectedReason = value;
                      }),
                )
              : GoalsTextField(
                  width: Get.width / 1.09,
                  controller: _.incomeSource,
                  hintText: '',
                  heading: 'Income Source',
                  readonly: false,
                ).marginOnly(left: Get.width * 0.02),
        ),

// Buttons
        Obx(
          () => Row(
            children: [
              OutlineButton(
                ontap: () {
                  _.inExpCont.getData();
                  Get.back();
                },
                border: Border.all(
                  width: 2,
                  color: Colors.red,
                ),
                width: Get.width * 0.2,
                color: Colors.red,
                child: Text(
                  'Cancel',
                  style:
                      TextStyle(color: Colors.red, fontSize: Get.width * 0.03),
                ),
              ),
              Spacer(),
              _.inExpCont.isUpdate.value
                  ? Obx(
                      () => _.updateloader.value
                          ? FillButton(
                              ontap: () {
                                // _.save();
                                _.upDate();
                              },
                              width: Get.width * 0.2,
                              color: Colors.red,
                              child: Text(
                                'Update',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Get.width * 0.03),
                              ),
                            )
                          : CircularProgressIndicator(),
                    )
                  : Obx(
                      () => _.loader.value
                          ? FillButton(
                              ontap: () {
                                _.save();
                              },
                              width: Get.width * 0.2,
                              color: Colors.red,
                              child: Text(
                                'Save',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Get.width * 0.03),
                              ),
                            )
                          : CircularProgressIndicator(),
                    )
            ],
          ).marginSymmetric(horizontal: Get.width * 0.04),
        )
      ],
    ));
  }
}
