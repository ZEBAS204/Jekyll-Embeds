<h1 align="center">Jekyll Embeds</h1>
<p align="center">This Jekyll pluging allows a tag that takes a URL and generates a html snippet to embed the element into your site.</p>


## Installation

Add this line to your Gemfile:

```ruby
group :jekyll_plugins do
  gem "jekyll-embeds"
end
```

And then execute:

    $ bundle


Alternatively install the gem yourself as:

    $ gem install jekyll-embeds

and put this in your ``_config.yml`` **(for Jekyll < 3.5.0)**

```yaml
plugins: [jekyll-embeds]
```


# Usage
```
{% platform "url" %}

platform:
    * youtube
    * twitch
    * vimeo
    * tclip (soon)
    * gdrive(soon)
```
**Note:** You can specify your own embed by creating a partial for:
* ``_includes/youtube.html``
* ``_includes/twitch.html``
* ``_includes/vimeo.html``
Inside that partial the platform_ID is available as ``{{ platform_id }}``.

For example ``{{ twitch_id }}``.


**I recomend puts in your css the followin, this will make the look much better**

```css
.embed-container {position: relative;height: 0;overflow: hidden;max-width: 100%;}
.embed-container iframe, .embed-container object, .embed-container embed {position: absolute;top: 0;left: 0;width: 100%;height: 100%;}
```


___



# Examples

### Youtube
>Input: {% youtube "https://www.youtube.com/watch?v=UbQgXeY_zi4" %}

>Output: ```<div class="embed-container"><iframe title="YouTube video player" width="640" height="390" src="//www.youtube.com/embed/UbQgXeY_zi4" frameborder="0" allowfullscreen=""></iframe></div>```


### Twitch
>Input: {% twitch "https://twitch.tv/eleaguetv" %}

>Output: ```<div class="embed-container"><iframe src="https://player.twitch.tv/?channel=eleaguetv" frameborder="0" allowfullscreen="true" scrolling="no" autoplay="false" height="390" width="640"></iframe></div>```


### Vimeo
>Input: {% vimeo "https://vimeo.com/177667683" %}

>Output: ```<div class="embed-container"><iframe src="https://player.vimeo.com/video/177667683" frameborder="0" allowfullscreen="true" scrolling="no" height="390" width="640"></iframe></div>```
