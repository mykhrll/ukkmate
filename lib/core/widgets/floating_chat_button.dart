import 'package:flutter/material.dart';
import 'package:ukkmate/core/theme/app_colors.dart';
import 'package:ukkmate/features/chatbot/chatbot_screen.dart';

/// A floating action button for the AI chatbot assistant.
///
/// This widget is used across student and teacher roles.
/// It can be hidden during active exam sessions.
class FloatingChatButton extends StatefulWidget {
  /// Whether the button is currently visible.
  final bool visible;

  /// Callback when the chat button is tapped.
  final VoidCallback? onPressed;

  const FloatingChatButton({
    super.key,
    this.visible = true,
    this.onPressed,
  });

  @override
  State<FloatingChatButton> createState() => _FloatingChatButtonState();
}

class _FloatingChatButtonState extends State<FloatingChatButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    if (widget.visible) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(covariant FloatingChatButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visible != oldWidget.visible) {
      if (widget.visible) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        if (_opacityAnimation.value == 0) return const SizedBox.shrink();
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16, right: 4),
        child: FloatingActionButton(
          onPressed: widget.onPressed ??
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ChatBotScreen()),
                );
              },
          backgroundColor: AppColors.primaryBlue,
          elevation: 6,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.smart_toy_outlined,
            color: Colors.white,
            size: 26,
          ),
        ),
      ),
    );
  }
}
