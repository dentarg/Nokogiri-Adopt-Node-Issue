require 'nokogiri'

module DocBuilder
  def build_root_doc
    builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
      xml.books do
        book_doc = Nokogiri::XML(build_book) {|cfg| cfg.dtdvalid}
        xml.parent.add_child book_doc.root
      end
    end
    builder.to_xml
  end

  def build_book
    builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
      xml.book do
        xml.author 'Minty McMahon'
        xml.title 'Giraffes are so cool'
      end
    end
    builder.to_xml
  end
end
