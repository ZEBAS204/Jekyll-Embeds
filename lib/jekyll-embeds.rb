require 'jekyll'
require 'shellwords'

class YouTubeEmbed < Liquid::Tag

  def initialize(tagName, content, tokens)
    super
    @content = content
  end

  def render(context)
    youtube_url = "#{context[@content.strip]}"
    if youtube_url[/youtu\.be\/([^\?]*)/]
      @youtube_id = $1
    else
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      @youtube_id = $5
    end
    
    tmpl_path = File.join Dir.pwd, "_includes", "youtube.html"
    if File.exist?(tmpl_path)
      tmpl = File.read tmpl_path
      site = context.registers[:site]
      tmpl = (Liquid::Template.parse tmpl).render site.site_payload.merge!({"youtube_id" => @youtube_id})
    else
      %Q{<div class='embed-container'><iframe title="YouTube video player" width="640" height="390" src="//www.youtube.com/embed/#{ @youtube_id }" frameborder="0" allowfullscreen></iframe></div>}
    end
  end

  Liquid::Template.register_tag "youtube", self
end


class TwitchEmbed < Liquid::Tag

    def initialize(tagName, content, tokens)
      super
      @content = content
    end
  
    def render(context)
      twitch_url = "#{context[@content.strip]}"
      if twitch_url[/twitch\.tv\/([^\?]*)/]
        @twitch_id = $1
      end
      
      tmpl_path = File.join Dir.pwd, "_includes", "twitch.html"
      if File.exist?(tmpl_path)
        tmpl = File.read tmpl_path
        site = context.registers[:site]
        tmpl = (Liquid::Template.parse tmpl).render site.site_payload.merge!({"twitch_id" => @twitch_id})
      else
        %Q{<div class='embed-container'><iframe src="https://player.twitch.tv/?channel=#{ @twitch_id }" frameborder="0" allowfullscreen="true" scrolling="no" autoplay="false" height="390" width="640"></iframe></div>}
      end
    end
  
    Liquid::Template.register_tag "twitch", self
end

class VimeoEmbed < Liquid::Tag

    def initialize(tagName, content, tokens)
      super
      @content = content
    end
  
    def render(context)
      vimeo_url = "#{context[@content.strip]}"
      if vimeo_url[/vimeo\.com\/([^\?]*)/]
        @vimeo_id = $1
      end
      
      tmpl_path = File.join Dir.pwd, "_includes", "vimeo.html"
      if File.exist?(tmpl_path)
        tmpl = File.read tmpl_path
        site = context.registers[:site]
        tmpl = (Liquid::Template.parse tmpl).render site.site_payload.merge!({"vimeo_id" => @vimeo_id})
      else
        %Q{<div class='embed-container'><iframe src="https://player.vimeo.com/video/#{ @vimeo_id }" frameborder="0" allowfullscreen="true" scrolling="no" height="390" width="640"></iframe></div>}
      end
    end
  
    Liquid::Template.register_tag "vimeo", self
end



class SoundCloudEmbed < Liquid::Tag

  def initialize(tag_name, markup, tokens)
    super
    params = Shellwords.shellwords markup
    @items = { :id => params[0], :color => params[1] || "ff7700", :aplay => params[2] || "false" }
  end

  def render(context)
    %Q{<div class="embed-container"><iframe width=\"100%\" height=\"166\" scrolling=\"no\" frameborder=\"no\"  src=\"//w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/#{@items[:id]}&color=%23#{@items[:color]}auto_play=#{@items[:aplay]}&visual=true\"></iframe></div>}
  end

  Liquid::Template.register_tag "soundcloud", self
end