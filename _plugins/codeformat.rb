module Jekyll
  module Converters
    class Markdown < Converter

      alias :old_convert :convert
      def convert(content)
        content.gsub!(/(?:^|\n)```(\w*)\n(.*\n)```\n/m) do |text|
          cls = $1.empty? ? "hljs haxe" : "hljs #{$1}"
          filter = Class.new { include Jekyll::Filters }
          code = filter.new.xml_escape($2)
          "<pre class=\"highlight\"><code class=\"#{cls}\">#{code}</code></pre>"
        end
        old_convert(content)
      end
    end
  end
end
