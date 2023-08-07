import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:prayer/cubits/cubit/theme_cubit.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar({
    super.key,
    required this.surahName,
    required this.Juz,
    required this.index,
    required this.onPressed,
  });
  final String surahName;
  final int Juz;
  final int index;
  int? markNumber;
  final void Function()? onPressed;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    var box = Hive.box('quran');
    widget.markNumber = box.get('mark');
    super.initState();
  }

  Color? color;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ThemeCubit, ThemeState>(
      listener: (context, state) {
        color = BlocProvider.of<ThemeCubit>(context).darkTheme
            ? Colors.white
            : Colors.black;
      },
      child: Row(
        children: [
          IconButton(
              onPressed: widget.onPressed, icon: const Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                var box = Hive.box('quran');
                box.put('mark', widget.index);
                color = Colors.purple;
                setState(() {});
              },
              icon: Icon(
                Icons.bookmark,
                size: 40,
                color:
                    widget.index == widget.markNumber ? Colors.purple : color,
              )),
          const SizedBox(
            width: 10,
          ),
          const Spacer(),
          Text(
            '   ${widget.surahName}',
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(
            width: 25,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              'الجزء ${widget.Juz}',
              style: const TextStyle(fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}
