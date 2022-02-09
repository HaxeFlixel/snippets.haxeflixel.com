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

    def render_rouge(filetype, code)
      require "rouge"
      formatter = ::Rouge::Formatters::HTML.new
      lexer = ::Rouge::Lexer.find_fancy(filetype, code) || Rouge::Lexers::PlainText
      formatter.format(lexer.lex(code))
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

        code = IO.binread("demos/#{path}/#{file}")

        #filter = Class.new { include Jekyll::Filters }

        #contents = filter.new.xml_escape(IO.binread("demos/#{path}/#{file}"))
        #code = "<div class="language-haxe highlighter-rouge"><div class="highlight"><pre class="highlight"><code>" + code + "</code></pre></div></div>"

        contents = render_rouge(filetype, code)


        # <pre ><code class=\"language-#{filetype}\">#{contents}</code></pre>


        slug = Utils.slugify(file)
        sources << "<div class=\"accordion\" id=\"accordion-#{slug}\" >
  <div class=\"accordion-item\">
    <h2 class=\"accordion-header\" id=\"heading-#{slug}\">
      <button class=\"accordion-button\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#collapse-#{slug}\" aria-expanded=\"false\" aria-controls=\"collapse-#{slug}\">
        <span class=\"pull-right\"><i class=\"source-chevron fa fa-chevron-circle-right fa-lg fa-fw\"></i></span>#{file}
      </button>
    </h2>
    <div id=\"collapse-#{slug}\" class=\"accordion-collapse collapse\" aria-labelledby=\"heading-#{slug}\" data-bs-parent=\"#accordion-#{slug}\">
      <div class=\"accordion-body\">
        <div class=\"language-#{filetype} highlighter-rouge\"><div class=\"highlight\"><pre class=\"highlight\"><code>#{contents}</code></pre></div></div>
      </div>
    </div>
  </div>
</div>"
      end
      sources
    end
  end
end



Liquid::Template.register_tag('source', Jekyll::SourceFormat)
