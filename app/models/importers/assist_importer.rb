module Importers
  class AssistImporter

    def doc
      @doc ||= Nokogiri(open('http://feheroes.gamepedia.com/Assists'))
    end

    def relevant_rows
      @rows ||= doc.css('#bodyContent table').first.css('tr')
    end

    def import
      puts "Importing #{relevant_rows.count} Assists"
      relevant_rows.each do |row|
        assist = Assist.find_or_initialize_by(name: name(row))
        assist.range = range(row)
        assist.effect = effect(row)
        assist.sp_cost = sp_cost(row)
        assist.inherit_restriction = restriction(row)
        if assist.save
          print '.'
        else
          puts assist.errors.full_messages
          print 'E'
        end
      end
      puts
    end

    private

      def name(row)
        row.css('td')[0].text
      end

      def sp_cost(row)
        row.css('td')[3].text
      end

      def range(row)
        row.css('td')[1].text
      end

      def effect(row)
        row.css('td')[2].text
      end

      def restriction(row)
        row.css('td')[4].text
      end

  end
end
