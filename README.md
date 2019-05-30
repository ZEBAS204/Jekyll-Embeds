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

and put this in your ``_config.yml`` 

```yaml
plugins: [jekyll-embeds]
```

## Usage

```
 {% youtube "https://www.youtube.com/watch?v=ho8-vK0L1_8" %}
```
or using variables/front matter

```
{% youtube page.youtubeurl %}
```

## Result

I recomend puts in your css the following code


```css
.embed-container {position: relative;height: 0;overflow: hidden;max-width: 100%;}
.embed-container iframe, .embed-container object, .embed-container embed {position: absolute;top: 0;left: 0;width: 100%;height: 100%;}
```

You can specify your own snippet by creating a partial ``_includes/youtube.html``. Inside that partial the Youtube ID is available as ``{{ youtube_id }}``.

___

## Examples
