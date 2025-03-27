import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PTextField extends StatelessWidget {
  const PTextField({
    TextEditingController? controller,
    String? text,
    double? marginTop,
    double? marginBottom,
    TextAlignVertical? textAlignVertical = TextAlignVertical.center,
    int? maxLength,
    int? maxLine = 1,
    AutovalidateMode? autoValidateMode = AutovalidateMode.disabled,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
    InputDecoration? decoration,
    Color? fillColor,
    TextAlign? textAlign = TextAlign.start,
    TextStyle? style,
    TextStyle? titleStyle,
    String? hintText,
    TextStyle? hintStyle,
    TextDirection? hintTextDirection,
    Widget? suffixIcon,
    Widget? prefixIcon,
    double? borderWidth = 1.0,
    bool? enabled = true,
    bool? enableInteractive,
    double? height,
    super.key,
    String Function(String)? onChanged,
    FormFieldValidator<String>? textFunction,
    bool? obSecure,
    void Function()? onTap,
    EdgeInsets? contentPadding,
    FocusNode? focusNode,
    void Function()? onEditingComplete,
    bool? disable,
    TextDirection? textDirection,
    Function(String)? onFieldSubmitted,
    bool? autoFocus,
    TextInputAction? textInputAction,
    InputBorder? inputBorder,
    BoxConstraints? prefixIconConstraints,
    BoxConstraints? suffixIconConstraints,
    bool? isDense,
    bool? expands,
    TapRegionCallback? onTapOutside,
  })  : _controller = controller,
        _text = text,
        _marginTop = marginTop,
        _marginBottom = marginBottom,
        _textAlignVertical = textAlignVertical,
        _maxLength = maxLength,
        _maxLine = maxLine,
        _autoValidateMode = autoValidateMode,
        _inputFormatters = inputFormatters,
        _keyboardType = keyboardType,
        _decoration = decoration,
        _fillColor = fillColor,
        _textAlign = textAlign,
        _style = style,
        _titleStyle = titleStyle,
        _hintText = hintText,
        _hintStyle = hintStyle,
        _hintTextDirection = hintTextDirection,
        _suffixIcon = suffixIcon,
        _prefixIcon = prefixIcon,
        // _borderWidth = borderWidth,
        _enabled = enabled,
        _enableInteractive = enableInteractive,
        _height = height,
        _onChanged = onChanged,
        _textFunction = textFunction,
        _obSecure = obSecure,
        _onTap = onTap,
        _contentPadding = contentPadding,
        _focusNode = focusNode,
        _onEditingComplete = onEditingComplete,
        _disable = disable,
        _textDirection = textDirection,
        _onFieldSubmitted = onFieldSubmitted,
        _autoFocus = autoFocus,
        _textInputAction = textInputAction,
        _inputBorder = inputBorder,
        _prefixIconConstraints = prefixIconConstraints,
        _suffixIconConstraints = suffixIconConstraints,
        _isDense = isDense,
        _expands = expands,
        _onTapOutside = onTapOutside;

  final String? _text;
  final double? _marginTop;
  final double? _marginBottom;
  final TextAlignVertical? _textAlignVertical;
  final int? _maxLength;
  final int? _maxLine;
  final AutovalidateMode? _autoValidateMode;
  final List<TextInputFormatter>? _inputFormatters;
  final TextInputType? _keyboardType;
  final InputDecoration? _decoration;
  final Color? _fillColor;
  final TextAlign? _textAlign;
  final TextStyle? _style;
  final TextStyle? _titleStyle;

  final FormFieldValidator<String>? _textFunction;
  final TextEditingController? _controller;
  final String? _hintText;
  final TextStyle? _hintStyle;
  final TextDirection? _hintTextDirection;
  final Widget? _suffixIcon;
  final Widget? _prefixIcon;

  // final double? _borderWidth;
  final bool? _enabled;
  final bool? _enableInteractive;
  final double? _height;
  final Function(String)? _onChanged;
  final bool? _obSecure;
  final Function()? _onTap;
  final EdgeInsets? _contentPadding;
  final FocusNode? _focusNode;
  final Function()? _onEditingComplete;
  final bool? _disable;
  final TextDirection? _textDirection;
  final Function(String)? _onFieldSubmitted;
  final bool? _autoFocus;
  final bool? _isDense;
  final bool? _expands;
  final TextInputAction? _textInputAction;
  final InputBorder? _inputBorder;
  final BoxConstraints? _prefixIconConstraints;
  final BoxConstraints? _suffixIconConstraints;
  final TapRegionCallback? _onTapOutside;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _text != null && _text.isNotEmpty
            ? Text(
                _text,
                style: _titleStyle,
              )
            : const SizedBox.shrink(),
        SizedBox(height: _marginTop),
        SizedBox(
          height: _height,
          child: TextFormField(
            focusNode: _focusNode,
            onTapOutside: _onTapOutside,
            textInputAction: _textInputAction,
            autofocus: _autoFocus ?? false,
            onEditingComplete: _onEditingComplete,
            onTap: (_enableInteractive ?? true)
                ? () {
                    if (_controller!.text.isNotEmpty) {
                      if (_controller.selection == TextSelection.fromPosition(TextPosition(offset: _controller.text.length - 1))) {
                        _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
                      }
                    }
                    _onTap;
                  }
                : _onTap,
            enabled: _enabled,
            autovalidateMode: _autoValidateMode,
            textAlignVertical: _textAlignVertical,
            enableInteractiveSelection: _enableInteractive ?? true,
            maxLength: _maxLength,
            maxLines: _maxLine,
            validator: _textFunction,
            obscureText: _obSecure ?? false,
            inputFormatters: _inputFormatters,
            keyboardType: _keyboardType,
            textDirection: _textDirection ?? TextDirection.ltr,
            onFieldSubmitted: _onFieldSubmitted,
            onChanged: _onChanged,
            expands: _expands ?? false,
            decoration: _decoration ??
                const InputDecoration().applyDefaults(Theme.of(context).inputDecorationTheme).copyWith(
                      hintTextDirection: _hintTextDirection,

                      hintText: _hintText,
                      suffixIcon: _suffixIcon,
                      prefixIcon: _prefixIcon,
                      isDense: _isDense,
                      suffixIconConstraints: _suffixIconConstraints,

                      prefixIconConstraints: _prefixIconConstraints,
                      border: _inputBorder,
                      enabledBorder: _inputBorder,
                      focusedBorder: _inputBorder,

                      // suffixIconConstraints:
                      // BoxConstraints(minWidth: 100.w, maxWidth: 200),
                      contentPadding: _contentPadding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

                      // hintText: 'کلمه عبور فعلی خود را وارد نمایید ...',
                      hintStyle: _hintStyle ??
                          Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: const Color(0xff595f6b),
                              ),
                      fillColor: (_disable ?? false) ? Colors.transparent : _fillColor,
                      counterText: '',
                      alignLabelWithHint: true,
                    ),

            // decoration: _decoration ??
            // InputDecoration(
            //   filled: true,
            //   focusColor: Theme.of(context).inputDecorationTheme.fillColor,
            //   hintTextDirection: _hintTextDirection,
            //   suffixIcon: _suffixIcon,
            //   contentPadding: EdgeInsets.symmetric(horizontal: 47.w),
            //   // hintText: 'کلمه عبور فعلی خود را وارد نمایید ...',
            //   hintText: _hintText ?? '',
            //   hintStyle: TextStyle(
            //     fontSize: 35.sp,
            //     color: const Color(0xff595f6b),
            //   ),
            //   counterText: '',
            //   alignLabelWithHint: true,
            //   enabledBorder: OutlineInputBorder(
            //     borderSide: BorderSide(
            //       width: _borderWidth!,
            //       color: const Color(0xff595f6b),
            //     ),
            //   ),
            //   focusedBorder: OutlineInputBorder(
            //     borderSide: BorderSide(
            //       width: _borderWidth!,
            //       color: const Color(0xff595f6b),
            //     ),
            //   ),
            //   border: OutlineInputBorder(
            //     borderSide: BorderSide(
            //       width: _borderWidth!,
            //       color: const Color(0xff595f6b),
            //     ),
            //   ),
            // ),
            textAlign: _textAlign!,
            style: _style ?? Theme.of(context).textTheme.bodySmall,
            controller: _controller,
          ),
        ),
        SizedBox(height: _marginBottom),
      ],
    );
  }
}
