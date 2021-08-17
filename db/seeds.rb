# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

links = Link.create([{original_url: "http://google.com", token: SecureRandom.uuid[0...8]},
                     {original_url: "http://amazon.com", token: SecureRandom.uuid[0...8]}
                    ])
visitors = Visitor.create([{ip_addr:"127.0.0.1", user_clicks: 3, link_id: Link.first.id},
                           {ip_addr:"127.0.0.1", user_clicks: 2, link_id: Link.last.id}
                          ])
