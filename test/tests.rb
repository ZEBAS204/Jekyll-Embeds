# *==========================================*
# *       This file is not included!         *
# *==========================================*


#! Youtube Playlists
class YouTubeEmbed < Liquid::Tag

  def initialize(tag_name, markup, tokens)
    super
    params = Shellwords.shellwords markup
    @items = { :url => params[0], :type => params[1] || "video" }
  end

  def render(context)
    youtube_url = "#{@items[:url].strip}"

    case @items[:type]
      when "video"
        if youtube_url[/youtu\.be\/([^\?]*)/]
          @youtube_id = $1
        else
          youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
          @youtube_id = $5
        end
        %Q{<div class='embed-container'><iframe width="640" height="390" src="//www.youtube.com/embed/#{@youtube_id}" frameborder="0" allowfullscreen></iframe></div>}
      
      when "playlist" || "list"
        if youtube_url[/youtu\.be\/watch\/?v?=?&list=([^\?]*)\?/]
          @youtube_id = $2
          puts @youtube_id
        else
          youtube_url[/^.*((watch\?)|(embed\/))\?v?=?\&list=([^\?]*)\?/]
          @youtube_id = $3
          puts @youtube_id
        end
        %Q{<div class='embed-container'><iframe width="640" height="390" src="//www.youtube.com/embed/videoseries?list=#{@youtube_id}" frameborder="0" allowfullscreen></iframe></div>}
      
      else
        puts "Youtube Embed Syntax Error:\n *\n * #{@youtube_url}\n * #{@youtube_id} \n *"
    end
  end

  Liquid::Template.register_tag "youtube", self
end

#! GOOGLE DRIVE
class GDriveEmbed < Liquid::Tag

    def initialize(tagName, content, tokens)
      super
      @content = content
    end
  
    def render(context)
      gd_url = "#{context[@content.strip]}"
      if gd_url[/drive\.google\.com\/([^\?]*)/]
        @gd_id = $1
      end
      
      tmpl_path = File.join Dir.pwd, "_includes", "gdrive.html"
      if File.exist?(tmpl_path)
        tmpl = File.read tmpl_path
        site = context.registers[:site]
        tmpl = (Liquid::Template.parse tmpl).render site.site_payload.merge!({"gd_id" => @gd_id})
      else
        %Q{<div class='embed-container'><iframe src="https://drive.google.com/#{ @gd_id }/preview" frameborder="0" allowfullscreen="true" scrolling="no" height="390" width="640"></iframe></div>}
      end
    end
  
    Liquid::Template.register_tag "gdrive", self
end
