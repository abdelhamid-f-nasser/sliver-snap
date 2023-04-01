
<h1 align="center">Sliver Snap</h1>

<p style="text-align: center"> 🚀 Sliver Snap is a Flutter package that simplifies the process of adding collapsible and expandable
app bars to your app. It offers smooth transitions that respond seamlessly to user scrolling and
snaps to the appropriate mode when the user stops scrolling midway. 💻 It's highly customizable and
provides a user-friendly experience. Say goodbye to manual implementation and make your Flutter app
more interactive and intuitive with Sliver Snap. 🤯 </p>

[//]: # (Add Badges here)
[//]: # (
<p align="center">
[//]: # (  <a href="https://flutter.dev">
[//]: # (    <img src="https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter"
[//]: # (      alt="Platform" />
[//]: # (  </a>
[//]: # (  <a href="https://pub.dartlang.org/packages/animated_text_kit">
[//]: # (    <img src="https://img.shields.io/pub/v/animated_text_kit.svg"
[//]: # (      alt="Pub Package" />
[//]: # (  </a>
[//]: # (  <a href="https://github.com/aagarwal1012/Animated-Text-Kit/actions?query=workflow%3ACI">
[//]: # (    <img src="https://img.shields.io/github/workflow/status/aagarwal1012/Animated-Text-Kit/CI?logo=github"
[//]: # (      alt="Build Status" />
[//]: # (  </a>
[//]: # (  <a href="https://opensource.org/licenses/MIT">
[//]: # (    <img src="https://img.shields.io/github/license/aagarwal1012/animated-text-kit?color=red"
[//]: # (      alt="License: MIT" />
[//]: # (  </a>
[//]: # (  <a href="https://github.com/Solido/awesome-flutter#animation">
[//]: # (    <img src="https://img.shields.io/badge/Awesome-Flutter-FC60A8?logo=awesome-lists"
[//]: # (      alt="Awesome Flutter" />
[//]: # (  </a>
[//]: # (  <a href="https://www.paypal.me/aagarwal1012">
[//]: # (    <img src="https://img.shields.io/badge/Donate-PayPal-00457C?logo=paypal"
[//]: # (      alt="Donate" />
[//]: # (  </a>
[//]: # (</p><br>
)

# Table of contents
- [Preview](#preview)
- [Installing](#installing)
    - [1. Depend on it](#1-depend-on-it)
    - [2. Install it](#2-install-it)
    - [3. Import it](#3-import-it)
- [Basic Usage](#basic-usage)
    - [Properties](#properties)
    - [Extra Components](#extra-components)
      - [`CollapsedAppBarContent` Widget](#collapsedappbarcontent-widget)
- [Additional information](#additional-information)

<br/>

# Preview

| basic | Customizable | Performance |
| ----- | ------------ | ----------- |
|       |              |             |


# Installing

### 1. Depend on it

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  sliver_snap: ^1.0.0
```

or you can add the latest version from the command line:

```bash
flutter pub add sliver_snap
```


### 2. Install it

You can install packages from the command line with `Flutter`:

```
$ flutter pub get
```

### 3. Import it

Now in your `Dart` code, you can use:

```dart
import 'package:sliver_snap/sliver_snap.dart';
```

# Basic Usage

```dart
  SliverSnap(
    onCollapseStateChanged: (isCollapsed, scrollingOffset, maxExtent) {},
    collapsedBackgroundColor: Colors.black,
    expandedBackgroundColor: Colors.transparent,
    backdropWidget: Image.network(
      "https://picsum.photos/800/1200",
      fit: BoxFit.cover,
    ),
    bottom: const PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: Icon(
        Icons.directions_boat,
        color: Colors.blue,
        size: 45,
      ),
    ),
    expandedContentHeight: 400,
    expandedContent: const Center(
      child: Icon(
        Icons.ac_unit_sharp,
        color: Colors.amber,
        size: 70,
      ),
    ),
    collapsedContent:
    const Icon(Icons.car_crash, color: Colors.green, size: 45),
    body: const Material(
      elevation: 7,
      child: Placeholder(),
    ),
  );
```

### Properties

| Property                  | Type                     | Default Value           | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|---------------------------|--------------------------|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| expandedContent           | Widget                   | ----------------------- | The content that is shown when expanded. <br> It is a **required** property.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| collapsedContent          | Widget                   | ----------------------- | The appbar Which is shown when collapsed. <br> It is a **required** property.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| body                      | Widget                   | ----------------------- | The content shown below the appbar. <br> It is a **required** property.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| pinned                    | boolean                  | true                    | Whether the appbar will be fixed at the top of the scroll view, meaning it will always be visible to the user as they scroll through the content. Although the appbar can still change in size as the user scrolls, it will not be scrolled out of view like other elements in the scroll view.                                                                                                                                                                                                                                                                                                                                 |
| collapsedBarHeight        | double                   | 60.0                    | The height of the `collapsedContent`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| animationDuration         | Duration                 | 300 milliseconds        | The duration of the scroll animation which happens when automatically snapping to the collapsed or the expanded widgets.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| animationCurve            | Curve                    | Curves.easeInOut        | The `Curve` of the scroll animation which happens when automatically snapping to the collapsed or the expanded widgets.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| snap                      | boolean                  | false                   | Controls the behavior of a floating app bar when the user scrolls. When `snap` is `false`, the app bar will move smoothly with the content as the user scrolls, and will be dismissed smoothly when the user scrolls down. However, when `snap` is `true`, the app bar will have a more rigid behavior. It will snap into view when the user scrolls up, and snap out of view when the user scrolls down. Additionally, when the user interacts with any part of the floating app bar, such as clicking on a `TextField`, the app bar will snap fully into view so that the user can see and interact with all of its contents. |
| floating                  | boolean                  | false                   | Whether the app bar should become visible as soon as the user scrolls towards the app bar. Otherwise, the user will need to scroll near the top of the scroll view to reveal the app bar.                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| stretch                   | boolean                  | false                   | Whether the app bar should stretch to fill the over-scroll area. The appbar can still expand and contract as the user scrolls, but it  will also stretch when the user over-scrolls.                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| expandedContentHeight     | double?                  | ----------------------- | The height of the `expandedContent`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| bottom                    | PreferredSizeWidget?     | ----------------------- | The widget that appears across the bottom of the appbar. For example a `TabBar`. <br> This widget has to **implement** a `PreferredSizeWidget`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| automaticallyImplyLeading | bool?                    | false                   | Provides Control of the AppBar's leading widget. When set to `true`, the framework will automatically add a leading widget <br> When set to `false` , no leading widget will be added automatically.                                                                                                                                                                                                                                                                                                                                                                                                                            |
| leading                   | Widget?                  | ----------------------- | The leading widget at the start both the `expandedContent` and the `collapsedContent`, typically an `Icon` or an `IconButton`. It can also be a `BackButton`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| actions                   | List<Widget>?            | ----------------------- | A list of action widgets to display in a row after the `collapsedContent` widget.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| backdropWidget            | Widget?                  | ----------------------- | The content that is shown below the appbar. In most cases it's just the page content.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| expandedBackgroundColor   | Color?                   | ----------------------- | The background `Color` of the `expandedContent` widget.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| collapsedBackgroundColor  | Color?                   | ----------------------- | The background `Color` of the `collapsedContent` widget.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| scrollController          | ScrollController?        | ----------------------- | Can be used to pass your own `scrollController` to customize the appbar even more.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| scrollBehavior            | ScrollBehaviour?         | ----------------------- | How the scrollable widgets behave, either `Material` or `Cupertino` Scrolling behaviors.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| onCollapseStateChanged    | CollapsingStateCallback? | ----------------------- | Callback which is called when the is collapsed or expanded; used to find out the collapsed/expanded state, scrolling offset and the max Extent of the scroll.                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |


This is the CollapsingStateCallback function signature:
```dart
typedef CollapsingStateCallback = void Function(
  bool isCollapsed,
  double scrollingOffset,
  double maxExtent,
);
```

### Extra Components

The below are supplementary widgets that can help you build the appbar faster.

#### `CollapsedAppBarContent` Widget
This can be used to create a custom `collapsedContent` widget. It has the following properties:
1. leading: This is the `leading` widget specifically for the `collapsedContent` Appbar. Don't use this with the `leading` widget for the whole `Appbar`. As they will overlap.
2. title: The middle widget between the `leading` and the `trailing` of the `collapsedContent` Appbar.,
3. trailing: The widget that is displayed at the rightmost part of the `collapsedContent`.

The below snippet demonstrates it's basic usage:

```dart
      CollapsedAppBarContent(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text('title'),
        trailing: SizedBox(
          height: 40,
          child: Image.network(
            'https://picsum.photos/800/1200',
            fit: BoxFit.cover,
          ),
        ),
      ),
```


#### Please check the below example for a way to add a `leading` widget only to the `expandedContent`

```dart
class ExpandedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(...),
        // Place whichever widget you want below, and it will show as a leading widget.
        const SafeArea(
          child: BackButton(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
```



and in such scenario, don't add the leading widget to the `CollapsedAppBarContent` widget
or the `SliverSnap` widget.




# Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
