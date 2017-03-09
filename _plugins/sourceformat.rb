module Jekyll
  class SourceFormat < Liquid::Tag

    VARIABLE_SYNTAX = /(?<variable>[^{]*\{\{\s*(?<name>[\w\-\.]+)\s*(\|.*)?\}\}[^\s}]*)(?<params>.*)/

    def initialize(tag_name, params, tokens)
      super
        @params = params.split(' ', 2)
        matched = @params[0].strip.match(VARIABLE_SYNTAX)
        if matched
          @path = matched['variable'].strip
        else
          @path = @params[0].strip
        end
        matched = @params[1].strip.match(VARIABLE_SYNTAX)
        if matched
          @files = matched['variable'].strip
        else
          @files = @params[1].strip
        end
    end

    def render_path_variable(context)
      if @path.match(VARIABLE_SYNTAX)
        partial = Liquid::Template.parse(@path)
        partial.render!(context)
      end
    end

    def render_files_variable(context)
      if @files.match(VARIABLE_SYNTAX)
        partial = Liquid::Template.parse(@files)
        partial.render!(context)
      end
    end

    def render(context)
      sources = ''
      path = render_path_variable(context) || @path
      files = render_files_variable(context) || @files
      files.split(' ').each do |file|
        case File.extname("demos/#{file}")
        when '.hx'
          filetype = 'haxe'
        when '.css'
          filetype = 'css'
        when '.xml'
          filetype = 'xml'
        when '.html'
          filetype = 'html'
        else
          filetype = 'desktop'
        end
        filter = Class.new { include Jekyll::Filters }

        contents = filter.new.xml_escape(IO.binread("demos/#{path}/#{file}"))
        slug = Utils.slugify(file)
        sources << "<div class=\"panel-group\" id=\"accordion-#{slug}\" role=\"tablist\" aria-multiselectable=\"true\">
  <div class=\"panel panel-default\">
    <div class=\"panel-heading\" role=\"tab\" id=\"heading-#{slug}\">
      <h4 class=\"panel-title\">
        <a data-toggle=\"collapse\" data-parent=\"#accordion-#{slug}\" href=\"#collapse-#{slug}\" aria-expanded=\"true\" aria-controls=\"collapse-#{slug}\">
          <span class=\"pull-right\"><i class=\"source-chevron fa fa-chevron-circle-right fa-lg fa-fw\"></i></span>#{file}
        </a>
      </h4>
    </div>
    <div id=\"collapse-#{slug}\" class=\"source-body panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"heading-#{slug}\">
      <pre class=\"highlight\"><code class=\"hljs #{filetype}\">#{contents}</code></pre></li>
    </div>
  </div>
</div>"
      end
      sources
    end
  end
end

Liquid::Template.register_tag('source', Jekyll::SourceFormat)
