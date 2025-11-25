import 'package:flutter/material.dart';

enum MenuType {
  image('이미지', Icons.image),
  youtube('유튜브', Icons.video_library),
  theme('테마', Icons.color_lens);

  const MenuType(this.label, this.icon);
  final String label;
  final IconData icon;
}

class TypeChoice extends StatefulWidget {
  final Function(MenuType)? onSelectionChanged;

  const TypeChoice({super.key, this.onSelectionChanged});

  @override
  State<TypeChoice> createState() => _TypeChoiceState();
}

class _TypeChoiceState extends State<TypeChoice> {
  MenuType _selectedType = MenuType.image;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<MenuType>(
      segments: MenuType.values.map<ButtonSegment<MenuType>>((MenuType type) {
        return ButtonSegment<MenuType>(
          value: type,
          label: Text(type.label),
          icon: Icon(type.icon),
        );
      }).toList(),

      selected: <MenuType>{_selectedType},

      onSelectionChanged: (Set<MenuType> newSelection) {
        setState(() {
          _selectedType = newSelection.first;
        });

        if (widget.onSelectionChanged != null) {
          widget.onSelectionChanged!(_selectedType);
        }
      },

      multiSelectionEnabled: false,
      emptySelectionAllowed: false,
      showSelectedIcon: false,
      style: ButtonStyle(
        visualDensity: VisualDensity.compact,
        backgroundColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.selected)) {
            return const Color(0xFFD4E157);
          }
          return Colors.transparent;
        }),
      ),
    );
  }
}
