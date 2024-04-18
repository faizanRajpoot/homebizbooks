import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hbb/src/controllers/contactlistController.dart';
import 'package:hbb/src/utils/helpers/api_helper.dart';

class AddNewContactController extends GetxController {
  ContactListController contactListController =
      Get.put(ContactListController());
  // var id = Get.arguments;
  dynamic refValue;
  TextEditingController name = TextEditingController();
  TextEditingController lastnam = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController emai = TextEditingController();
  TextEditingController addres = TextEditingController();
  TextEditingController cit = TextEditingController();
  TextEditingController stat = TextEditingController();
  TextEditingController zipp = TextEditingController();

  void edit(int index) {
    name.text = contactListController.data[index]['firstname'];
    lastnam.text = contactListController.data[index]['lastname'];
    phoneNo.text = contactListController.data[index]['phone'];
    emai.text = contactListController.data[index]['email'];
    addres.text = contactListController.data[index]['address'];
    cit.text = contactListController.data[index]['city'];
    stat.text = contactListController.data[index]['state'];
    zipp.text = contactListController.data[index]['zip'];
    //  refValue = contactListController.data[index]['difficulty'];
  }

  void upDate() async {
  var id = contactListController.updateId;
    final difficulty = refValue;
    final firstname = name.text.trim();
    final lastname = lastnam.text.trim();
    final phone = phoneNo.text.trim();
    final email = emai.text.trim();
    final address = addres.text.trim();
    final city = cit.text.trim();
    final state = stat.text.trim();
    final zip = zipp.text.trim();

    // Validation
    if (firstname.isEmpty ||
        lastname.isEmpty ||
        phone.isEmpty ||
        email.isEmpty ||
        address.isEmpty ||
        city.isEmpty ||
        state.isEmpty ||
        zip.isEmpty) {
      Get.snackbar('Error', 'All fields are required',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }
    if (difficulty == null) {
      Get.snackbar('Error', 'Select Relation Level',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }
    if (state.length >= 3) {
      Get.snackbar('Error', 'State field required 2-letters',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email)) {
      Get.snackbar('Error', 'Enter a valid email',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }

    var obj = {
      "firstname": firstname,
      "lastname": lastname,
      "phone": phone,
      "email": email,
      "difficulty": difficulty,
      "address": address,
      "city": city,
      "state": state,
      "zip": zip,
    };

     await apiFetcher('Put', '/api/contact/$id', obj);

    refValue = null;
    name.text = '';
    lastnam.text = '';
    phoneNo.text = '';
    emai.text = '';
    addres.text = '';
    cit.text = '';
    stat.text = '';
    zipp.text = '';
    // Get.back();
    contactListController.getData();
  }

  void addContact() async {
    final difficulty = refValue;
    final firstname = name.text.trim();
    final lastname = lastnam.text.trim();
    final phone = phoneNo.text.trim();
    final email = emai.text.trim();
    final address = addres.text.trim();
    final city = cit.text.trim();
    final state = stat.text.trim();
    final zip = zipp.text.trim();

    // Validation
    if (firstname.isEmpty ||
        lastname.isEmpty ||
        phone.isEmpty ||
        email.isEmpty ||
        address.isEmpty ||
        city.isEmpty ||
        state.isEmpty ||
        zip.isEmpty) {
      Get.snackbar('Error', 'All fields are required',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }

    if (state.length > 3) {
      Get.snackbar('Error', 'State field required 2-letters',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email)) {
      Get.snackbar('Error', 'Enter a valid email',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }
    if (difficulty == null) {
      Get.snackbar('Error', 'Select Relation Level',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }
    var obj = {
      "firstname": firstname,
      "lastname": lastname,
      "phone": phone,
      "email": email,
      "difficulty": difficulty,
      "address": address,
      "city": city,
      "state": state,
      "zip": zip,
    };
    await apiFetcher('Post', '/api/contact', obj);

    refValue = null;
    name.text = '';
    lastnam.text = '';
    phoneNo.text = '';
    emai.text = '';
    addres.text = '';
    cit.text = '';
    stat.text = '';
    zipp.text = '';
    Get.back();
    contactListController.getData();
  }
}
