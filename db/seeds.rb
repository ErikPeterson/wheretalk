# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
	{
		name: "Dr. Peter Von Nostrand",
		email: "petervn@att.com",
		title: "Psychiatrist",
		degree: "PhD",
		address: "81 West 81st St. New York, NY",
		password: "cosmokramer",
		password_confirmation: "comsmokramer"
	},{
		name: "Art Vandelay",
		email: "boscolover@comcast.net",
		title: "Licensed Social Worker",
		degree: "MSW",
		address: "158 West 84th St. New York, NY",
		password: "georgecostanza",
		password_confirmation: "georgecostanza"
	},{
		name: "Dr. Kel Varnson",
		email: "kel_varnson@nyumed.edu",
		title: "Psychotherapist",
		degree: "PsyD",
		address: "158 West 84th St. New York, NY",
		password: "jerryseinfeld",
		password_confirmation: "jerryseinfeld"
	},{
		name: "Dr. Paloma Benes",
		email: "drbenes@gmail.com",
		title: "Behavorial Therapist",
		degree: "PsyD",
		address: "158 West 84th St. New York, NY",
		password: "jerryseinfeld",
		password_confirmation: "jerryseinfeld"
	}

	]);