import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:gap/gap.dart';
import 'package:tictactoe/app/core/common/constants/app_colors.dart';
import 'package:tictactoe/app/core/common/constants/app_fonts.dart';
import 'package:tictactoe/app/core/common/errors/failures.dart';
import 'package:tictactoe/app/core/common/extensions/color_extension.dart';
import 'package:tictactoe/app/core/common/utils/toasting.dart';
import 'package:tictactoe/app/core/common/utils/vibrate.dart';
import 'package:tictactoe/app/ui/components/loader.dart';

// Custom buttons are created by extending the MaterialButton class
class Button extends StatefulWidget {
  final Future<void> Function()? onPressed;
  final Widget child;
  final ButtonStyle? style;
  final bool autofocus;
  final Clip clipBehavior;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChange;
  final ValueChanged<bool>? onHover;
  final VoidCallback? onLongPress;
  final bool secondary;
  final bool disabled;
  final bool bordered;
  final bool inverted;
  final Size? size;
  final Color? color;
  final EdgeInsets padding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  Button({
    super.key,
    required this.onPressed,
    required this.child,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.onFocusChange,
    this.onHover,
    this.onLongPress,
    this.size,
    this.color,
    this.suffixIcon,
    this.prefixIcon,
    this.padding = const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
    this.disabled = false,
    this.bordered = false,
  })  : secondary = false,
        inverted = false,
        style = ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: bordered ? const BorderSide(color: AppColors.primary, width: 2) : BorderSide.none,
            ),
          ),
          elevation: WidgetStateProperty.all<double>(disabled ? 0 : 2),
          backgroundColor: (disabled ? AppColors.primary.withOpacity(0.3) : color ?? AppColors.primary).toWidgetStateProperty(),
          foregroundColor: AppColors.white.toWidgetStateProperty(),
          textStyle: WidgetStateProperty.all<TextStyle?>(
            const TextStyle(color: Colors.white, fontWeight: AppFonts.bold),
          ),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            padding,
          ),
        );

  Button.small({
    super.key,
    required this.onPressed,
    required this.child,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.onFocusChange,
    this.onHover,
    this.onLongPress,
    this.color,
    this.suffixIcon,
    this.prefixIcon,
    this.padding = const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
    this.disabled = false,
    this.bordered = false,
  })  : secondary = false,
        inverted = false,
        size = const Size(double.infinity, 40),
        style = ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: bordered ? const BorderSide(color: AppColors.primary, width: 2) : BorderSide.none,
            ),
          ),
          elevation: WidgetStateProperty.all<double>(disabled ? 0 : 2),
          backgroundColor: (disabled ? AppColors.primary.withOpacity(0.3) : color ?? AppColors.primary).toWidgetStateProperty(),
          foregroundColor: AppColors.white.toWidgetStateProperty(),
          textStyle: WidgetStateProperty.all<TextStyle?>(
            const TextStyle(color: Colors.white, fontWeight: AppFonts.bold),
          ),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            padding,
          ),
        );

  Button.secundary({
    super.key,
    required this.onPressed,
    required this.child,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.onFocusChange,
    this.onHover,
    this.onLongPress,
    this.padding = const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
    this.size,
    this.color,
    this.suffixIcon,
    this.prefixIcon,
    this.disabled = false,
    this.bordered = true,
  })  : secondary = false,
        inverted = false,
        style = ButtonStyle(
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide.none,
            ),
          ),
          elevation: WidgetStateProperty.all<double>(1),
          backgroundColor: (color ?? (disabled ? AppColors.blue_800.withOpacity(0.5) : AppColors.blue_800)).toWidgetStateProperty(),
          foregroundColor: (disabled ? AppColors.grey_300 : AppColors.grey_300).toWidgetStateProperty(),
          textStyle: WidgetStateProperty.all<TextStyle?>(
            const TextStyle(fontWeight: AppFonts.bold),
          ),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            padding,
          ),
        );

  Button.third({
    super.key,
    required this.onPressed,
    required this.child,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.onFocusChange,
    this.onHover,
    this.onLongPress,
    this.padding = const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
    this.size,
    this.color,
    this.suffixIcon,
    this.prefixIcon,
    this.disabled = false,
    this.bordered = true,
  })  : secondary = false,
        inverted = false,
        style = ButtonStyle(
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: bordered ? const BorderSide(color: AppColors.grey_300, width: 1) : BorderSide.none,
            ),
          ),
          elevation: WidgetStateProperty.all<double>(1),
          backgroundColor: (color ?? (disabled ? AppColors.grey_300.withOpacity(0.5) : AppColors.grey_300)).toWidgetStateProperty(),
          foregroundColor: (disabled ? AppColors.grey_700 : AppColors.grey_700).toWidgetStateProperty(),
          textStyle: WidgetStateProperty.all<TextStyle?>(
            const TextStyle(fontWeight: AppFonts.bold),
          ),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            padding,
          ),
        );

  Button.inverted({
    super.key,
    required this.onPressed,
    required this.child,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.onFocusChange,
    this.onHover,
    this.onLongPress,
    this.size,
    this.suffixIcon,
    this.prefixIcon,
    this.color,
    this.padding = const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
    this.disabled = false,
    this.bordered = false,
  })  : secondary = false,
        inverted = true,
        style = ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: bordered ? const BorderSide(color: AppColors.primary, width: 2) : BorderSide.none,
            ),
          ),
          elevation: WidgetStateProperty.all<double>(disabled ? 0 : 2),
          backgroundColor: (disabled ? AppColors.white.withOpacity(0.5) : color ?? AppColors.white).toWidgetStateProperty(),
          foregroundColor: AppColors.primary.toWidgetStateProperty(),
          textStyle: WidgetStateProperty.all<TextStyle?>(
            const TextStyle(color: AppColors.primary, fontWeight: AppFonts.bold),
          ),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            padding,
          ),
        );

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isLoading = false;
  late Future<void> Function() action;

  @override
  void initState() {
    action = () async {
      if (!mounted) return;
      try {
        if (widget.onPressed == null) return;

        isLoading = true;
        if (!mounted) return;
        setState(() {});

        vibrate(FeedbackType.light);
        await widget.onPressed!();

        isLoading = false;
        if (!mounted) return;
        setState(() {});
      } catch (err) {
        if (!mounted) return;
        if (err is TypeError) {
          Toasting.error(context, title: 'Erro: $err', stackTrace: err.stackTrace);
          return;
        }
        if (err is Failure) {
          Toasting.error(context, title: 'Erro: $err', stackTrace: err.stackTrace);
          return;
        }
        if (err is Exception) {
          Toasting.error(context, title: 'Erro: $err');
          return;
        }
        Toasting.error(context, title: 'Erro: $err');
      }
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var newChild = widget.child;
    // if (widget.child is Text) {
    //   Text text = widget.child as Text;
    //   newChild = Text(text.data!.toUpperCase(), style: text.style);
    // }

    Widget suffix = widget.suffixIcon != null ? widget.suffixIcon! : Gap(widget.prefixIcon != null ? 24 : 0);
    Widget preffix = widget.prefixIcon != null ? widget.prefixIcon! : Gap(widget.suffixIcon != null ? 24 : 0);
    return FilledButton(
      onPressed: widget.disabled ? null : action,
      autofocus: widget.autofocus,
      clipBehavior: widget.clipBehavior,
      focusNode: widget.focusNode,
      onFocusChange: widget.onFocusChange,
      onHover: widget.onHover,
      onLongPress: widget.disabled
          ? null
          : () {
              if (widget.onLongPress != null) {
                vibrate(FeedbackType.light);
                widget.onLongPress!();
              }
            },
      style: widget.style?.copyWith(
        fixedSize: widget.size != null ? WidgetStateProperty.all<Size>(widget.size!) : null,
      ),
      child: isLoading
          ? Loader(size: 16, inverted: !widget.inverted)
          : Row(
              mainAxisSize: widget.prefixIcon == null && widget.suffixIcon == null ? MainAxisSize.min : MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                preffix,
                newChild,
                suffix,
              ],
            ),
    );
  }
}
