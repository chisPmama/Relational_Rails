# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@maisonmargaux = Restaurant.create(name: 'Maison Margaux', 
                                  location: '224 N 1st St, Minneapolis, MN 55401',
                                  offers_insurance: true,
                                  max_employee_quantity: 20,
                                  opening_date: 20230515)
@eli = @maisonmargaux.employees.create(name: "Eli Fhima", position: "FOH Maitre D", active: true, hired_date: "20230515", hourly_wage: 0, salary: true)
@david = @maisonmargaux.employees.create(name: "David Fhima", position: "BOH Head Chef", active: true, hired_date: "20230515", hourly_wage: 0, salary: true)
@anthea = @maisonmargaux.employees.create(name: "Anthea Yur", position: "FOH Lead Server", active: true, hired_date: "20230715", hourly_wage: 18.50, salary: false)
@bjorn = @maisonmargaux.employees.create(name: "Bjorn Nilsen", position: "FOH General Manager", active: true, hired_date: "20230515", hourly_wage: 0, salary: true)
@margo = @maisonmargaux.employees.create(name: "Margo Potts", position: "FOH Host", active: true, hired_date: "20230908", hourly_wage: 15.00, salary: false)

@fhimas = Restaurant.create(name: 'Fhimas', 
                            location: '40 S 7th St, Minneapolis, MN 55402',
                            offers_insurance: true,
                            max_employee_quantity: 12,
                            opening_date: 20180928)

 @motherdough = Restaurant.create(name: 'Mother Dough', 
                            location: '1st floor fireside lounge, 225 South 6th St, Minneapolis, MN 55402',
                            offers_insurance: false,
                            max_employee_quantity: 5,
                            opening_date: 20230624)

@aldo = @fhimas.employees.create(name: "Aldo Hidalgo", position: "FOH General Manager", active: true, hired_date: "20180928", hourly_wage: 0, salary: true)
@abigail = @maisonmargaux.employees.create(name: "Abigail Landhuis", position "FOH Server", active: false, hired_date: "20230515", hourly_wage: 14.50, salary: false)
@morgan = @maisonmargaux.employees.create(name: "Morgan Hawley", position "BOH Spirits Director", active: false, hired_date: "20230515", hourly_wage: 0, salary: true)