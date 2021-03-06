import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:relate/enum/user_state.dart';
import 'package:relate/models/user.dart';
import 'package:relate/pagewiews/chats/widgets/shimmering_logo.dart';
import 'package:relate/provider/image_upload_provider.dart';
import 'package:relate/provider/user_provider.dart';
import 'package:relate/resources/firebase_repository.dart';
import 'package:relate/screens/LoginScreen.dart';
import 'package:relate/screens/chatscreens/widgets/cached_image.dart';
import 'package:relate/utils/variables.dart';
import 'package:relate/widgets/custom_appbar.dart';
import 'package:relate/widgets/header_curved_container.dart';

class UserDetailsContainer extends StatelessWidget {
  final FirebaseRepository _repository = FirebaseRepository();

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
//////////////////////////////////////////////////////////////////////////////////////////////////////sign out debug needed
    signOut() async {
      final bool isLoggedOut = await FirebaseRepository().signOut();
      if (isLoggedOut) {
        // set userState to offline as the user logs out'
        _repository.setUserState(
          userId: userProvider.getUser.uid,
          userState: UserState.Offline,
        );

        // move the user to login screen
        Navigator.pushAndRemoveUntil(
          //This transfers the user to a desired page and removes the previous pages from the navigator stack
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) =>
              false, //clear all previous pages when returns false...
        );
      }
    }

    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Column(
        children: <Widget>[
          CustomAppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.maybePop(context),
            ),
            centerTitle: true,
            title: ShimmeringLogo(),
            // title: Image.asset("assets/app_logo.png"),
            actions: <Widget>[
              FlatButton(
                onPressed: () => signOut(),
                child: Text(
                  "Log Out",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              )
            ],
          ),
          UserDetailsBody(),
        ],
      ),
    );
  }
}

class UserDetailsBody extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final Users user = userProvider.getUser;

    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Stack(children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 5,
                    ),
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(user.profilePhoto),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Variables.blackColor,
                    child: IconButton(
                      icon: Icon(Icons.edit),
                      //////////////////////////////////////////implement edition of profile picture
                      onPressed: () {
                        ////////////////////////////////profile image update////////////////////////////////////////////////////////
                        showModalBottomSheet(
                            context: context, builder: ((builder) => bottomSheet()),
                        );
                      },
                    ),
                  ),
                ),
              ]),
              SizedBox(height: 50,),
              Expanded(
                child: Container(
                  // color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 10,
                        shadowColor: Colors.blueAccent,
                        child: Container(
                          // height: 100,

                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("USERNAME", style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18,
                                ),),
                                SizedBox(height: 15,),
                                Text(user.username, style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ],
                            ),
                          ),
                        ),

                      ),
                      Card(
                        elevation: 10,
                        shadowColor: Colors.blueAccent,
                        child: Container(
                          // height: 100,

                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("EMAIL", style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18,
                                ),),
                                SizedBox(height: 15,),
                                Text(user.email, style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ],
                            ),
                          ),
                        ),

                      ),

                      // Center(
                      //   child:
                      //   Container(
                      //
                      //     // width: MediaQuery.of(context).size.width - 20,
                      //     height: 100,
                      //     child: Text(
                      //       "USERNAME",
                      //       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.blueGrey),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Padding(
          //   padding: EdgeInsets.only(bottom: 150, left: 130),
          //   child:
          // ),
        ],
      ),
    );

    // return Container(
    //   padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    //   child: Row(
    //     children: [
    //       CachedImage(
    //         user.profilePhoto,
    //         isRound: true,
    //         radius: 50,
    //       ),
    //       SizedBox(width: 15),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: <Widget>[
    //           Text(
    //             user.name,
    //             style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //               fontSize: 18,
    //               color: Colors.white,
    //             ),
    //           ),
    //           SizedBox(height: 10),
    //           Text(
    //             user.email,
    //             style: TextStyle(fontSize: 14, color: Colors.white),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget bottomSheet() {
    return StatefulBuilder(
      builder: (context, setState) => Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Text(
              "Choose your profile photo from",
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.camera),
                  label: Text("Camera"),
                ),
                FlatButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.camera),
                  label: Text("Gallery"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
