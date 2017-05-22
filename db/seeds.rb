# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create(name: [{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: name: 'Luke', movie: movies.first)

Color.create(name: 'Red')
Color.create(name: 'Blue')
Color.create(name: 'Green')
Color.create(name: 'Neutral')

WeaponType.create(name: 'Lance')
WeaponType.create(name: 'Sword')
WeaponType.create(name: 'Axe')
WeaponType.create(name: 'Tome')
WeaponType.create(name: 'Breath')
WeaponType.create(name: 'Staff')
WeaponType.create(name: 'Bow')
WeaponType.create(name: 'Dagger')

MovementType.create(name: 'Cavalry')
MovementType.create(name: 'Infantry')
MovementType.create(name: 'Flying')
MovementType.create(name: 'Armored')

Importers::HeroImporter.new.import
Importers::WeaponImporter.new.import
Importers::AssistImporter.new.import
Importers::SpecialImporter.new.import
Importers::PassiveImporter.new.import
Importers::HeroSkillsImporter.new.import
