module Importers
  class HeroImporter

    def doc
      @doc ||= Nokogiri(open('http://feheroes.gamepedia.com/Hero_List'))
    end

    def relevant_rows
      @rows ||= doc.css('#bodyContent table tr')
    end

    def import
      puts "Importing #{relevant_rows.count} Heroes"
      relevant_rows.each do |row|
        hero = Hero.find_or_initialize_by(name: name(row))
        hero.weapon_type = WeaponType.find_by(name: weapon_type(row))
        hero.movement_type = MovementType.find_by(name: movement_type(row))
        hero.color = Color.find_by(name: color(row))
        image_path = File.join(Rails.root, 'app', 'assets', 'images', 'heroes', "#{hero.name}.png")
        unless File.exists?(image_path)
          open(image_url(row)) do |f|
            File.open(image_path, 'wb') do |file|
              file.puts f.read
            end
          end
        end
        hero.title = title(row)
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

      def weapon_type(row)
        row.attributes['data-weapon-type'].value.match(/(\w*) (\w*)/)[2]
      end

      def color(row)
        row.attributes['data-weapon-type'].value.match(/(\w*) (\w*)/)[1]
      end

      def movement_type(row)
        row.attributes['data-move-type'].value
      end

      def name(row)
        row.css('td')[1].text
      end

      def title(row)
        row.css('td')[2].text
      end

      def image_url(row)
        row.css('td img').first.attributes['src']
      end

  end
end
