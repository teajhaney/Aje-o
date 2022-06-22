// ignore_for_file: use_build_context_synchronously

import 'package:ajeo_test/model/movie_details.dart';
import 'package:ajeo_test/resource/auth_methods.dart';

import 'package:ajeo_test/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void signOut() async {
    await AuthMethods().signOutUser();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pictures',
          style: textTheme.headline1!.copyWith(color: mobileBackgroundColor),
        ),
        actions: [
          TextButton(
              onPressed: signOut,
              child: Text(
                'Sign out',
                style: textTheme.headline1!
                    .copyWith(fontSize: 20, color: mobileBackgroundColor),
              ))
        ],
      ),
      body: GridView.custom(
          padding: const EdgeInsets.fromLTRB(
              padding10, padding10, padding10, padding0),
          gridDelegate: SliverWovenGridDelegate.count(
            pattern: [
              const WovenGridTile(1),
              const WovenGridTile(
                5 / 7,
                crossAxisRatio: 0.9,
                alignment: AlignmentDirectional.centerEnd,
              ),
            ],
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            tileBottomSpace: 30,
          ),
          childrenDelegate: SliverChildBuilderDelegate(
              childCount: movieDetails.length, (context, index) {
            return Column(
              children: [
                Expanded(
                  flex: 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage(movieDetails[index].imagePoster),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    movieDetails[index].movieName,
                    style: textTheme.headline1!
                        .copyWith(color: primaryColor, fontSize: padding20),
                  ),
                )
              ],
            );
          })),
    );
  }
}
