# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create!(title: 'Programming Ruby 1.9 & 2.0',
                description:
                %{<p>
                  Ruby is the fastest growing and most exciting dynamic language
                  out there. If you need to get working programs delivered fast,
                  you should add Ruby to your toolbox.
                  </p>},
                image_url: 'ruby.png',
                price: 49.95)
                
Product.create!(title: 'Book',
                description:
                %{Aliquam fringilla id ex eget elementum. Etiam molestie metus ut 
                molestie interdum. Etiam convallis, dui eu porttitor rhoncus, nibh 
                ex condimentum nulla, non feugiat arcu dui sed libero. Vestibulum 
                ut mi dictum, viverra lorem ut, porttitor eros. Proin pulvinar erat 
                non efficitur tempus. Cras mollis mauris quis nulla pulvinar, et 
                dictum lectus egestas. Quisque id nibh est. Morbi ut magna et 
                dolor tristique fermentum sed nec est. Morbi tempus justo vitae 
                pretium rhoncus. Maecenas vel elementum orci.},
                image_url: 'ruby.png',
                price: 12.95)
