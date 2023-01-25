import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';

import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/state.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDark=false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit,NotesStates>(
      listener: (context,state){},
      builder: (context,state){
          return Padding(
          padding: const EdgeInsets.all(10),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
              children: [
                // User card
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/user.jpg',
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                    Text(
                      'طاهر صلاح',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'tahersalah@gmail.com',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        // navigate(context, EditScreen());
                        print('ontap');
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                        width: 210,
                        decoration: BoxDecoration(
                            color: Colors.lime,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  offset: Offset(0, 5.0),
                                  blurRadius: 5)
                            ]),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'تعديل الملف الشخصي',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Icon(Icons.arrow_back_ios_new_outlined,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),

                SettingsGroup(
                  items: [
                    SettingsItem(
                      onTap: () {},
                      icons: CupertinoIcons.pencil_outline,
                      iconStyle: IconStyle(),
                      title: 'المظهر',
                      subtitle: "تغيير المظهر الخاص بالبرنامج",
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.dark_mode_rounded,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors.red,
                      ),
                      title: 'الوضع الليلي',
                      subtitle: "الافتراضي",
                      trailing: Switch.adaptive(
                        value: isDark,
                        onChanged: (value) {
                          setState(() {
                            isDark = value;
                            // ignore: avoid_print
                            print(value);
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SettingsGroup(
                  items: [
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.info_rounded,
                      iconStyle: IconStyle(
                        backgroundColor: Colors.purple,
                      ),
                      title: 'من نحن ؟  ',
                      subtitle: "تعرف عنا اكتر",
                    ),
                  ],
                ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.question_circle,
                  iconStyle: IconStyle(),
                  title: 'مساعدة',
                  subtitle: "لتقديم مساعدة اكثر حول البرنامج",
                ),

                // You can add a settings title
                SettingsGroup(
                  settingsGroupTitle: "اعدادات الحساب",
                  items: [
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.exit_to_app_rounded,
                      title: "تسجيل الخروج",
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: CupertinoIcons.delete_solid,
                      iconStyle: IconStyle(
                          iconsColor: Colors.red, backgroundColor: Colors.white),
                      title: "حذف الحساب",
                      titleStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
