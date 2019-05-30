#! GOOGLE DRIVE
# This file is not included!

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
