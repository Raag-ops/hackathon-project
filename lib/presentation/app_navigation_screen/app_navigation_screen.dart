import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import'bloc/app_navigation_bloc.dart';
import 'models/app_navigation_model.dart';
class ApNavigationScreen extends StatelessWidget {
const AppNavigationScreen({Key? key})
: super(
key: key,
);
static Widget builder(BuildContext context) {
return BlocProvider<AppNavigationBloc>(
create: (context) => AppNavigationBloc(AppNavigationState(
  appNavigationModelObj: AppNavigationModel(),
))
..add (AppNavigationInitialEvent()),
child: AppNavigationScreen(),
);
}
@override
Widget build (BuildContext context) 1
return BlocBuilder<AppNavigationBloc, AppNavigationState>( 
  builder: (context, state) {
return SafeArea(
   child: Scaffold(
backgroundColor: Color(OXFFFFFFFF),
 body: SizedBox(
width: double.maxFinite, 
child: Column 
children: [ 
  Container(
decoration: BoxDecoration( 
  color: Color (0XFFFFFFFF),
),
child: Column( 
  children: [
SizedBox(height: 10.h),
Padding(
padding: EdgeInsets symmetric(horizontal: 20.h),
 child: Text(
"App Navigation", 
textAlign: TextAlign.center, 
style: TextStyle(
  color: Color (0XFF000000), 
  fontSize: 20.fSize,
   fontFamily: 'Roboto', 
   fontWeight: FontWeight.w400,
),
),
),
SizedBox(height: 10.h),
Padding(

padding: EdgeInsets.only(left: 20.h),

child: Text(
"Check your app's UI from the demo screens of your apps"
textAlign: TextAlign.center,

style: TextStyle(

color: Color (0XFF888888),

fontSize: 16.fSize,

fontFamily: 'Roboto',

fontweight: FontWeight.w400,
),
),
),
SizedBox(height: 5.h),
Divider (
height: 1.h, 
thickness: 1.h, 
color: Color (0XFF000000),
)
  ],
),
  ),

Expanded (
child: SingleChildScrollView(
child: Container(
decoration: BoxDecoration 
color: color(0XFFFFFFFF),
),
child: Column ( 
children: [
buildScreenTitle( 
  context, 
  screenTitle: "registration",
onTapScreenTitle: () => onTapScreenTitle(
AppRoutes registrationScreen),
),
_buildScreenTitle(
  context, 
  screenTitle: "login",
  onTapScreenTitle: () => 
onTapScreenTitle(AppRoutes.loginScreen),
),

buildScreenTitle(
   context, 
   screenTitle: "splash", 
   onTapScreenTitle: () =>
onTapScreenTitle(AppRoutes.splashScreen),
),
_buildScreenTitle( 
  context,
   screenTitle: "dashboard",
    onTapScreenTitle: () =>
onTapScreenTitle(AppRoutes.dashboardScreen),

),
],
),
),
),
)
],
),
),
),
);
},
);
}
}

/// Common widget
Widget _buildScreenTitle(
BuildContext context, {
required String screenTitle,
 Function? onTapScreenTitle,
}) {
return GestureDetector ( 
  onTap: (){
onTapScreenTitle?.call();
},
child: Container
decoration: BoxDecoration 
color: Color(0XFFFFFFFF),
),
child: Column( 
  children: [
SizedBox(height: 10.h),
Padding(
padding: EdgeInsets.symmetric(horizontal: 20.h), 
child: Text( 
  screenTitle, 
  textAlign: TextAlign.center,
  style: TextStyle(
color: Color (0XFF000000), fontSize: 20.fSize, fontFamily: 'Roboto', fontWeight: FontWeight.w400,
),
),
),
SizedBox(height: 10.h),
SizedBoxheight: 5.h),
Divider (
height: 1.h, 
thickness: 1.h, 
color: Color (0XFF888888),
),
],
),
),
);
}
/// Common click event void onTapScreenTitle(String routeName) €
NavigatorService.pushNamed (routeName);
}
}