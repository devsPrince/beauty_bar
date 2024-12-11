import 'package:flutter/material.dart';

class FadeTransitionPage extends PageRouteBuilder {
  final Widget page;

  FadeTransitionPage({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: Tween<double>(begin: 1.0, end: 0.5).animate(secondaryAnimation),
        child: ScaleTransition(
          scale: animation,
          child: child,
        ), // Use the previous page as child
      );
    },
  );
}



class CustomPageRoute extends PageRouteBuilder {
  final Widget child;


  CustomPageRoute( {
    required this.child,
  }) : super(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      ScaleTransition(
        scale: animation,
        child: child,
      );
}

class CustomPageRouteLR extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;


  CustomPageRouteLR({
    required this.child, required this.direction, RouteSettings? settings,
  }) : super(
          transitionDuration: const Duration(milliseconds: 200),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: getBeginOffset(),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );

  Offset getBeginOffset(){
    switch(direction){
      case AxisDirection.up:
        return const Offset(0, 1);
        case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.right:
        return const Offset(-1, 0);
        case AxisDirection.left:
        return const Offset(1, 0);
    }
  }


}




class RotationRoute extends PageRouteBuilder {
  final Widget child;
  RotationRoute({required this.child})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    child,
    transitionDuration: const Duration(seconds: 1),
    reverseTransitionDuration: const Duration(seconds: 1),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        RotationTransition(
          turns: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.linear,
            ),
          ),
          child: child,
        ),
  );
}




class SizeRoute extends PageRouteBuilder {
  final Widget page;
  SizeRoute({required this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    reverseTransitionDuration: const Duration(seconds: 1),
    transitionDuration: const Duration(seconds: 1),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        Align(
          child: SizeTransition(
            sizeFactor: animation,
            child: child,
          ),
        ),
  );
}



class FadeRoute extends PageRouteBuilder {
  final Widget page;
  final int duration;
  FadeRoute({required this.page, this.duration = 200})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,transitionDuration:  Duration(milliseconds: duration),reverseTransitionDuration:  Duration(milliseconds: duration),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}




class ScaleRotateRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRotateRoute({required this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionDuration: const Duration(seconds: 1),
    reverseTransitionDuration: const Duration(seconds: 1),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        ScaleTransition(
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            ),
          ),
          child: RotationTransition(
            turns: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.linear,
              ),
            ),
            child: child,
          ),
        ),
  );
}





class ScalePageRouteLR extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;


  ScalePageRouteLR({
    required this.child, required this.direction, RouteSettings? settings,
  }) : super(
    transitionDuration: const Duration(seconds: 1),
    reverseTransitionDuration: const Duration(seconds: 1),
    pageBuilder: (context, animation, secondaryAnimation) => child,
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) =>
      ScaleTransition(
        scale: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,
          ),
        ),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: getBeginOffset(),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      );


  Offset getBeginOffset(){
    switch(direction){
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.left:
        return const Offset(1, 0);
    }
  }


}




class FadePageRouteLR extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;


  FadePageRouteLR({
    required this.child, required this.direction, RouteSettings? settings,
  }) : super(
    transitionDuration: const Duration(seconds: 1),
    reverseTransitionDuration: const Duration(seconds: 1),
    pageBuilder: (context, animation, secondaryAnimation) => child,
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) =>

      SlideTransition(
        position: Tween<Offset>(
          begin: getBeginOffset(),
          end: Offset.zero,
        ).animate(animation),
        child:
        FadeTransition(
          opacity: animation,
          child: child,
        ),
      );


  Offset getBeginOffset(){
    switch(direction){
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.left:
        return const Offset(1, 0);
    }
  }


}




class FadeScalePageRoute extends PageRouteBuilder {
  final Widget child;


  FadeScalePageRoute( {
    required this.child,
  }) : super(
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) => child,
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) =>
      ScaleTransition(
        scale: animation,
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
}





class ScaleFadePageRouteLR extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;


  ScaleFadePageRouteLR({
    required this.child, required this.direction, RouteSettings? settings,
  }) : super(
    transitionDuration: const Duration(seconds: 1),
    reverseTransitionDuration: const Duration(seconds: 1),
    pageBuilder: (context, animation, secondaryAnimation) => child,
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) =>

      SlideTransition(
        position: Tween<Offset>(
          begin: getBeginOffset(),
          end: Offset.zero,
        ).animate(animation),
        child:
        ScaleTransition(
          scale: animation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        )
      );


  Offset getBeginOffset(){
    switch(direction){
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.left:
        return const Offset(1, 0);
    }
  }


}

