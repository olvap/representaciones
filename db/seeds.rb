# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Retailer.find_or_create_by name: 'Agencia 1'
Retailer.find_or_create_by name: 'Agencia 2'
Retailer.find_or_create_by name: 'Agencia 3'

Wholesaler.find_or_create_by name: 'Operadora 1'
Wholesaler.find_or_create_by name: 'Operadora 2'
