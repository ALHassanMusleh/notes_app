import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_hive_app/constant.dart';
import 'package:notes_hive_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 36,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 38,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

  // List<Color> colors = const [
  //   Color(0xffF18F01),
  //   Color(0xffffcd7a),
  //   Color(0xff048BA8),
  //   Color(0xff79155B),
  //   Color(0xffC23373),
  //   Color(0xffF6635C),
  //   Color(0xffFFBA86),
  //   Color(0xff11009E),
  //   Color(0xff4942E4),
  //   Color(0xff8696FE),
  //   Color(0xffC4B0FF),
  // ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2, // reduis = 32 => height = 32* 2
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kcolors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color = kcolors[index];
                setState(() {});
              },
              child: ColorItem(
                isActive: currentIndex == index,
                color: kcolors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
