require_relative('models/wands')
require_relative('models/wizards')
require_relative('models/magical_items')
require('pry-byebug')

Wizard.delete_all
Wand.delete_all
MagicalItem.delete_all

wizard1 = Wizard.new({'name' => 'Gandalf'})
wizard1.save
wizard2 = Wizard.new({'name' => 'Sauruman'})
wizard2.save
wizard3 = Wizard.new({'name' => 'Specky'})
wizard3.save


wand1 = Wand.new({'name' => 'Bechemel'})
wand1.save
wand2 = Wand.new({'name' => 'Dusty'})
wand2.save
wand3 = Wand.new({'name' => 'Deamon'})
wand3.save

magical_item1 = MagicalItem.new( {'wizard_id' => wizard1.id, 'wand_id' => wand1.id} ) 
magical_item1.save
magical_item2 = MagicalItem.new( {'wizard_id' => wizard1.id, 'wand_id' => wand1.id} )
magical_item2.save
magical_item3 =MagicalItem.new( {'wizard_id' => wizard2.id, 'wand_id' => wand3.id} )
magical_item3.save

binding.pry

nil