<h1 align="center">Jekyll Embeds</h1>
<p align="center">This Jekyll pluging allows a tag that takes a URL and generates a html snippet to embed the element into your site<br><br><a href="https://rubygems.org/gems/jekyll-embeds"><img src="https://badge.fury.io/rb/jekyll-embeds.svg"/></a> <a href="/LICENSE"><img src="https://badges.frapsoft.com/os/mit/mit.svg?v=103"/></a><br>
<a href="https://rubygems.org/gems/jekyll"><img src="https://img.shields.io/badge/jeykll-%5E3.8-orange.svg"/></a>
<a href="https://rubygems.org/gems/rake"><img src="https://img.shields.io/badge/rake-%5E1.10-orange.svg"/></a>
<a href="https://rubygems.org/gems/bundler"><img src="https://img.shields.io/badge/bundler-%5E10.0-orange.svg"/></a>
</p>


## Installation

Add this line to your Gemfile:

```ruby
group :jekyll_plugins do
  gem "jekyll-embeds"
end
```

And then execute:

```console
$ bundle
```


Alternatively install the gem yourself as:
```console
$ gem install jekyll-embeds
```

and put this in your ``_config.yml`` **(for Jekyll < 3.5.0)**

```yaml
plugins: [jekyll-embeds]
```


# Usage
```ooc
{% platform "url" %}

platform:
    * youtube
    * twitch
    * vimeo
    * soundcloud => {% soundcloud "id" [color] [bool] %}
    * tclip (soon)
    * gdrive(soon)
```

**I recommend puts in your css the following, this will make the look much better**

```css
.embed-container {position: relative;height: 0;overflow: hidden;max-width: 100%;}
.embed-container iframe, .embed-container object, .embed-container embed {position: absolute;top: 0;left: 0;width: 100%;height: 100%;}
```


___



# Examples

### Youtube
```html
>Input: {% youtube "https://www.youtube.com/watch?v=UbQgXeY_zi4" %}

>Output: <div class="embed-container"><iframe title="YouTube video player" width="640" height="390" src="//www.youtube.com/embed/UbQgXeY_zi4" frameborder="0" allowfullscreen=""></iframe></div>
```


### Twitch
```html
>Input: {% twitch "https://twitch.tv/eleaguetv" %}

>Output: <div class="embed-container"><iframe src="https://player.twitch.tv/?channel=eleaguetv" frameborder="0" allowfullscreen="true" scrolling="no" autoplay="false" height="390" width="640"></iframe></div>
```


### SoundCloud
```html
>Input: {% soundcloud "195677713" 00ff00 true %}
Note:
  * The color need be in HEX without the "#" (def: orange)
  * The last bool define the autoplay (def: false)
 !* The color and bool are optional

>Output: <div class="embed-container"><iframe width="100%" height="166" scrolling="no" frameborder="no" src="//w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/195677713&amp;color=%2300ff00auto_play=true&amp;visual=true"></iframe></div>
```


### Vimeo
```html
>Input: {% vimeo "https://vimeo.com/177667683" %}

>Output: <div class="embed-container"><iframe src="https://player.vimeo.com/video/177667683" frameborder="0" allowfullscreen="true" scrolling="no" height="390" width="640"></iframe></div>
```
