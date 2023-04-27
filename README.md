

![Sliver-Snap Banner Image](https://i.imgur.com/DaoWrvM.png)
<h1 align="center">Sliver Snap</h1>

<p align="center">
<a href="https://flutter.dev">
  <img src="https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter"
    alt="Platform" />
</a>
<a href="https://pub.dev/packages/sliver_snap">
  <img src="https://img.shields.io/badge/pub-1.0.1-blue"
    alt="Pub Package" />
</a>
<a href="https://github.com/A-Fawzyy/sliver-snap/blob/main/LICENSE">
  <img src="https://img.shields.io/github/license/aagarwal1012/animated-text-kit?color=red"
    alt="License: MIT" />
</a>
</p>


<p style="text-align: center"> 🚀 Sliver Snap is a Flutter package that simplifies the process of adding collapsible and expandable
app bars to your app. It offers smooth transitions that respond seamlessly to user scrolling and
snaps to the appropriate mode when the user stops scrolling midway. 💻 It's highly customizable and
provides a user-friendly experience. <br>
Say goodbye to manual implementation and make your Flutter app
more interactive and intuitive with Sliver Snap. 🤯 </p>

# Table of contents

- [Table of contents](#table-of-contents)
- [Preview](#preview)
- [Installing](#installing)
    - [1. Depend on it](#1-depend-on-it)
    - [2. Install it](#2-install-it)
    - [3. Import it](#3-import-it)
- [Basic Usage](#basic-usage)
    - [Properties](#properties)
- [Extra Components](#extra-components)
    - [1. Collapsed AppBar Content widget](#1-collapsed-appbar-content-widget)
    - [2. Expanded Content widget](#2-expanded-content-widget)
- [Additional information](#additional-information)
- [Bugs or Requests](#bugs-or-requests)



# Preview

| basic                                                                     | Performance                                                                    |
|---------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| ![Android Basic](https://i.giphy.com/media/5oqp3lPWEYD59g5VdK/giphy.webp) | ![PPerformance image](https://i.giphy.com/media/wSyFhyBjQWaXqNf5cA/giphy.webp) |


# Installing

### 1. Depend on it

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  sliver_snap: ^1.0.1
```

or you can add the latest version from the command line:

```bash
flutter pub add sliver_snap
```


### 2. Install it

You can install packages from the command line with `Flutter`:

```bash
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

| Property                  | Type                     | Default Value    | Description                                                                                                                                                                                                                                                                                                                                                                                                                                        |
|---------------------------|--------------------------|:-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| expandedContent           | Widget                   | N/A              | The content that is shown when expanded. <br> It is a **required** property.                                                                                                                                                                                                                                                                                                                                                                       |
| collapsedContent          | Widget                   | N/A              | The appbar Which is shown when collapsed. <br> It is a **required** property.                                                                                                                                                                                                                                                                                                                                                                      |
| body                      | Widget                   | N/A              | The content shown below the appbar. <br> It is a **required** property.                                                                                                                                                                                                                                                                                                                                                                            |
| pinned                    | boolean                  | true             | Whether the appbar will be fixed at the top of the scroll view.<br>For more information check the documentation For more information check the [<img height="15" src="https://storage.googleapis.com/cms-storage-bucket/4fd5520fe28ebf839174.svg" /> flutter docs](https://api.flutter.dev/flutter/material/SliverAppBar/pinned.html).                                                                                                             |
| collapsedBarHeight        | double                   | 60.0             | The height of the `collapsedContent`.                                                                                                                                                                                                                                                                                                                                                                                                              |
| animationDuration         | Duration                 | 300 milliseconds | The duration of the scroll animation which happens when automatically snapping to the collapsed or the expanded widgets.                                                                                                                                                                                                                                                                                                                           |
| animationCurve            | Curve                    | Curves.easeInOut | The `Curve` of the scroll animation which happens when automatically snapping to the collapsed or the expanded widgets.                                                                                                                                                                                                                                                                                                                            |
| snap                      | boolean                  | false            | Whether the app bar behave in a smooth or a rigid way as the it is scrolling.<br>For more information check the documentation [<img height="15" src="https://storage.googleapis.com/cms-storage-bucket/4fd5520fe28ebf839174.svg" />  flutter docs](https://api.flutter.dev/flutter/material/SliverAppBar/snap.html).                                                                                                                               |
| floating                  | boolean                  | false            | Whether the app bar should become visible as soon as the user scrolls towards the app bar.<br>For more information check the [<img height="15" src="https://storage.googleapis.com/cms-storage-bucket/4fd5520fe28ebf839174.svg" /> flutter docs](https://api.flutter.dev/flutter/material/SliverAppBar/floating.html).                                                                                                                             |
| stretch                   | boolean                  | false            | Whether the app bar should stretch to fill the over-scroll area. <br>For more information check the [<img height="15" src="https://storage.googleapis.com/cms-storage-bucket/4fd5520fe28ebf839174.svg" /> flutter docs](https://api.flutter.dev/flutter/material/SliverAppBar/stretch.html).                                                                                                                                                       |
| expandedContentHeight     | double?                  | N/A              | The height of the `expandedContent`.                                                                                                                                                                                                                                                                                                                                                                                                               |
| bottom                    | PreferredSizeWidget?     | N/A              | The widget that appears across the bottom of the appbar. For example a `TabBar`. <br> This widget has to **implement** a `PreferredSizeWidget`.                                                                                                                                                                                                                                                                                                    |
| automaticallyImplyLeading | bool?                    | false            | Provides Control of the AppBar's leading widget. When set to `true`, the framework will automatically add a leading widget <br> When set to `false` , no leading widget will be added automatically. <br>For more information check the [<img height="15" src="https://storage.googleapis.com/cms-storage-bucket/4fd5520fe28ebf839174.svg" /> flutter docs](https://api.flutter.dev/flutter/material/SliverAppBar/automaticallyImplyLeading.html). |
| leading                   | Widget?                  | N/A              | The leading widget at the start both the `expandedContent` and the `collapsedContent`, typically an `Icon` or an `IconButton`. It can also be a `BackButton`.                                                                                                                                                                                                                                                                                      |
| actions                   | List<Widget>?            | N/A              | A list of action widgets to display in a row after the `collapsedContent` widget.                                                                                                                                                                                                                                                                                                                                                                  |
| backdropWidget            | Widget?                  | N/A              | The content that is shown below the appbar. In most cases it's just the page content.                                                                                                                                                                                                                                                                                                                                                              |
| expandedBackgroundColor   | Color?                   | N/A              | The background `Color` of the `expandedContent` widget.                                                                                                                                                                                                                                                                                                                                                                                            |
| collapsedBackgroundColor  | Color?                   | N/A              | The background `Color` of the `collapsedContent` widget.                                                                                                                                                                                                                                                                                                                                                                                           |
| scrollController          | ScrollController?        | N/A              | Can be used to pass your own `scrollController` to customize the appbar even more.                                                                                                                                                                                                                                                                                                                                                                 |
| scrollBehavior            | ScrollBehaviour?         | N/A              | How the scrollable widgets behave, either `Material` or `Cupertino` Scrolling behaviors.                                                                                                                                                                                                                                                                                                                                                           |
| onCollapseStateChanged    | CollapsingStateCallback? | N/A              | This is a callback function that is triggered when the bar is either collapsed or expanded. It can be used to customize the animation and behavior of the widget to better suit your needs.                                                                                                                                                                                                                                                        |


# Extra Components

The below are supplementary widgets that can help you build the appbar faster.

### 1. Collapsed AppBar Content widget

This can be used to create a custom `collapsedContent` widget. It has the following properties:
1. leading: This is the `leading` widget specifically for the `collapsedContent` Appbar. Don't add the `leading` widget to the `ExpandedContent` widget or the `SliverSnap` widget, as they might overlap.
2. title: The middle widget between the `leading` and the `trailing` of the `collapsedContent` Appbar.,
3. trailing: The widget that is displayed at the rightmost part of the `collapsedContent`.

```dart
      CollapsedAppBarContent(
        leading: const Text('Leading Widget'),
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

### 2. Expanded Content widget

This can be used to create a custom `expanded` widget. It has the following properties:
1. leading: This is the `leading` widget specifically for the `expandedContent` Appbar. Don't add the `leading` widget to the `CollapsedAppBarContent` widget or the `SliverSnap` widget, as they might overlap.

```dart
    ExpandedContent(
      leading: const Text('Leading Widget'),
      child: const Text('Expanded Content'),
    );
```



# Additional information
Feel free to check the [example](https://github.com/A-Fawzyy/sliver-snap/tree/main/example/lib) for more usage info.


# Bugs or Requests
If you encounter any problems feel free to open an [issue](https://github.com/A-Fawzyy/sliver-snap/issues/new?assignees=&labels=&template=feature_request.md&title=). If you feel the library is missing a feature, please raise a [ticket](https://github.com/A-Fawzyy/sliver-snap/issues/new?assignees=&labels=&template=feature_request.md&title=). Pull request are also welcome.
