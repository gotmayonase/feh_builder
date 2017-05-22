module Importers
  class PassiveImporter

    def doc
      @doc ||= Nokogiri(open('http://feheroes.gamepedia.com/Passives'))
    end

    def relevant_rows(index)
      doc.css('#bodyContent table')[index].css('tr')
    end

    def import
      %w{A B C}.each.with_index do |slot, i|
        rows = relevant_rows(i)
        puts "Importing #{rows.count} #{slot} Passives"
        rows.each do |row|
          passive = Passive.find_or_initialize_by(name: name(row))
          passive.slot = slot + 'Passive'
          passive.effect = effect(row)
          passive.sp_cost = sp_cost(row)
          passive.inherit_restriction = restriction(row)
          image_path = File.join(Rails.root, 'app', 'assets', 'images', 'passives', "#{passive.name}.png")
          unless File.exists?(image_path)
            open(image_url(row)) do |f|
              File.open(image_path, 'wb') do |file|
                file.puts f.read
              end
            end
          end
          if passive.save
            print '.'
          else
            puts passive.errors.full_messages
            print 'E'
          end
        end
        puts
      end
      puts
    end

    private

      def name(row)
        row.css('td')[1].text
      end

      def sp_cost(row)
        row.css('td')[3].text
      end

      def effect(row)
        row.css('td')[2].text
      end

      def restriction(row)
        row.css('td')[4].text
      end

      def image_url(row)
        row.css('td img').first.attributes['src']
      end

  end
end
