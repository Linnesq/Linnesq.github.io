---
layout: post
title: "Simple Android Action Bar"
tag: android
---

This post is about getting started with a simple [Action Bar][guide].

![action bar example image]({{site.url}}/assets/images/simple-action-bar.png)

I started with a simple blank activity setup in Android Studio (0.8.0).
Mental note, with Eclipse/ADT min/target SDK used to be defined in AndroidManifest.xml.
With Android Studio, this seems to be defined in the app's `build.gradle` file.

As specified in the [guide][guide], we would need to extend `ActionBarActivity` if aiming towards APIs < 11.
However, in this case, I'm looking at API 14+. With 14 as minimum SDK, and a default Holo theme, `ActionBar` is implemented out-the-box:

> Beginning with Android 3.0 (API level 11), the action bar appears at the top of an activity's window when the activity uses the system's Holo theme ...

On the right-hand side of the image above, you can see email and settings 'options'.
The xml for this in `res/menu`:
{% highlight xml %}
<menu xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    tools:context=".MainScreen">
    <item
        android:id="@+id/action_settings"
        android:orderInCategory="100"
        android:showAsAction="ifRoom"
        android:title="@string/action_settings" />
    <item
        android:id="@+id/action_mail"
        android:icon="@android:drawable/ic_dialog_email"
        android:orderInCategory="99"
        android:showAsAction="always"
        android:title="Mail" />
</menu>
{% endhighlight %}

On the left-hand side of the image is the icon. By default, the App Name would appear next to the icon.
To remove this, we create a style that 'sub-classes' the Holo ActionBar style with the following alterations.
The `AppTheme` style is referenced in the `AndroidManifest.xml` and lives in `res/values`.
{% highlight xml %}
<resources>
    <style name="AppTheme" parent="android:Theme.Holo">
        <item name="android:actionBarStyle">@style/AppTheme.NoTitle</item>
    </style>

    <style name="AppTheme.NoTitle" parent="android:Widget.Holo.ActionBar">
        <item name="android:displayOptions">showHome|useLogo</item>
    </style>
</resources>
{% endhighlight %}

Not too exciting, but it is a start...the code is [here][project]

[guide]: http://developer.android.com/guide/topics/ui/actionbar.html
[project]: https://github.com/Linnesq/simple-actionbar-example
