module Jekyll

    class BuildTagList < Generator
        safe true
        attr_accessor :site
         
        def generate(site)
            
            hash = Hash.new { |h, key| h[key] = [] }
            site.collections.each do |name, collection|
                collection.docs.each { |doc| doc.data.fetch('tags').each { |t| hash[t] << doc } }
                hash.values.each { |docs| docs.sort!.reverse! }
            end
            
        end
    end
end