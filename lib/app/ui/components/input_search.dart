import 'dart:async';

import 'package:tictactoe/app/core/common/constants/app_colors.dart';
import 'package:tictactoe/app/ui/components/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class InputSearch extends StatefulWidget {
  final String? label;
  final TextInputType keyboard;
  final TextEditingController controller;
  final String? Function(String?)? validation;
  final AutovalidateMode autovalidateMode;
  final List<TextInputFormatter>? formatter;
  final String? hint;
  final int? minLines;
  final int? maxLines;
  final bool readOnly;
  final bool showError;
  final Function(String?)? onChange;
  final Future<void> Function(String?) searchAction;
  final Function()? onTap;
  final FocusNode? focusNode;
  final Widget? prefixIcon;

  const InputSearch(
    this.controller, {
    super.key,
    this.label,
    required this.searchAction,
    this.keyboard = TextInputType.text,
    this.formatter,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.hint,
    this.minLines,
    this.maxLines,
    this.readOnly = false,
    this.showError = true,
    this.onTap,
    this.onChange,
    this.focusNode,
    this.prefixIcon,
  });

  const InputSearch.numeric(
    this.controller, {
    super.key,
    this.label,
    required this.searchAction,
    this.keyboard = TextInputType.number,
    this.formatter,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.hint,
    this.minLines,
    this.maxLines,
    this.readOnly = false,
    this.showError = true,
    this.onTap,
    this.onChange,
    this.focusNode,
    this.prefixIcon,
  });
  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  bool visible = false;

  Timer? searchTimer;

  void search() {
    searchTimer?.cancel();

    searchTimer = Timer(const Duration(milliseconds: 300), () async {
      await widget.searchAction(widget.controller.text);
      if (mounted) setState(() {});
    });

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null) ...[
              Text(widget.label!, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Gap(5),
            ],
            TextFormField(
              key: widget.key,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              controller: widget.controller,
              autovalidateMode: widget.autovalidateMode,
              validator: widget.validation,
              inputFormatters: widget.formatter,
              keyboardType: widget.keyboard,
              minLines: widget.minLines,
              maxLines: widget.maxLines ?? 1,
              readOnly: widget.readOnly,
              obscureText: widget.keyboard == TextInputType.visiblePassword ? !visible : false,
              onChanged: (_) {
                widget.onChange?.call(_);
                search();
              },
              onTap: widget.onTap,
              focusNode: widget.focusNode,
              style: TextStyle(
                color: AppColors.grey_600.withOpacity(0.8),
                fontSize: 18,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.white,
                errorMaxLines: 2,
                prefixIcon: widget.prefixIcon,
                hintText: widget.hint,
                suffixIcon: searchTimer?.isActive == true
                    ? const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Loader(
                            size: 20,
                          ),
                        ],
                      )
                    : widget.controller.text.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              widget.controller.clear();
                              widget.searchAction('');
                            },
                            child: const Icon(
                              Icons.cancel,
                              color: AppColors.grey_600,
                              size: 20,
                            ),
                          )
                        : const Gap(0),
                suffixIconColor: AppColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
