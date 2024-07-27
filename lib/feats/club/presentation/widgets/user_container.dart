import 'package:dot_coaching/core/core.dart';
import 'package:dot_coaching/feats/feats.dart';
import 'package:dot_coaching/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserContainer extends StatelessWidget {
  final UserModel user;
  final int clubId;
  const UserContainer({super.key, required this.user, required this.clubId});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: theme.colorScheme.primaryContainer.withOpacity(0.1),
        ),
        padding: EdgeInsets.all(8.w),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24.r,
              backgroundImage: NetworkImage(user.image.sanitize()),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: theme.textTheme.bodyLarge,
                ),
                Chirp(
                  text: user.role.name.capitalize,
                  style: theme.textTheme.bodySmall,
                  color: user.role.color,
                )
              ],
            ),
            const Spacer(),
            PopupMenuButton(
              popUpAnimationStyle: AnimationStyle(
                curve: Easing.emphasizedDecelerate,
                duration: const Duration(milliseconds: 500),
              ),
              icon: const Icon(Icons.more_vert),
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(width: 8),
                        Text('Edit'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    child: const Row(
                      children: [
                        Icon(Icons.delete),
                        SizedBox(width: 8),
                        Text('Kick'),
                      ],
                    ),
                    onTap: () =>
                        context.read<ClubCubit>().kick(clubId, user.id),
                  ),
                ];
              },
            )
          ],
        ),
      ),
    );
  }
}