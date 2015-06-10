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
      a = ""
      alink = ""
      if !@params[2].empty?
        anchor = @params[2]
        a = "##{anchor}"
        alink = ".#{anchor}"
      end
      "<code><a data-toggle=\"tooltip\" data-placement=\"top\" title=\"#{link}#{alink}\" href=\"http://api.haxeflixel.com/#{link}.html#{a}\">#{desc}</a></code>"
    end
  end
end

Liquid::Template.register_tag('api', Jekyll::APILink)