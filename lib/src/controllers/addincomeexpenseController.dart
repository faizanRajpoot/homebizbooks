import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/controllers/incomeExpenseController.dart';
import 'package:hbb/src/utils/helpers/api_helper.dart';

class AddIncomeExpenseController extends GetxController {
  final IncomeExpenseController inExpCont = Get.put(IncomeExpenseController());
  TextEditingController dateinput = TextEditingController();
  TextEditingController incomeSource = TextEditingController();
  TextEditingController amount = TextEditingController();
  dynamic selectedReason;
  dynamic selectedIncomeExpense;
  RxBool isExpense = false.obs;
  RxBool loader = true.obs;
  RxBool updateloader = true.obs;

  void edit(index) {
    dateinput.text = inExpCont.incomeExpenseData[index]['expensedate'];
    amount.text =
        inExpCont.incomeExpenseData[index]['expenseamount'].toString();
    if (inExpCont.incomeExpenseData[index]['income'] == 1) {
      incomeSource.text = inExpCont.incomeExpenseData[index]['expensereason'];
    }
  }

  void upDate() async {
    var id = inExpCont.editId;
    print(id);
    if (dateinput.text.isEmpty) {
      Get.snackbar('Error', 'Select Date',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }
    if (amount.text.isEmpty) {
      Get.snackbar('Error', 'Enter Amount',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }
    if (selectedIncomeExpense == null) {
      Get.snackbar('Error', 'Select Type Income or Expense',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }

    if (selectedIncomeExpense == 'Expense') {
      if (selectedReason == null) {
        Get.snackbar('Error', 'Select Expense reason',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
        return;
      }
    }

    if (selectedIncomeExpense == 'Income') {
      if (incomeSource.text.isEmpty) {
        Get.snackbar('Error', 'Please Tell your source of income',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
        return;
      }
    }

    var obj = {
      "expenseamount": amount.text,
      "incexp": selectedIncomeExpense == 'Income' ? 1 : 0,
      "editreason": "Test",
      "expensereason": selectedReason,
      "incomereason": incomeSource.text == '' ? 'kkk' : incomeSource.text,
      "expensedate": dateinput.text
    };
    updateloader.value = false;
    await apiFetcher('Put', '/api/expense/$id', obj);
    updateloader.value = true;
    Get.snackbar('Success', 'Your Incom Expense has Updated',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.shade400,
        colorText: Colors.white);
    dateinput.text = '';
    amount.text = '';
    selectedReason == null;
    incomeSource.text = '';
    selectedIncomeExpense == null;
  }

  void save() async {
    if (dateinput.text.isEmpty) {
      Get.snackbar('Error', 'Select Date',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }
    if (amount.text.isEmpty) {
      Get.snackbar('Error', 'Enter Amount',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }
    if (selectedIncomeExpense == null) {
      Get.snackbar('Error', 'Select Type Income or Expense',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }

    if (selectedIncomeExpense == 'Expense') {
      if (selectedReason == null) {
        Get.snackbar('Error', 'Select Expense reason',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
        return;
      }
    }

    if (selectedIncomeExpense == 'Income') {
      if (incomeSource.text.isEmpty) {
        Get.snackbar('Error', 'Please Tell your source of income',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
        return;
      }
    }
    loader.value = false;
    // print(incomeSource.text.runtimeType);
    var obj = {
      "expenseamount": amount.text,
      "incexp": selectedIncomeExpense == 'Income' ? 1 : 0,
      "editreason": "Test",
      "expensereason": selectedReason,
      "incomereason": incomeSource.text == '' ? 'kkk' : incomeSource.text,
      "expensedate": dateinput.text
    };
    await apiFetcher('Post', '/api/expense', obj);
    loader.value = true;
    Get.snackbar('Success', 'Your Incom Expense will created',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.shade400,
        colorText: Colors.white);

    // Get.back();
    dateinput.text = '';
    amount.text = '';
    selectedReason == null;
    incomeSource.text = '';
    selectedIncomeExpense == null;
  }
}
