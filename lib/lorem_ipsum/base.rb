module LoremIpsumAmet
  class Base

    class << self

      # cp: character or paragraphs
      def lorem_ipsum(cp = nil, options = {})
        cp = { characters: cp } unless cp.respond_to?(:merge)
        cp.merge!(options)

        join_element = cp[:join].nil? && cp[:html] ? '<br />' : cp[:join]

        if cp[:characters]
          Character.new(self, cp[:characters], join_element).text
        elsif cp[:paragraphs]
          Paragraph.new(self, cp[:paragraphs], join_element).text
        elsif cp[:words]
          Word.new(self, cp[:words], join_element).text
        else
          paragraphs.first
        end
      end

      alias text lorem_ipsum

      def paragraphs
        raw_text.split("\n")
      end

      private

      def raw_text
        Text.raw
      end

    end

  end
end
