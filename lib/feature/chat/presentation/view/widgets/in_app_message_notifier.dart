import 'dart:async';

import 'package:cairo_clinics_finder/core/network/service_locator.dart';
import 'package:cairo_clinics_finder/core/routing/routing_import.dart';
import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/feature/chat/data/model/conversation_model.dart';
import 'package:cairo_clinics_finder/feature/chat/presentation/view_model/conversations_cubit/conversations_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InAppMessageNotifier extends StatefulWidget {
  final Widget child;
  const InAppMessageNotifier({super.key, required this.child});

  @override
  State<InAppMessageNotifier> createState() => _InAppMessageNotifierState();
}

class _InAppMessageNotifierState extends State<InAppMessageNotifier> {
  Map<String, int> _lastUnread = {};
  bool _seeded = false;

  OverlayEntry? _entry;
  Timer? _timer;

  @override
  void dispose() {
    _removeBanner();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConversationsCubit, ConversationsState>(
      listenWhen: (_, current) => current is ConversationsSuccess,
      listener: (context, state) {
        if (state is! ConversationsSuccess) return;
        final myId = getIt<FirebaseAuth>().currentUser?.uid;

        if (_seeded) {
          for (final convo in state.conversations) {
            final prev = _lastUnread[convo.id] ?? 0;
            final now = convo.unreadFor(myId);
            if (now > prev && convo.lastMessage.isNotEmpty) {
              _showBanner(convo, myId);
            }
          }
        }

        _lastUnread = {
          for (final c in state.conversations) c.id: c.unreadFor(myId),
        };
        _seeded = true;
      },
      child: widget.child,
    );
  }

  void _removeBanner() {
    _timer?.cancel();
    _timer = null;
    _entry?.remove();
    _entry = null;
  }

  void _showBanner(ConversationModel convo, String? myId) {
    final overlay = AppRouting.navigatorKey.currentState?.overlay;
    if (overlay == null) return;

    final isPatient = myId == convo.patientId;
    final sender = isPatient
        ? convo.clinicName
        : (convo.patientName.isEmpty ? convo.clinicName : convo.patientName);

    _removeBanner();

    _entry = OverlayEntry(
      builder: (context) => _BannerCard(
        sender: sender,
        message: convo.lastMessage,
        onTap: () {
          _removeBanner();
          AppRouting.router.push(GoTo.chat, extra: {'conversation': convo});
        },
        onDismiss: _removeBanner,
      ),
    );
    overlay.insert(_entry!);
    _timer = Timer(const Duration(seconds: 4), _removeBanner);
  }
}

class _BannerCard extends StatelessWidget {
  final String sender;
  final String message;
  final VoidCallback onTap;
  final VoidCallback onDismiss;

  const _BannerCard({
    required this.sender,
    required this.message,
    required this.onTap,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 8.h,
      left: 12.w,
      right: 12.w,
      child: Material(
        color: Colors.transparent,
        child: Dismissible(
          key: const ValueKey('in_app_message_banner'),
          direction: DismissDirection.up,
          onDismissed: (_) => onDismiss(),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(14.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.chat_bubble_outline, color: Colors.white),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          sender,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.f14SemiBoldBlack.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          message,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
