import 'package:cairo_clinics_finder/core/network/service_locator.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_loading.dart';
import 'package:cairo_clinics_finder/feature/chat/presentation/view/widgets/chat_input_field.dart';
import 'package:cairo_clinics_finder/feature/chat/presentation/view/widgets/message_bubble.dart';
import 'package:cairo_clinics_finder/feature/chat/presentation/view/widgets/chat_empty.dart';
import 'package:cairo_clinics_finder/feature/chat/presentation/view_model/chat_cubit/chat_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    final myId = getIt<FirebaseAuth>().currentUser?.uid ?? '';
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              if (state is ChatLoading || state is ChatInitial) {
                return Padding(
                  padding: EdgeInsets.all(24.w),
                  child: CustomLoading.linearLoading(),
                );
              }
              if (state is ChatFailure) {
                return Center(child: Text(state.message));
              }
              if (state is ChatSuccess) {
                if (state.messages.isEmpty) return const ChatEmpty();
                return ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 12.h,
                  ),
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final message =
                        state.messages[state.messages.length - 1 - index];
                    return MessageBubble(
                      message: message,
                      isMine: message.senderId == myId,
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
        const ChatInputField(),
      ],
    );
  }
}
