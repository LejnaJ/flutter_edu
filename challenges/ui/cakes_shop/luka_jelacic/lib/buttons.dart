import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malomalo/blocs/all.dart';

class Buttons extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  List<bool> ispressed = [false, false, false, false];
  List<int> kilograms = [1, 2, 3, 4];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            margin: EdgeInsets.only(right: 13.0),
            child: ButtonWrapper(
              title: "1 Kg",
              index: 0,
              imageUrl: "images/cake.png",
            )),
        Container(
            margin: EdgeInsets.only(right: 13.0),
            child: ButtonWrapper(
              title: "2 Kg",
              index: 1,
              imageUrl: "images/torta.png",
            )),
        Container(
            margin: EdgeInsets.only(right: 13.0),
            child: ButtonWrapper(
              title: "3 Kg",
              index: 2,
              imageUrl: "images/final.png",
            )),
        Container(
            margin: EdgeInsets.only(right: 13.0),
            child: ButtonWrapper(
              title: "4 Kg",
              index: 3,
              imageUrl: "images/torta.png",
            )),
      ]),
    );
  }
}

class ButtonWrapper extends StatelessWidget {
  final String title;
  final int index;
  final String imageUrl;

  ButtonWrapper(
      {@required this.title, @required this.index, @required this.imageUrl})
      : assert(title != null),
        assert(index != null),
        assert(imageUrl != null);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonBloc, ButtonState>(
      builder: (context, state) {
        return OutlinedButton(
            onPressed: () => context
                .read<ButtonBloc>()
                .add(ButtonPressEvent(index: index, imageUrl: imageUrl)),
            style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 5.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                backgroundColor: state.index == index
                    ? Color.fromRGBO(97, 93, 41, 1)
                    : Color.fromRGBO(47, 47, 79, 1),
                side: BorderSide(color: Color.fromRGBO(97, 93, 41, 1))),
            child: Text(
              title,
              style: TextStyle(
                  color: state.index == index
                      ? Colors.white
                      : Color.fromRGBO(97, 93, 41, 1)),
            ));
      },
    );
  }
}
