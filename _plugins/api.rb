module Jekyll
  class APILink < Liquid::Tag
    def initialize(tag_name, param, tokens)
      super
      
      @param = param.split(' ')[0]

    end
    
    def render(context)
      filter = Class.new { include Jekyll::Filters }
      tooltip = filter.new.xml_escape(@param)
      segments = @param.scan(/(\w+)/);
      last = segments.last[0]
      isfunc = @param.split(//).last(2).join() == '()'
      isconst = !last.match(/\p{LOWER}/)
      isprop = !last.match(/[A-Z]([A-Z0-9]*[a-z][a-z0-9]*[A-Z]|[a-z0-9]*[A-Z][A-Z0-9]*[a-z])[A-Za-z0-9]*/) | isconst || isfunc
      link = ''
      desc = ''
      segments.each_with_index do |seg, index| 
        seg_s = seg[0]
        if !isprop || index < segments.length-1
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
      desc = filter.new.xml_escape(desc)
      "<code><a data-toggle=\"tooltip\" data-placement=\"top\" title=\"#{tooltip}\" href=\"http://api.haxeflixel.com#{link}\">#{desc}</a></code>"
    end
  end
end

Liquid::Template.register_tag('api', Jekyll::APILink)