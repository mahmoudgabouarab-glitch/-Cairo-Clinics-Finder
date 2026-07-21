import 'package:cached_network_image/cached_network_image.dart';
import 'package:cairo_clinics_finder/core/network/service_locator.dart';
import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:cairo_clinics_finder/feature/chat/data/model/conversation_model.dart';
import 'package:cairo_clinics_finder/feature/chat/presentation/view/widgets/unread_badge.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OneItemOfConversation extends StatelessWidget {
  final ConversationModel conversation;
  const OneItemOfConversation({super.key, required this.conversation});

  bool get _isPatient =>
      getIt<FirebaseAuth>().currentUser?.uid == conversation.patientId;

  String get _title {
    if (_isPatient) return conversation.clinicName;
    return conversation.patientName.isEmpty
        ? conversation.clinicName
        : conversation.patientName;
  }

  String? get _image =>
      _isPatient ? conversation.clinicImage : conversation.patientImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.push(GoTo.chat, extra: {'conversation': conversation}),
      child: CustomCard(
        child: Row(
          children: [
            _avatar(context),
            spaceW(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.f14SemiBoldBlack,
                  ),
                  spaceH(4),
                  Text(
                    conversation.lastMessage.isEmpty
                        ? '—'
                        : conversation.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.f13Grey,
                  ),
                ],
              ),
            ),
            spaceW(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _formatTime(conversation.lastMessageTime),
                  style: AppTextStyles.f11Grey,
                ),
                spaceH(6),
                UnreadBadge(
                  count: conversation.unreadFor(
                    getIt<FirebaseAuth>().currentUser?.uid,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _avatar(BuildContext context) {
    final image = _image;
    if (image != null && image.isNotEmpty) {
      return Container(
        width: 54.r,
        height: 54.r,
        decoration: BoxDecoration(
          color: AppColor.chipBg(context),
          borderRadius: BorderRadius.circular(12.r),
          image: DecorationImage(
            image: CachedNetworkImageProvider(image),
            fit: BoxFit.cover,
          ),
        ),
      );
    }
    return Container(
      width: 54.r,
      height: 54.r,
      decoration: BoxDecoration(
        gradient: AppColor.detailsAppBar,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(
        _isPatient ? Icons.local_hospital_outlined : Icons.person_outline,
        color: Colors.white70,
        size: 24.sp,
      ),
    );
  }

  String _formatTime(DateTime? time) {
    if (time == null) return '';
    final now = DateTime.now();
    final isSameDay =
        now.year == time.year && now.month == time.month && now.day == time.day;
    String two(int n) => n.toString().padLeft(2, '0');
    if (isSameDay) return '${two(time.hour)}:${two(time.minute)}';
    return '${two(time.day)}/${two(time.month)}';
  }
}
