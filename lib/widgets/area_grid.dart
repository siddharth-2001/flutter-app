import 'package:flutter/material.dart';

import '../widgets/area_grid_item.dart';

class AreaGrid extends StatelessWidget {
  const AreaGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24),
      children: [
        AreaItem('assets/images/bed.svg', 'Bed Room', 4),
        AreaItem('assets/images/balcony.svg', 'Balcony', 2),
        AreaItem('assets/images/kitchen.svg', 'Kitchen', 5),
        AreaItem('assets/images/bathtube.svg', 'Bath Room', 1),
        AreaItem('assets/images/room.svg', 'Living Room', 2),
        AreaItem('assets/images/house.svg', 'Outdoor', 5)
      ],
    );
  }
}
