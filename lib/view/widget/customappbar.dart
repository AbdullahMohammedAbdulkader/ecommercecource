import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar ;
  //final void Function()? onPressedIcon ;
  final void Function()? onPressedSearch ;
  final void Function()? onPressedFavorite ;
  final void Function(String)? onChanged ;
  final TextEditingController myController ;
  const CustomAppBar({Key? key,
    required this.titleappbar,
    //this.onPressedIcon,
    this.onPressedSearch,
    required this.onPressedFavorite,
    this.onChanged,
    required this.myController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(child: TextFormField(
            controller: myController,
            onChanged: onChanged ,
            decoration: InputDecoration(
              prefixIcon: IconButton(icon: Icon(Icons.search), onPressed: onPressedSearch),
              hintText: titleappbar,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          )),
          SizedBox(width: 10),

          /*

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            width: 60,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
              onPressed: onPressedIcon,
              icon: Icon(
                  Icons.notifications_active_outlined,
                  size: 30,
                  color: Colors.grey[600]
              ),
            ),
          ),

           */

          SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            width: 60,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
              onPressed: onPressedFavorite,
              icon: Icon(
                  Icons.favorite_border_outlined,
                  size: 30,
                  color: Colors.grey[600]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
