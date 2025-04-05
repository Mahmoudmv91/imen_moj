import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imen_moj/core/const/assets_utils.dart';
import 'package:provider/provider.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/widgets/custom_fade_in_image.dart';
import '../managers/user_provider.dart';

class UsersWidget extends StatefulWidget {
  const UsersWidget({super.key});

  @override
  State<UsersWidget> createState() => _UsersWidgetState();
}

class _UsersWidgetState extends State<UsersWidget> {
  @override
  void initState() {
    var provider = context.read<UserProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.getAllUsers(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (_, provider, __) {
        return provider.userList.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  itemCount: provider.userList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = provider.userList[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AColors.containerBorderColor),
                        borderRadius: BorderRadius.circular(7.5),
                        color: Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CustomImageFadeWidget(
                              imagesURL: item.avatar ?? '',
                              isBase64: true,
                              boxFit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(item.name),
                                      const SizedBox(height: 5),
                                      Text(item.email),
                                      const SizedBox(height: 5),
                                      Text(item.createdAt ?? ''),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          provider.deleteUser();
                                          debugPrint(item.uid);
                                        },
                                        child: SvgPicture.asset(
                                          SvgAssets.ic_manage_delete_user,
                                          width: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      GestureDetector(
                                        onTap: () {
                                          provider.updateUser();
                                          debugPrint(item.name);
                                        },
                                        child: SvgPicture.asset(
                                          SvgAssets.ic_manage_update_user,
                                          width: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            : Center(
                child: Text('دیتایی برای نمایش وجود ندارد'),
              );
      },
    );
  }
}
