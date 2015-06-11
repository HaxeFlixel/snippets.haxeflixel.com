module Jekyll
  class APILink < Liquid::Tag
    def initialize(tag_name, param, tokens)
      super
      
      @param = param.split(' ')[0]

    end
    
    def render(context)
      tooltip = @param
      segments = @param.scan(/(\w+)/);
      last = segments.last[0]
      isfunc = @param.split(//).last(2).join() == '()'
      isconst = !last.match(/\p{LOWER}/)
      isprop = !last.match(/\p{UPPER}/) || isconst || isfunc
      
      link = ''
      desc = ''
      segments.each do |seg| 
        seg_s = seg[0]
        if !isprop || last != seg_s
          link << "/#{seg_s}"
        end
      end
      link << '.html'
      if isprop
        link << "##{last}"
      end
      if isprop
        desc = (isfunc || isconst ? "#{segments[-2][0]}." : '' ) << "#{last}" << (isfunc ? '()' : '')
      else
        desc = last
      end
      
      "<code><a data-toggle=\"tooltip\" data-placement=\"top\" title=\"#{tooltip}\" href=\"http://api.haxeflixel.com#{link}\">#{desc}</a></code>"
    end
  end
end

Liquid::Template.register_tag('api', Jekyll::APILink)