# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'aws-sdk-s3'
s3 = Aws::S3::Resource.new(region: 'eu-west-3')

OrderItem.destroy_all
Cart.destroy_all
Item.destroy_all
Order.destroy_all
User.destroy_all

descriptions = ['Comment résister à ce pelage tout fluffy?',
                'Un chaton pour les gouverner tous!',
                "Qu'est-ce que la vie quand on a pas une image de chaton comme celle-ci dans son salon?",
                'Chantons pour les chatons!',
                'Un chat marchait Le long de la gouttière...',
                'Plus un diamant est beau, plus il faut que la monture soit légère. Plus le chaton est riche, moins le diamant est en évidence.',
                'La vie c’est comme tenter de mettre des chatons dans un panier. Quand on y met le dernier, le premier est déjà de l’autre côté.',
                'Un chaton doit apprendre la vie de chat tôt.',
                ' Ce qui est merveilleux avec un chat c’est qu’il n’y a rien à faire quand il vient à vous, qu’à le regarder. ',
                'L’idéal du calme est dans un chat assis. ',
                ' Mieux vaut élever son esprit que des chats siamois. ',
                'On ne choisi jamais un chat, c’est lui qui vous choisi.',
                'Les chats c’est comme le papier, ça se froisse très vite.',
                'Le chat est d’une honnêteté absolue : les êtres humains cachent, pour une raison ou une autre, leurs sentiments. Les chats, non.',
                'Le silence des chats est contagieux.',
                'J’aime dans le chat cette indifférence avec laquelle il passe des salons à ses gouttières natales.',
                'Le chat ne nous caresse pas, il se caresse à nous.',
                'Quel plus beau cadeau que l’amour d’un chat ?',
                'J’ai donné ma jeunesse et ma beauté aux hommes ; je donne ma sagesse et mon expérience aux animaux.',
                'Le temps passé avec un chat n’est jamais perdu.']

20.times do |i|
  selected_description = descriptions.sample
  item = Item.create(
          title: Faker::Artist.unique.name,
          description: "#{Faker::Creature::Cat.breed} #{selected_description}",
          price: Faker::Number.decimal(l_digits: 2),
        )

  descriptions.delete(selected_description)

  obj = s3.bucket('pixelcat').object("kitten#{i}.png")

  #obj.get(response_target: "app/assets/images/kittens/kitten#{i}.png")

  item.photo.attach(io: File.open("app/assets/images/kittens/kitten#{i}.png"), filename: "kitten#{i}.png")
  
end
