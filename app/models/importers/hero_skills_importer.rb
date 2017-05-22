module Importers
  class HeroSkillsImporter

    def doc
      @doc ||= Nokogiri(open('http://feheroes.gamepedia.com/Skills_Table'))
    end

    def relevant_rows
      @rows ||= doc.css('#bodyContent table tr')
    end

    def import
      puts "Importing #{relevant_rows.count} Hero Skills"
      relevant_rows.each do |row|
        hero = Hero.find_or_initialize_by(name: name(row))
        hero.weapon = weapon(row)
        hero.assist = assist(row)
        hero.special = special(row)
        hero.a_passive = a_passive(row)
        hero.b_passive = b_passive(row)
        hero.c_passive = c_passive(row)
        if hero.save
          print '.'
        else
          puts hero.errors.full_messages
          print 'E'
        end
      end
      puts
    end

    private

      def name(row)
        row.css('td')[1].text
      end

      def object_for_name(klass, name)
        unless name.blank? || name == '-'
          klass.find_by(name: name)
        end
      end

      def object_for_index(row, klass, index)
        object_for_name(klass, row.css('td')[index].text)
      end

      def weapon(row)
        object_for_index(row, Weapon, 4)
      end

      def assist(row)
        object_for_index(row, Assist, 5)
      end

      def special(row)
        object_for_index(row, Special, 6)
      end

      def a_passive(row)
        object_for_index(row, Passive, 7)
      end

      def b_passive(row)
        object_for_index(row, Passive, 8)
      end

      def c_passive(row)
        object_for_index(row, Passive, 9)
      end

  end
end
