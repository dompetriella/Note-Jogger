import 'package:flutter/material.dart';
import 'floating_staff.dart';
import 'note.dart';

class NoteStaff extends StatelessWidget {
  final int value;
  const NoteStaff({
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 2.0, color: Theme.of(context).colorScheme.secondary)),
        ),
        Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Stack(
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StaffLine(),
                      StaffLine(),
                      StaffLine(),
                      StaffLine(),
                      StaffLine(),
                    ],
                  ),
                  Stack(
                    children: [
                      if (value > 24)
                        const Positioned(
                            left: 150,
                            bottom: 290,
                            child: FloatingStaffWidget()),
                      if (value > 22)
                        const Positioned(
                            left: 150,
                            bottom: 270,
                            child: FloatingStaffWidget()),
                      if (value > 20)
                        const Positioned(
                            left: 150,
                            bottom: 250,
                            child: FloatingStaffWidget()),
                      if (value > 18)
                        const Positioned(
                            left: 150,
                            bottom: 230,
                            child: FloatingStaffWidget()),
                      if (value < 8)
                        const Positioned(
                            left: 150,
                            bottom: 110,
                            child: FloatingStaffWidget()),
                      if (value < 6)
                        const Positioned(
                            left: 150,
                            bottom: 90,
                            child: FloatingStaffWidget()),
                      if (value < 4)
                        const Positioned(
                            left: 150,
                            bottom: 70,
                            child: FloatingStaffWidget()),
                      if (value < 2)
                        const Positioned(
                            left: 150,
                            bottom: 50,
                            child: FloatingStaffWidget()),
                    ],
                  )
                ],
              ),
              Center(
                child: Note(
                  value: value,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StaffLine extends StatelessWidget {
  const StaffLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(.50),
                  width: 2))),
    );
  }
}
