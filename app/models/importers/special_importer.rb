module Importers
  class SpecialImporter

    def doc
      @doc ||= Nokogiri(open('http://feheroes.gamepedia.com/Specials'))
    end

    def relevant_rows
      @rows ||= doc.css('#bodyContent table').first.css('tr')
    end

    def import
      puts "Importing #{relevant_rows.count} Specials"
      relevant_rows.each do |row|
        special = Special.find_or_initialize_by(name: name(row))
        special.cooldown = cooldown(row)
        special.effect = effect(row)
        special.sp_cost = sp_cost(row)
        special.inherit_restriction = restriction(row)
        if special.save
          print '.'
        else
          puts special.errors.full_messages
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

      def cooldown(row)
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
