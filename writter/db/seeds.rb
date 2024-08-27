# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing data
User.destroy_all
Post.destroy_all
Comment.destroy_all

# Create 10 Users
10.times do |i|
  User.create!(
    email: "user#{i}@example.com",
    first_name: "FirstName#{i}",
    last_name: "LastName#{i}",
  )
end

# Create 10 Posts
10.times do |i|
  Post.create!(
    title: "Post Title #{i}",
    content: "El día de mis setenta cumpleaños volví a mi barrio después de una ausencia de cincuenta años. Me lo concedí como regalo. Quería saborear despacio mis recuerdos. Mansamente, recorrí la estrecha acera que llevaba a mi colegio y volví a ver a mis amigos, a escuchar el crujir de las hojas muertas bajo mis zapatillas, a sentir la mirada precavida de los vecinos clavada en mi nuca, las pistas dibujadas en el asfalto donde hacíamos rodar los cochecitos rellenos de masilla, la pelota de goma, las canicas, los cromos… Mentalmente, en mi paseo, me recordé furtivo en algunos de los inexistentes portales donde robé (o me robaron) los primeros besos, imaginé la impronta del corazón y la flecha con que juré mi primer amor eterno, acaricié la madera de algún viejo banco, arrastré mi mano por las paredes lisas como hacía siempre que recorría el trayecto y me perdí, sin saberlo, como un alma libre cargada de sueños y de esperanzas, en la fronda tupida de la arboleda del paseo donde por primera vez dije un tímido “te quiero”. Aquel día, hasta que me quedé sin chocolate, volví a ser el tímido rubito que siempre andaba con la boca sucia.", # Ensure content is longer than 140 characters
    published: i.even? ? 1 : 0,
    author: User.all.sample.email,
  )
end

# Create 10 Comments
10.times do |i|
  Comment.create!(
    content: "This is comment number #{i}. Lorem ipsum dolor sit amet.",
    author: User.all.sample.email, 
  )
end
