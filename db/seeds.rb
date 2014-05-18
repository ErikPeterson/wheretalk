# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


paymentmethods = PaymentMethod.create([
	{:name => "Aetna PPO"},
	{:name => "Out of Pocket"},
	{:name => "Blue Cross Blue Shield"},
	{:name => "Harvard Pilgrim"},
	{:name => "Health First"},
	{:name => "Insurer Plus"}
	]);

users = User.create([
	{
		name: "Dr. Peter Von Nostrand",
		email: "petervn@att.com",
		title: "Psychiatrist",
		degree: "PhD",
		address: "81 West 81st St. New York, NY",
		password: "cosmokramer",
		password_confirmation: "cosmokramer",
		phone: Faker::PhoneNumber.phone_number
	},{
		name: "Art Vandelay",
		email: "boscolover@comcast.net",
		title: "Licensed Social Worker",
		degree: "MSW",
		address: "158 West 84th St. New York, NY",
		password: "georgecostanza",
		password_confirmation: "georgecostanza",
		phone: Faker::PhoneNumber.phone_number
	},{
		name: "Dr. Kel Varnson",
		email: "kel_varnson@nyumed.edu",
		title: "Psychotherapist",
		degree: "PsyD",
		address: "158 West 83th St. New York, NY",
		password: "jerryseinfeld",
		password_confirmation: "jerryseinfeld",
		phone: Faker::PhoneNumber.phone_number
	},{
		name: "Dr. Paloma Benez",
		email: "drbenez@gmail.com",
		title: "Behavorial Therapist",
		degree: "PsyD",
		address: "158 West 82th St. New York, NY",
		password: "elainebenes",
		password_confirmation: "elainebenes",
		phone: Faker::PhoneNumber.phone_number
	},{
		name: Faker::Name.name,
		email: Faker::Internet.email,
		title: "Psychotherapist",
		degree: "PhD",
		password: "testtest",
		password_confirmation: "testtest",
		address: "222 W 23rd St New York, NY",
		phone: Faker::PhoneNumber.phone_number
	},{
		name: Faker::Name.name,
		email: Faker::Internet.email,
		title: "Psychotherapist",
		degree: "PhD",
		password: "testtest",
		password_confirmation: "testtest",
		address: "34-56 107th St Corona, Queens, NY",
		phone: Faker::PhoneNumber.phone_number
	},{
		name: Faker::Name.name,
		email: Faker::Internet.email,
		title: "Psychotherapist",
		degree: "PhD",
		password: "testtest",
		password_confirmation: "testtest",
		address: "28 E 20th St New York, NY",
		phone: Faker::PhoneNumber.phone_number
	},{
		name: Faker::Name.name,
		email: Faker::Internet.email,
		title: "Psychotherapist",
		degree: "PhD",
		password: "testtest",
		password_confirmation: "testtest",
		address: "94 MacDougal St New York, NY",
		phone: Faker::PhoneNumber.phone_number
	},{
		name: Faker::Name.name,
		email: Faker::Internet.email,
		title: "Psychotherapist",
		degree: "PhD",
		password: "testtest",
		password_confirmation: "testtest",
		address: "172 Sullivan St New York, NY",
		phone: Faker::PhoneNumber.phone_number
	},{
		name: Faker::Name.name,
		email: Faker::Internet.email,
		title: "Psychotherapist",
		degree: "PhD",
		password: "testtest",
		password_confirmation: "testtest",
		address: "245 E 73rd Street New York, NY",
		phone: Faker::PhoneNumber.phone_number
	},{
		name: Faker::Name.name,
		email: Faker::Internet.email,
		title: "Psychotherapist",
		degree: "PhD",
		password: "testtest",
		password_confirmation: "testtest",
		address: "66 Perry Street, New York, NY",
		phone: Faker::PhoneNumber.phone_number
	},{
		name: Faker::Name.name,
		email: Faker::Internet.email,
		title: "Psychotherapist",
		degree: "PhD",
		password: "testtest",
		password_confirmation: "testtest",
		address: "136 Waverly Place, New York, NY",
		phone: Faker::PhoneNumber.phone_number
	},{
		name: Faker::Name.name,
		email: Faker::Internet.email,
		title: "Psychotherapist",
		degree: "PhD",
		password: "testtest",
		password_confirmation: "testtest",
		address: "160 Riverside Drive, New York, NY",
		phone: Faker::PhoneNumber.phone_number
	}
]);



specialties = Specialty.create([
	{
		name: "Depression",
		description: "Depression is a mental disorder characterized by a pervasive and persistent low mood that is accompanied by low self-esteem and by a loss of interest or pleasure in normally enjoyable activities.",
	},{
		name: "Generalized Anxiety Disorder",
		description: "Generalized anxiety disorder (GAD) is an anxiety disorder that is characterized by excessive, uncontrollable and often irrational worry. This excessive worry often interferes with daily functioning, as individuals suffering GAD typically anticipate disaster, and are overly concerned about everyday matters such as health issues, money, death, family problems, friendship problems, interpersonal relationship problems, or work difficulties.",
	},{
		name: "Obsessive Compulsive Disorder",
		description: "Obsessive–compulsive disorder (OCD) is an anxiety disorder characterized by intrusive thoughts that produce uneasiness, apprehension, fear, or worry; by repetitive behaviors aimed at reducing the associated anxiety; or by a combination of such obsessions and compulsions.",
	},{
		name: "Substance Dependence",
		description: "Substance dependence is a compulsive need to use psychoactive substances in order to function normally. Substance dependence encompasses both drug and alcohol dependencies.",
	},{
		name: "Relationship Counseling",
		description: "Relationship counseling is the process of counseling the parties of a relationship in an effort to recognize and to better manage or reconcile troublesome differences and repeating patterns of distress. The relationship involved may be between members of a family or a couple (see also family therapy), employees or employers in a workplace, or between a professional and a client.",
	},{
		name: "Grief Counseling",
		description: "Grief counseling is a form of psychotherapy that aims to help people cope with grief and mourning following the death of loved ones, or with major life changes that trigger feelings of grief (e.g., divorce).",
	},{
		name: "Personality Disorders",
		description: "Personality disorders are a class of mental disorders characterised by enduring maladaptive patterns of behavior, cognition and inner experience, exhibited across many contexts and deviating markedly from those accepted by the individual's culture. These patterns develop early, are inflexible and are associated with significant distress or disability.",
	}
]);	

doctors = User.all
specs = Specialty.all
photos = ['female-doctor-1.jpg', 'female-doctor-2.jpg', 'male-doctor.jpg']
pms = PaymentMethod.all
doctors.all.each do |doctor|
	doctor.payment_methods << pms.sample(4)
	doctor.create_schedule
	doctor.schedule.free_blocks << FreeBlock.new(:start_time => "8:00 am", :end_time => "9:00 am", :day_number=> 1)
	doctor.photo_url = photos.sample(1)[0]
	doctor.save
	doctor.specialties << specs.sample(3)
end
