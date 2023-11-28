import 'package:flutter/material.dart';

class TopAppbarCart extends StatelessWidget {
  final String title ;
  const TopAppbarCart({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.arrow_back_ios,
                  )
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
