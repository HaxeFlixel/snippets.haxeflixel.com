module Jekyll
  class APILink < Liquid::Tag
    def initialize(tag_name, params, tokens)
      super
      
      @params = params.split(' ', 3)

    end
    
    def render(context)
      desc = @params[0]
      link = @params[1]
      anchor = ""
      tip = @params[1].sub '/', '.'
      
      if !@params[2].empty?
        anchor = "##{@params[2]}"
      end
      "<code><a data-toggle=\"tooltip\" data-placement=\"top\" title=\"#{tip}#{anchor}\" href=\"http://api.haxeflixel.com/#{link}.html#{anchor}\">#{desc}</a></code>"
    end
  end
end

Liquid::Template.register_tag('api', Jekyll::APILink)