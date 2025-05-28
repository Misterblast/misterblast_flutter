import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/widgets/app_back_button.dart';
import 'package:misterblast_flutter/src/widgets/change_local_button.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Opacity(
              opacity: 0.4,
              child: Image.asset(
                "assets/images/home_decor.png",
              ),
            ),
            Positioned(
              top: 25,
              child: Opacity(
                opacity: 0.4,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(200),
                  ),
                  child: Image.asset(
                    "assets/images/tugas-icon.png",
                    scale: 2,
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
            ),
            Column(
              spacing: 16,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppBackButton(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                      ChangeLocalButton(),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: Center(
                      child: Text(
                        "Tugas akan segera hadir",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
