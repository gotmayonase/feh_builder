module Importers

  class WeaponImporter

    def import
      [
        ['Red', 'Sword','http://feheroes.gamepedia.com/Category:Swords'],
        ['Red', 'Tome', 'http://feheroes.gamepedia.com/Category:Red_Tomes'],
        ['Red', 'Breath', 'http://feheroes.gamepedia.com/Category:Red_Breaths'],
        ['Blue', 'Lance', 'http://feheroes.gamepedia.com/Category:Lances'],
        ['Blue', 'Tome', 'http://feheroes.gamepedia.com/Category:Blue_Tomes'],
        ['Blue', 'Breath', 'http://feheroes.gamepedia.com/Category:Blue_Breaths'],
        ['Green', 'Axe', 'http://feheroes.gamepedia.com/Category:Axes'],
        ['Green', 'Tome', 'http://feheroes.gamepedia.com/Category:Green_Tomes'],
        ['Green', 'Breath', 'http://feheroes.gamepedia.com/Category:Green_Breaths'],
        ['Neutral', 'Staff', 'http://feheroes.gamepedia.com/Category:Staves'],
        ['Neutral', 'Bow', 'http://feheroes.gamepedia.com/Category:Bows'],
        ['Neutral', 'Dagger', 'http://feheroes.gamepedia.com/Category:Daggers']
      ].each do |color, weapon, url|
        _import(color, weapon, url)
        puts
      end
    end

    private

      def _import(color_name, weapon_name, url)
        color = Color.find_by(name: color_name)
        weapon_type = WeaponType.find_by(name: weapon_name)
        doc = Nokogiri(open(url))
        rows = doc.css('#bodyContent table tr')
        puts "Importing #{rows.count} #{color_name} #{weapon_name.pluralize}"
        rows.each do |row|
          weapon = Weapon.find_or_initialize_by(name: name(row))
          weapon.color = color
          weapon.weapon_type = weapon_type
          weapon.sp_cost = sp_cost(row)
          weapon.damage = damage(row)
          weapon.range = range(row)
          weapon.effect = effect(row)
          weapon.exclusive = exclusive(row)
          if weapon.save
            print '.'
          else
            print 'E'
          end
        end
      end

      def name(row)
        row.css('td')[0].text
      end

      def sp_cost(row)
        row.css('td')[1].text
      end

      def damage(row)
        row.css('td')[2].text
      end

      def range(row)
        row.css('td')[3].text
      end

      def effect(row)
        row.css('td')[4].text
      end

      def exclusive(row)
        !!(row.css('td img').last.attribute('alt').value =~ /Dark Red/i)
      end

  end

end
