# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'aws-sdk-s3'
s3 = Aws::S3::Resource.new(region: 'eu-west-3')

Item.destroy_all

images = [
  'https://images.unsplash.com/photo-1571988840298-3b5301d5109b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80https://unsplash.com/photos/-81lVsfM4gQ',

  'https://images.unsplash.com/photo-1575964479874-9711db881a4e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',

  'https://images.unsplash.com/photo-1594582768484-a1bf8a868ec9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',

  'https://images.unsplash.com/photo-1609231617449-112c1371bc8e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',

  'https://images.unsplash.com/photo-1579202558739-17e09566bd6f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1521&q=80',

  'https://images.unsplash.com/photo-1620196245140-c33d3c83a0c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80',

  'https://images.unsplash.com/photo-1570453559767-54ea404dff77?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80',

  'https://images.unsplash.com/photo-1526673945462-bbebcd9f24f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',

  'https://images.unsplash.com/photo-1529933037705-0d537317ae7b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',

  'https://images.unsplash.com/photo-1498336179775-9836baef8fdf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',

  'https://images.unsplash.com/photo-1571988801922-00afc7573cad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',

  'https://images.unsplash.com/photo-1573739738911-d73a09ab3033?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',

  'https://images.unsplash.com/photo-1555686722-ba6ed11569ed?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1594&q=80',

  'https://images.unsplash.com/photo-1612869240172-02b64dbb6aed?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80',

  'https://images.unsplash.com/photo-1606764287865-33f8628f9ae0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1427&q=80',

  'https://images.unsplash.com/photo-1582273772688-c7947374e4aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',

  'https://images.unsplash.com/photo-1638320647809-e6ba095ecae3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1467&q=80',

  'https://images.unsplash.com/photo-1638947693998-cda9e5a34f12?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=734&q=80',

  'https://images.unsplash.com/photo-1641378588520-f30c0c36ef84?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
  'https://images.unsplash.com/photo-1535467487981-c86a98db6b9c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'
]

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

  obj.get(response_target: "app/assets/images/kittens/kitten#{i}.png")

  item.photo.attach(io: File.open("app/assets/images/kittens/kitten#{i}.png"), filename: "kitten#{i}.png")
  
end
