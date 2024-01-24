import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                    controller: controller.usernameController,
                    decoration: InputDecoration(hintText: "Masukkan Username"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "username tidak boleh kosoeng";
                      }
                      return null;
                    }
                ),
                TextFormField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(hintText: "Maukkan Password"),
                    validator: (value) {
                      if (value!.length <5) {
                        return "password tidak boleh kosong";
                      }
                      return null;
                    }
                ),
                Obx(() => controller.loading.value?
                  const CircularProgressIndicator():
                  ElevatedButton(onPressed: () {
                      controller.login();
                  }, child: Text("Login") )
                ),
                  ElevatedButton(onPressed: () => Get.toNamed(Routes.REGISTER), child: Text("Register"),)
              ],
            ),
          )
      ),
    );
  }
}
