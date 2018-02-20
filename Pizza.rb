crust = ["flatbread","thin","deep dish","Focaccia"]
meats = ["sausage", "pepperoni","ham", "bacon"]
veggies = ["bell peppers","jalapeno","onion","spinach"]
special_topping = ["pineapple","carrot","olives","plantains", "frog legs"]
sauce = ["marinara","pesto","olive oil","hummus"]
extra = ["cheese","plantains", "bell peppers","sausage"]
size = ["small", "medium", "large"]
delivery = [true,false]
wings = ["6 wings","12 wings","18 wings"]
flavors_of_wings = ["bbq", "honey bbq", "hot", "mild", "garlic parmesan", "bacon ranch", "honey mustard"]
drink_choice = ["sprite", "lemonade", "coke"]
salad_type = ["greek", "side", "the house", "frog leg"]
pasta_type = ["rigatoni", "ravolli", "macaroni"]

tax = 0.09

def wings_price(amount)
	if amount == "6 wings"
		8.00
	elsif amount == "12 wings"
		14.00
	else amount == "18 wings"
		20.00
	end
end

def cost(size)
	if size == "small"
		7.00
	elsif size == "medium"
		9.50
	elsif size == "large"
		12.00
	end
end

def delivery?(delivery)
	if delivery == true
		6.50
	else delivery == false
		0
	end
end

def tip_cost(delivery)
	if delivery == true
		5.00
	else delivery == false
		0
	end
end

puts "Welcome to The Pizza Shack"

puts "Our menu consists of Pizzas with:"
puts "#{size[0]}, #{size[1]}, #{size[2]} size."
puts "#{crust[0]}, #{crust[1]}, #{crust[2]}, #{crust[3]} crust."
puts "#{meats[0]}, #{meats[1]}, #{meats[2]}, #{meats[3]} meats."
puts "#{veggies[0]}, #{veggies[1]}, #{veggies[2]}, #{veggies[3]} veggies."
puts "#{special_topping[0]}, #{special_topping[1]}, #{special_topping[2]}, #{special_topping[3]}, #{special_topping[4]} special toppings."
puts "#{sauce[0]}, #{sauce[1]}, #{sauce[2]}, #{sauce[3]} sauce."
puts "#{extra[0]}, #{extra[1]}, #{extra[2]}, #{extra[3]}, #{extra[4]} extras."

puts "We have wings in sizes of: #{wings[0]}, #{wings[1]}, and #{wings[2]}."
puts "We have flavors of wings in: #{flavors_of_wings[0]}, #{flavors_of_wings[1]}, #{flavors_of_wings[2]}, #{flavors_of_wings[3]}, #{flavors_of_wings[4]}, #{flavors_of_wings[5]}, and #{flavors_of_wings[6]}."
puts "We also have a selection of drinks: #{drink_choice[0]}, #{drink_choice[1]}, #{drink_choice[2]}"
puts "We have these select salad types: #{salad_type[0]}, #{salad_type[1]}, #{salad_type[2]}, #{salad_type[3]}"
puts "We also have #{pasta_type[0]}, #{pasta_type[1]}, and #{pasta_type[2]} pasta."

puts "How many pizzas are you ordering?"
pizzas = gets.chomp.to_i

puts "Okay, you will have #{pizzas} pizzas"

delivery_choice = delivery.sample
delivery_cost = delivery?(delivery_choice)
tip = tip_cost(delivery_choice)
pizza = 1
subtotal = 0
while pizza <= pizzas do
	pizza_size = size.sample
	pizza_cost = cost(pizza_size)
	
	
	puts "Pizza #{pizza}"
	puts "Okay, so you're ordering a #{pizza_size} pizza which costs $#{pizza_cost}."
	puts "Alright, you will have #{crust.sample} crust, #{sauce.sample} for your sauce, #{meats.sample} as your meat, #{veggies.sample}, #{special_topping.sample} as your special topping, and the extra is #{extra.sample}."
	subtotal += pizza_cost
	total_cost = subtotal*tax
	pizza +=1
end

puts "Would you like wings?"
wing_choice = gets.chomp

if wing_choice == "yes"
	wings_amount = wings.sample
	wings_cost =  wings_price(wings_amount)
	puts "Alright, so you ordered #{wings_amount}, with #{flavors_of_wings.sample} for #{wings_price(wings_amount)}"
else
	wings_cost = 0
end

puts "Would you like a drink?"
drink = gets.chomp

if drink == "yes"
	puts "Alright, so your drink choice is #{drink_choice.sample}"
	drink_cost = 1.50
else
	drink_cost = 0
end

puts "Would you like salad?"
salad_choice = gets.chomp

if salad_choice == "yes"
	puts "Alright, your salad choice is #{salad_type.sample}"
	salad_cost = 2
else
	salad_cost = 0
end

puts "would you like pasta?"
pasta_choice = gets.chomp

if pasta_choice == "yes"
	puts "Your pasta choice is #{pasta_type.sample}"
	pasta_cost = 3.50
else
	pasta_cost = 0
end

total_cost += wings_cost + drink_cost + salad_cost + pasta_cost

puts "The total cost with tax is $#{sprintf("%.02f", total_cost)}"
puts "The delivery cost is $#{sprintf("%.02f", delivery_cost)}"
puts "The tip cost is $#{sprintf("%.02f", tip)}"