import 'package:diagflow_app/presentation/screens/chat_screen.dart';
import 'package:diagflow_app/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) {
        final dialogFlowtter = Provider.of<DialogFlowtter>(context);
        return ChatScreen(dialogFlowtter: dialogFlowtter);
      },
    ),
  ],
);
