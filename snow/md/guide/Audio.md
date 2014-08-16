[![Logo]({{{rel_path}}}images/logo.png)]({{{rel_path}}}index.html#guide)

---

##Audio


###Goals

As audio is complex, platform specific, and often audio engine specific in nature - snow strives for the simple goal :
- a set of high level API end points across platform where possible
- support for the best formats for the platform as possible
- support for accessing the underlying audio engine for deeper control/access

For example, on **native platforms** by default OpenAL is used.    
The high level API allows you to stream audio, playback loops of music seamlessly and play sound effects with settings like pan, pitch, volume and controlling the position of the playback manually.
But, you are not limited by the high level API if you are shipping on native platforms. You have direct and full access to the OpenAL API from your haxe code to be able to create more complex use of the audio engine, if you need it.

The same applies to web, HowlerJS is used by default, and you can access it through the platform specifics as you see fit.

###Feature Parity

snow tries it's best to map features of the high level API to all platforms consistently. As audio is one of the newer and more complex features of modern web, there are browsers and implementations that do not support the full set of features or audio formats, but as soon as they do, snow will continually follow along and strive for parity.

**However**, in modern browsers like Chrome, all features of the native audio map 1:1 to the features on web.

###Using the high level API

The audio API consists of two approaches to interact with the sounds that are created through it.   

All sounds are first **create**d, and then the sound instance is used to play and manipulate the sound. The approaches available are 

- named sound api
- sound instance api

This may seem confusing, but in event driven systems, a named sound api might be more ideal than instance based, and in coupled environments, sound instances might be preferred. This allows a wider set of use cases to allow seamless integration into your game or application.

What does these mean?

Take the following example. A sound instance is created, and then it is played when it is done loading. In both cases, the exact same outcome happens. One method requires the sound itself, the other doesn't. It's up to you to pick which you prefer, and use whatever makes sense to your application.

```
override function ready() {

    var sound : Sound = app.audio.create('assets/sound.ogg', 'soundname');

        //this is the instance method
    sound.on('load', function( _sound:Sound ) {
        sound.play();
    });

        //this is the 'named api' method
    app.audio.on('soundname', 'load', function( _sound:Sound ) {
        app.audio.play('soundname');
    });

} //ready
```
---

###Accessing the platform or engine specific features

For OpenAL on native platforms, you would **import snow.audio.openal.AL;** and use **AL**, **ALC** api functions to interact with the API. The API mirrors the official API of OpenAL with the exception of some helpers to make things simpler (like genSource instead of genSources will return a single source id) and with the exception of the naming, instead of **alSourceStop** you would call **AL.sourceStop**. Instead of **AL_ORIENTATION** it becomes **AL.ORIENTATION** and so on.

For HowlerJS on the web platform, you would access the **Howl** and **Howler** classes from the **snow.audio.howlerjs** package.

For all platforms, the **[Sound]({{{rel_path}}}api/snow/audio/Sound.html)** instance has a **info:[AudioInfo]({{{rel_path}}}api/snow/types/AudioInfo.html)** node, which contains the platform specific handle of the sound on it. For web, this is the howl instance, and for native on OpenAL, this is the source ID.

The concrete implementations for each platform reside in **snow/platform/native/audio/** and **snow/platform/web/audio/** respectively.

---

##Back

[To the guide]({{{rel_path}}}index.html#guide)

<br/><br/><br/>
<br/><br/><br/>