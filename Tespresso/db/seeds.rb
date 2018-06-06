# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# c1 = Category.create(name: "Capsulas", image: "https://i.pinimg.com/originals/4a/71/fe/4a71fe3d2bc350ef22f576236e59d575.png", description: "frtghy")
# c2 = Category.create(name: "Maquinas", image: "https://www.haceb.com/DesktopModules/Revindex.Dnn.RevindexStorefront/Portals/0/Gallery/cd39434a-9055-4b11-8851-54e907dea74e.jpg" , description: "frtghy")
# c3 = Category.create(name: "Accesorios", image: "https://www.nespresso.com/ecom/medias/sys_master/public/8887718903838/UK-5206-mediaMain.png", description: "frtghy")

c1 = Category.create(name: "Cápsulas", image: "/assets/capsulas-tespresso.png", description: "Cápsulas")
c2 = Category.create(name: "Máquinas", image: "/assets/maquinas-tespresso.png" , description: "Máquinas")
c3 = Category.create(name: "Accesorios", image: "/assets/accesorios-tespresso.png", description: "Accesorios")


p1 = Product.create(name: "capsulaverde1", price: 20.01, description: "desc1", image: "https://i.pinimg.com/originals/4a/71/fe/4a71fe3d2bc350ef22f576236e59d575.png", category_id: c1.id)
p2 = Product.create(name: "capsulaverde2", price: 20.01, description: "desc2", image: "https://i.pinimg.com/originals/4a/71/fe/4a71fe3d2bc350ef22f576236e59d575.png", category_id: c1.id)
p3 = Product.create(name: "capsula amarilla", price: 20.01, description: "rgththghgh", image: "https://i.pinimg.com/originals/4a/71/fe/4a71fe3d2bc350ef22f576236e59d575.png", category_id: c1.id)
p4 = Product.create(name: "capsularnegra", price: 20.01, description: "rgththghgh", image: "https://i.pinimg.com/originals/4a/71/fe/4a71fe3d2bc350ef22f576236e59d575.png", category_id: c1.id)
p5 = Product.create(name: "maquina1", price: 20.01, description: "rgththghgh", image: "https://i.pinimg.com/originals/4a/71/fe/4a71fe3d2bc350ef22f576236e59d575.png", category_id: c2.id)
p6 = Product.create(name: "Accesorio1", price: 20.01, description: "rgththghgh", image: "https://i.pinimg.com/originals/4a/71/fe/4a71fe3d2bc350ef22f576236e59d575.png", category_id: c3.id)

u1 = User.create(email: "user1@gmail.com", password: "holahola")
Order.create(user_id: u1.id, product_id: p1.id )
Order.create(user_id: u1.id, product_id: p2.id )
