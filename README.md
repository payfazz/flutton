# FLUTTON (A Flutter Skeleton)

Welcome to Flutton (a flutter skeleton) a framework used by Payfazz's flutter developer team to build a robust and standarized flutter application. Right now Flutton is still on development. The development plan will separated into these parts:

1. Dependency Injection System

   A system for creating service registry

1. Navigation System with Dependency Injection

   Make a helper system to maximize the use of flutter routing navigation system.
   Firsly there will be a main navigation system. This navigation system will
   We trying to make use of stacking navigation system from flutter and use it as dependency injection system

Structure:

- Main
- App (we are injecting our dependency injection system here using provider)
- Router
- Widget (name doesn't need to include widget)
  if the view simple, the architecture over here, if not:
  - bloc provider & bloc
  - screen (as dumb as possible)

Type of screen:

- Load from initiate
- action button full block
- full bloc (no need helper)

multi stage navigation

- Router /recharge-mobile --- Router
- Widget (with bloc provider) --- RechargeMobile
- Sub router --- RechargeMobileRouter
  - /phone --- RechargeMobilePhone
    - widget
  - /plan --- RechargeMobilePlan
    - widget
