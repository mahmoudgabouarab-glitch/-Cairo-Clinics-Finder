import 'package:cairo_clinics_finder/feature/chat/presentation/view/widgets/chat_body.dart';
import 'package:cairo_clinics_finder/feature/chat/presentation/view_model/chat_cubit/chat_cubit.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final title = context.read<ChatCubit>().title;
    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: const SafeArea(child: ChatBody()),
    );
  }
}
