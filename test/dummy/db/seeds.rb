us = Country.where(name: 'United States', iso2: 'us', iso3: 'usa', un: '840').first_or_create
au = Country.where(name: 'Australia', iso2: 'au', iso3: 'aus', un: '036').first_or_create

Item.where(height: 70, width: 36, depth: 2, sku: 'STEEL001').first_or_create
Item.where(height: 70, width: 32, depth: 1, sku: 'WOOD001').first_or_create
Item.where(height: 2, width: 4, depth: 4, sku: 'GLASS002').first_or_create
Item.where(height: 3, width: 3, depth: 4, sku: 'NICKEL002').first_or_create

steel_door = Door.where(sku: 'STEEL001').first_or_create
wood_door = Door.where(sku: 'WOOD001').first_or_create

Handle.where(openable: steel_door, sku: 'GLASS002').first_or_create
Handle.where(openable: wood_door, sku: 'NICKEL002').first_or_create

main = us.homes.where(address: '123 Main St').first_or_create
linden = us.homes.where(address: '100 Linden Ave').first_or_create
bagel = au.homes.where(address: '200 Bagel Bay').first_or_create

main.home_doors.where(door: steel_door, location: 'front').first_or_create
main.home_doors.where(door: wood_door, location: 'back').first_or_create

linden.home_doors.where(door: steel_door, location: 'front').first_or_create
bagel.home_doors.where(door: wood_door, location: 'side').first_or_create
