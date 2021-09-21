import 'dart:async';

import 'package:characters/characters.dart';
import 'package:flutter/material.dart';

abstract class AnimatedText {
  final String text;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final Duration duration;
  final Characters textCharacters;

  AnimatedText({
    required this.text,
    required this.duration,
    this.textAlign = TextAlign.start,
    this.textStyle,
  }) : textCharacters = text.characters;

  Duration? get remaining => null;

  void initAnimation(AnimationController controller);

  Widget textWidget(String data) => Text(
        data,
        textAlign: textAlign,
        style: textStyle,
      );

  Widget completeText(BuildContext context) => textWidget(text);

  Widget animatedBuilder(BuildContext context, Widget? child);
}

class AnimatedTextKit extends StatefulWidget {
  final List<AnimatedText> animatedTexts;
  final VoidCallback? onFinished;
  final Duration pause;
  final bool isRepeatingAnimation;
  final bool repeatForever;
  final int totalRepeatCount;

  const AnimatedTextKit({
    Key? key,
    required this.animatedTexts,
    this.pause = const Duration(milliseconds: 1000),
    this.onFinished,
    this.isRepeatingAnimation = false,
    this.totalRepeatCount = 1,
    this.repeatForever = false,
  })  : assert(animatedTexts.length > 0),
        assert(!isRepeatingAnimation || totalRepeatCount > 0 || repeatForever),
        assert(null == onFinished || !repeatForever),
        super(key: key);

  @override
  _AnimatedTextKitState createState() => _AnimatedTextKitState();
}

class _AnimatedTextKitState extends State<AnimatedTextKit>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late AnimatedText _currentAnimatedText;

  int _index = 0;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final completeText = _currentAnimatedText.completeText(context);

    return !_controller.isAnimating
        ? completeText
        : AnimatedBuilder(
            animation: _controller,
            builder: _currentAnimatedText.animatedBuilder,
            child: completeText,
          );
  }

  bool get _isLast => _index == widget.animatedTexts.length - 1;

  void _nextAnimation() {
    final isLast = _isLast;

    if (isLast) {
      return;
    } else {
      _index++;
    }

    if (mounted) setState(() {});

    _controller.dispose();

    _initAnimation();
  }

  void _initAnimation() {
    _currentAnimatedText = widget.animatedTexts.first;

    _controller = AnimationController(
      duration: _currentAnimatedText.duration,
      vsync: this,
    );

    _currentAnimatedText.initAnimation(_controller);

    _controller
      ..addStatusListener(_animationEndCallback)
      ..forward();
  }

  void _setPause() {
    if (mounted) setState(() {});
  }

  void _animationEndCallback(AnimationStatus state) {
    if (state == AnimationStatus.completed) {
      widget.onFinished?.call();
      _setPause();
      assert(null == _timer || !_timer!.isActive);
      _timer = Timer(widget.pause, _nextAnimation);
    }
  }
}

class TyperAnimatedText extends AnimatedText {
  final Duration speed;
  final Curve curve;

  TyperAnimatedText(
    String text, {
    TextAlign textAlign = TextAlign.start,
    TextStyle? textStyle,
    this.speed = const Duration(milliseconds: 120),
    this.curve = Curves.linear,
  }) : super(
          text: text,
          textAlign: textAlign,
          textStyle: textStyle,
          duration: speed * text.characters.length,
        );

  late Animation<double> _typingText;

  @override
  Duration get remaining => speed * (textCharacters.length - _typingText.value);

  @override
  void initAnimation(AnimationController controller) {
    _typingText = CurveTween(
      curve: curve,
    ).animate(controller);
  }

  @override
  Widget animatedBuilder(BuildContext context, Widget? child) {
    final count =
        (_typingText.value.clamp(0, 1) * textCharacters.length).round();

    assert(count <= textCharacters.length);
    return textWidget(textCharacters.take(count).toString());
  }
}
