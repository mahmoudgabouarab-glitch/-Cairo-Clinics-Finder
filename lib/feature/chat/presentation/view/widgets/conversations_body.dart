import 'package:cairo_clinics_finder/core/utils/app_text_styles.dart';
import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_loading.dart';
import 'package:cairo_clinics_finder/feature/chat/presentation/view/widgets/conversations_empty.dart';
import 'package:cairo_clinics_finder/feature/chat/presentation/view/widgets/one_item_of_conversation.dart';
import 'package:cairo_clinics_finder/feature/chat/presentation/view_model/conversations_cubit/conversations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConversationsBody extends StatelessWidget {
  const ConversationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationsCubit, ConversationsState>(
      builder: (context, state) {
        if (state is ConversationsLoading || state is ConversationsInitial) {
          return Padding(
            padding: EdgeInsets.all(24.w),
            child: CustomLoading.linearLoading(),
          );
        }
        if (state is ConversationsFailure) {
          return Center(
            child: Text(state.message, style: AppTextStyles.f14Grey),
          );
        }
        if (state is ConversationsSuccess) {
          if (state.conversations.isEmpty) return const ConversationsEmpty();
          return ListView.separated(
            padding: EdgeInsets.all(16.w),
            itemCount: state.conversations.length,
            separatorBuilder: (_, _) => spaceH(12),
            itemBuilder: (context, index) => OneItemOfConversation(
              conversation: state.conversations[index],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
