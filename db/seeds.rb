u = User.create(email: "358443460162@fake.me", password: "1234567890", phone_number: "358443460162", confirmation_code: 202324)
u.auths.create(token: "test", secret: "test")

h1 = House.create(address: "Urheilukatu 20, 00250 Helsinki", thumbnail: "http://mediaserver.asunnot.oikotie.fi/180*135/213063/thumb/106531285.jpg")
h2 = House.create(address: "Oksasenkatu 3, 00100 Helsinki", thumbnail: "http://mediaserver.asunnot.oikotie.fi/180*135/212876/thumb/106437697.jpg")
h3 = House.create(address: "Kalevankatu 25, 00100 Helsinki", thumbnail: "http://mediaserver.asunnot.oikotie.fi/180*135/212616/thumb/106307825.jpg")
h4 = House.create(address: "Väinämöisenkatu 23, 00100 Helsinki", thumbnail: "http://mediaserver.asunnot.oikotie.fi/180*135/212871/thumb/106435275.jpg")
h5 = House.create(address: "Köydenpunojankatu 4, FI-00180 Helsinki", thumbnail: "http://mediaserver.asunnot.oikotie.fi/180*135/212019/thumb/106009247.jpg")

f11 = Facility.create(name: "Sauna 1 Urheilukatu 20A", thumbnail: "http://hoas.ayy.fi/kuvat/OtaHoas-Jmt10EF-Sauna-mini.JPG")
f12 = Facility.create(name: "Sauna 2 Urheilukatu 20A", thumbnail: "https://www.hoas.fi/www/hoasimages.nsf/images/Paraistentie%2019_sauna.jpg/$FILE/Paraistentie%2019_sauna.jpg")
f13 = Facility.create(name: "Laundry 1 Urheilukatu 20B", thumbnail: "https://www.cooper.edu/sites/default/files/laundry_room.jpg")
f13 = Facility.create(name: "Laundry 2 Urheilukatu 20B", thumbnail: "https://www.cooper.edu/sites/default/files/laundry_room.jpg")

f21 = Facility.create(name: "Sauna 1 Oksasenkatu 3A")
f22 = Facility.create(name: "Sauna 2 Oksasenkatu 3C")
f23 = Facility.create(name: "Laundry 1 Oksasenkatu 3C")

f31 = Facility.create(name: "Sauna 1 Kalevankatu 25A")
f32 = Facility.create(name: "Sauna 2 Kalevankatu 25F")
f33 = Facility.create(name: "Laundry 1 Kalevankatu 25F")

f41 = Facility.create(name: "Sauna 1 Väinämöisenkatu 23")
f42 = Facility.create(name: "Laundry 1 Väinämöisenkatu 23")

f51 = Facility.create(name: "Sauna 1 Köydenpunojankatu 4A")
f52 = Facility.create(name: "Sauna 2 Köydenpunojankatu 4B")
f53 = Facility.create(name: "Laundry 1 Köydenpunojankatu 4B")


h1.facility_ids = [f11.id,f12.id,f13.id]
h2.facility_ids = [f21.id,f22.id,f23.id]
h3.facility_ids = [f31.id,f32.id,f33.id]
h4.facility_ids = [f41.id,f42.id]
h5.facility_ids = [f51.id,f52.id,f53.id]


# h1 = House.create(address: "Lorem ipsum dolor 1", thumbnail: "http://lorempixel.com/400/200/")
# h2 = House.create(address: "Lorem ipsum dolor 2", thumbnail: "http://lorempixel.com/400/200/")
# h3 = House.create(address: "Lorem ipsum dolor 3", thumbnail: "http://lorempixel.com/400/200/")
# h4 = House.create(address: "Lorem ipsum dolor 4", thumbnail: "http://lorempixel.com/400/200/")
# h5 = House.create(address: "Lorem ipsum dolor 5", thumbnail: "http://lorempixel.com/400/200/")


# f11 = Facility.create(name: "Room 1", thumbnail: "http://lorempixel.com/400/200/")
# f12 = Facility.create(name: "Room 2", thumbnail: "http://lorempixel.com/400/200/")
# f13 = Facility.create(name: "Room 3", thumbnail: "http://lorempixel.com/400/200/")
# f13 = Facility.create(name: "Room 4", thumbnail: "http://lorempixel.com/400/200/")

# f21 = Facility.create(name: "Room 5", thumbnail: "http://lorempixel.com/400/200/")
# f22 = Facility.create(name: "Room 6", thumbnail: "http://lorempixel.com/400/200/")
# f23 = Facility.create(name: "Room 7", thumbnail: "http://lorempixel.com/400/200/")

# f31 = Facility.create(name: "Room 8", thumbnail: "http://lorempixel.com/400/200/")
# f32 = Facility.create(name: "Room 9", thumbnail: "http://lorempixel.com/400/200/")
# f33 = Facility.create(name: "Room 10", thumbnail: "http://lorempixel.com/400/200/")

# f41 = Facility.create(name: "Room 11", thumbnail: "http://lorempixel.com/400/200/")
# f42 = Facility.create(name: "Room 12", thumbnail: "http://lorempixel.com/400/200/")

# f51 = Facility.create(name: "Room 13", thumbnail: "http://lorempixel.com/400/200/")
# f52 = Facility.create(name: "Room 14", thumbnail: "http://lorempixel.com/400/200/")
# f53 = Facility.create(name: "Room 15", thumbnail: "http://lorempixel.com/400/200/")


# h1.facility_ids = [f11.id,f12.id,f13.id]
# h2.facility_ids = [f21.id,f22.id,f23.id]
# h3.facility_ids = [f31.id,f32.id,f33.id]
# h4.facility_ids = [f41.id,f42.id]
# h5.facility_ids = [f51.id,f52.id,f53.id]