<h1 align="center"><a href="https://zebas204.gitlab.io/jekyll-embeds-site/">Jekyll Embeds</a></h1>
<p align="center">This Jekyll pluging allows a tag that takes a URL and generates a html snippet to embed the element into your site<br><br><a href="https://rubygems.org/gems/jekyll-embeds"><img src="https://badge.fury.io/rb/jekyll-embeds.svg"/></a> <a href="/LICENSE"><img src="https://badges.frapsoft.com/os/mit/mit.svg?v=103"/></a><br>
<a href="https://rubygems.org/gems/jekyll"><img src="https://img.shields.io/badge/jeykll-%5E3.8-orange.svg"/></a>
<a href="https://rubygems.org/gems/rake"><img src="https://img.shields.io/badge/rake-%5E1.10-orange.svg"/></a>
<a href="https://rubygems.org/gems/bundler"><img src="https://img.shields.io/badge/bundler-%5E10.0-orange.svg"/></a>
</p>

```yml
   IMPORTANT: This plugin doesn't work in github-pages for now (needs to be in whitelist)
```
<br>

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
# All [bool] = [true/false] => false (default)
# In case you want to define it, you need defile the before params.

# Youtube (no playlists)
{% youtube [url] % }

# Twitch
{% twitch [url/id] [type] [bool] %}
Type => channel(def), video, clip

# Vimeo
{% vimeo [url] %}

# SoundCloud
{% soundcloud [id] [color] [bool] %}
Color => HEX without the '#'

# Spotify
{% spotify [id/url] %}
id => spotify:track:7HOgPR1oVFyq9SwJrniXbR
                    ^     ONLY THIS      ^
url => Support:
    * //open.spotify.com/album/
    * //open.spotify.com/embed/track/

```

**I recommend puts in your css the following, this will make the look much better**

```css
.embed-container {position: relative;height: 0;overflow: hidden;max-width: 100%;}
.embed-container iframe, .embed-container object, .embed-container embed {position: absolute;top: 0;left: 0;width: 100%;height: 100%;}
```


___



# [See all examples here.](https://zebas204.gitlab.io/jekyll-embeds-site)
### (They are on a page to save space)
