Cuisine.create!([
  {genre: "Italian"},
  {genre: "Gluten-Free"},
  {genre: "American (New)"},
  {genre: "Gastropub"},
  {genre: "Chinese"},
  {genre: "Asian Fusion"},
  {genre: "Southern"},
  {genre: "Spanish"},
  {genre: "Tapas"},
  {genre: "Seafood"},
  {genre: "Sandwiches"},
  {genre: "Desserts"},
  {genre: "Catalan"}
])

Restaurant.create!([
  {name: "Pubbelly", address_1: "1418 20th St", address_2: "", city: "Miami Beach", state: "FL", zipcode: "33139", description: "", phone: "3055327555", dollars: 3, reservations: false, hide: nil, avatar_file_name: "pubbelly.jpeg", avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Yardbird Southern Table and Bar", address_1: "1600 Lenox Ave", address_2: "", city: "Miami Beach", state: "FL", zipcode: "33139", description: "", phone: "3055385220", dollars: 3, reservations: true, hide: nil, avatar_file_name: "yardbird-1.jpg", avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Tongue & Cheek", address_1: "431 Washington Ave", address_2: "", city: "Miami Beach", state: "FL", zipcode: "33139", description: "", phone: "3057042900", dollars: 3, reservations: true, hide: nil, avatar_file_name: "MIA_TongueCheek_MIA.jpg", avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Black Brick", address_1: "3451 NE 1 Ave", address_2: "Ste 103", city: "Miami", state: "FL", zipcode: "33137", description: "", phone: "3055738886", dollars: 2, reservations: false, hide: nil, avatar_file_name: "download.jpeg", avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "MC Kitchen", address_1: "4141 NE 2nd Ave", address_2: "", city: "Miami", state: "FL", zipcode: "33137", description: "", phone: "3054569948", dollars: 3, reservations: true, hide: nil, avatar_file_name: "twitpic.jpg", avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "The Dutch", address_1: "2201 Collins Ave", address_2: "", city: "Miami Beach", state: "FL", zipcode: "33139", description: "", phone: "3059383111", dollars: 3, reservations: true, hide: nil, avatar_file_name: "the-dutch-miami-beach1.jpg", avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "The District", address_1: "190 NE 46th St", address_2: "", city: "Miami", state: "FL", zipcode: "33137", description: "", phone: "3055734199", dollars: 3, reservations: true, hide: nil, avatar_file_name: "548f0c02f3d5ef9bfd0b92ce710afa48_400x400.jpeg", avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Mignonette", address_1: "210 NE 18th St", address_2: "", city: "Miami", state: "FL", zipcode: "33132", description: "", phone: "3053744635", dollars: 3, reservations: true, hide: nil, avatar_file_name: "Mignonette-Oyster-Bar-in-Miamis-Edgwater.png", avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Mmmm", address_1: "2519 NW 2nd Ave", address_2: "", city: "Miami", state: "AL", zipcode: "33137", description: "", phone: "7867033409", dollars: 1, reservations: true, hide: nil, avatar_file_name: "mmmm.jpg", avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Niu Kitchen", address_1: "134 NE 2nd Ave", address_2: "", city: "Miami", state: "FL", zipcode: "33132", description: "", phone: "7865425070", dollars: 2, reservations: true, hide: nil, avatar_file_name: "safe_image.jpeg", avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "The Federal", address_1: "5132 Biscayne Blvd", address_2: "", city: "Miami", state: "FL", zipcode: "33137", description: "", phone: "3057589559", dollars: 2, reservations: true, hide: nil, avatar_file_name: "tumblr_lz3wn2Y5Et1qboztc.jpg", avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil}
])

RestaurantCuisine.create!([
  {restaurant_id: 1, cuisine_id: 3},
  {restaurant_id: 1, cuisine_id: 4},
  {restaurant_id: 1, cuisine_id: 9},
  {restaurant_id: 2, cuisine_id: 7},
  {restaurant_id: 3, cuisine_id: 3},
  {restaurant_id: 3, cuisine_id: 4},
  {restaurant_id: 4, cuisine_id: 5},
  {restaurant_id: 5, cuisine_id: 1},
  {restaurant_id: 6, cuisine_id: 3},
  {restaurant_id: 7, cuisine_id: 3},
  {restaurant_id: 8, cuisine_id: 10},
  {restaurant_id: 9, cuisine_id: 11},
  {restaurant_id: 9, cuisine_id: 12},
  {restaurant_id: 10, cuisine_id: 8},
  {restaurant_id: 10, cuisine_id: 9},
  {restaurant_id: 10, cuisine_id: 13},
  {restaurant_id: 11, cuisine_id: 3},
  {restaurant_id: 11, cuisine_id: 4}
])

Menu.create!([
  {name: "Dinner", description: "", hide: nil},
  {name: "Sunday Brunch Fare", description: "", hide: nil},
  {name: "Brunch", description: "", hide: nil},
  {name: "Lunch", description: "", hide: nil},
  {name: "Supper", description: "", hide: nil},
  {name: "Dessert", description: "", hide: nil},
  {name: "Brunch", description: "", hide: nil},
  {name: "Lunch", description: "", hide: nil},
  {name: "Happy Hour", description: "", hide: nil},
  {name: "Dinner", description: "", hide: nil},
  {name: "Kids", description: "", hide: nil},
  {name: "Dim Sum Sunday", description: "", hide: nil},
  {name: "Dim Sum", description: "", hide: nil},
  {name: "Brunch", description: "", hide: nil},
  {name: "Lunch", description: "", hide: nil},
  {name: "Dinner", description: "", hide: nil},
  {name: "Dessert", description: "", hide: nil},
  {name: "Breakfast", description: "", hide: nil},
  {name: "Lunch", description: "", hide: nil},
  {name: "Supper", description: "", hide: nil},
  {name: "Dessert", description: "", hide: nil},
  {name: "Lunch", description: "", hide: nil},
  {name: "Brunch", description: "", hide: nil},
  {name: "Supper", description: "", hide: nil},
  {name: "Sea Food Tower", description: "", hide: nil},
  {name: "Happy Hour", description: "", hide: nil},
  {name: "Lunch", description: "", hide: nil},
  {name: "Dinner", description: "", hide: nil},
  {name: "Dessert", description: "", hide: nil},
  {name: "Happy Hour", description: "", hide: nil},
  {name: "Menu", description: "", hide: nil},
  {name: "Lunch", description: "", hide: nil},
  {name: "Dinner", description: "", hide: nil},
  {name: "Brunch", description: "", hide: nil},
  {name: "Supper", description: "", hide: nil}
])

RestaurantMenu.create!([
  {restaurant_id: 1, menu_id: 1},
  {restaurant_id: 1, menu_id: 2},
  {restaurant_id: 2, menu_id: 3},
  {restaurant_id: 2, menu_id: 4},
  {restaurant_id: 2, menu_id: 5},
  {restaurant_id: 2, menu_id: 6},
  {restaurant_id: 3, menu_id: 7},
  {restaurant_id: 3, menu_id: 8},
  {restaurant_id: 3, menu_id: 9},
  {restaurant_id: 3, menu_id: 10},
  {restaurant_id: 3, menu_id: 11},
  {restaurant_id: 4, menu_id: 12},
  {restaurant_id: 4, menu_id: 13},
  {restaurant_id: 5, menu_id: 14},
  {restaurant_id: 5, menu_id: 15},
  {restaurant_id: 5, menu_id: 16},
  {restaurant_id: 5, menu_id: 17},
  {restaurant_id: 5, menu_id: 18},
  {restaurant_id: 6, menu_id: 18},
  {restaurant_id: 6, menu_id: 19},
  {restaurant_id: 6, menu_id: 20},
  {restaurant_id: 6, menu_id: 21},
  {restaurant_id: 7, menu_id: 22},
  {restaurant_id: 7, menu_id: 23},
  {restaurant_id: 7, menu_id: 24},
  {restaurant_id: 7, menu_id: 25},
  {restaurant_id: 7, menu_id: 26},
  {restaurant_id: 8, menu_id: 27},
  {restaurant_id: 8, menu_id: 28},
  {restaurant_id: 8, menu_id: 29},
  {restaurant_id: 8, menu_id: 30},
  {restaurant_id: 9, menu_id: 31},
  {restaurant_id: 10, menu_id: 32},
  {restaurant_id: 10, menu_id: 33},
  {restaurant_id: 11, menu_id: 34},
  {restaurant_id: 11, menu_id: 35}
])


Category.create!([
  {name: "Plates", menu_id: 1, hide: false},
  {name: "Vegetables & Sides", menu_id: 1, hide: false},
  {name: "Raw Bar & Charcuterie", menu_id: 1, hide: false},
  {name: "Dumplings", menu_id: 1, hide: false},
  {name: "Noodles & Rice", menu_id: 1, hide: false},
  {name: "Summer", menu_id: 1, hide: false},
  {name: "Bread", menu_id: 1, hide: false}
])

Ingredient.create!([
  {name: "pork belly", restaurant_id: 1, description: "underside of a pig"},
  {name: "parsley aioli", restaurant_id: 1, description: "mayonnaise with olive oil and parsley"},
  {name: "goat cream", restaurant_id: 1, description: "goat cream cheese"},
  {name: "bacon", restaurant_id: 1, description: "bacon is bacon"},
  {name: "kimchee", restaurant_id: 1, description: "korean vegetables"},
  {name: "bbq", restaurant_id: 1, description: ""},
  {name: "pickles", restaurant_id: 1, description: ""},
  {name: "chicken thighs", restaurant_id: 1, description: ""},
  {name: "mustard miso", restaurant_id: 1, description: ""},
  {name: "bibb lettuce", restaurant_id: 1, description: ""},
  {name: "apples", restaurant_id: 1, description: ""},
  {name: "quail egg", restaurant_id: 1, description: ""},
  {name: "green mustard", restaurant_id: 1, description: ""},
  {name: "tobanjan", restaurant_id: 1, description: ""},
  {name: "pinenuts", restaurant_id: 1, description: ""},
  {name: "garlic chips", restaurant_id: 1, description: ""},
  {name: "lemongrass", restaurant_id: 1, description: ""},
  {name: "romesco", restaurant_id: 1, description: ""},
  {name: "hazelnuts", restaurant_id: 1, description: ""},
  {name: "smoked soy", restaurant_id: 1, description: ""},
  {name: "serrano", restaurant_id: 1, description: ""},
  {name: "schichimi", restaurant_id: 1, description: ""},
  {name: "crispy garlic", restaurant_id: 1, description: ""},
  {name: "soft tofu", restaurant_id: 1, description: ""},
  {name: "amazu ponzu", restaurant_id: 1, description: ""},
  {name: "blueberries", restaurant_id: 1, description: ""},
  {name: "sesame oil", restaurant_id: 1, description: ""},
  {name: "local peaches", restaurant_id: 1, description: ""},
  {name: "tarragon", restaurant_id: 1, description: ""},
  {name: "grapefruit", restaurant_id: 1, description: ""},
  {name: "ginger", restaurant_id: 1, description: ""},
  {name: "pickled daikon", restaurant_id: 1, description: ""},
  {name: "sesame oil powder", restaurant_id: 1, description: ""},
  {name: "citrus gremolata", restaurant_id: 1, description: ""},
  {name: "bacon jam", restaurant_id: 1, description: ""},
  {name: "miso butter toast", restaurant_id: 1, description: ""},
  {name: "amazu shoga miso", restaurant_id: 1, description: ""},
  {name: "sweet peppers", restaurant_id: 1, description: ""},
  {name: "jalapeño", restaurant_id: 1, description: ""},
  {name: "cucumber", restaurant_id: 1, description: ""},
  {name: "dry miso", restaurant_id: 1, description: ""},
  {name: "kabocha squash", restaurant_id: 1, description: ""},
  {name: "butterscotch miso", restaurant_id: 1, description: ""},
  {name: "corn powder", restaurant_id: 1, description: ""},
  {name: "tomatoes", restaurant_id: 1, description: ""},
  {name: "japanese escabeche", restaurant_id: 1, description: ""},
  {name: "shiro soy", restaurant_id: 1, description: ""},
  {name: "shiso garlic butter", restaurant_id: 1, description: ""},
  {name: "sea salt ", restaurant_id: 1, description: ""},
  {name: "baguette", restaurant_id: 1, description: ""},
  {name: "chorizo", restaurant_id: 1, description: ""},
  {name: "piquillo", restaurant_id: 1, description: ""},
  {name: "yuzu", restaurant_id: 1, description: ""},
  {name: "dried soy beans", restaurant_id: 1, description: ""},
  {name: "suckling pig", restaurant_id: 1, description: ""},
  {name: "glazed onions", restaurant_id: 1, description: ""},
  {name: "florida swiss chard", restaurant_id: 1, description: ""},
  {name: "apple jus", restaurant_id: 1, description: ""},
  {name: "housemade kimchee & pork sausage", restaurant_id: 1, description: ""},
  {name: "gochujang aioli", restaurant_id: 1, description: ""},
  {name: "mortadella mustard", restaurant_id: 1, description: ""},
  {name: "tamari soy", restaurant_id: 1, description: ""},
  {name: "mustard", restaurant_id: 1, description: ""},
  {name: "almonds", restaurant_id: 1, description: ""},
  {name: "shoyu broth", restaurant_id: 1, description: ""},
  {name: "shortrib", restaurant_id: 1, description: ""},
  {name: "truffle", restaurant_id: 1, description: ""},
  {name: "egg", restaurant_id: 1, description: ""},
  {name: "bacon miso", restaurant_id: 1, description: ""},
  {name: "burratina", restaurant_id: 1, description: ""},
  {name: "tosazu", restaurant_id: 1, description: ""},
  {name: "evoo", restaurant_id: 1, description: ""},
  {name: "orange", restaurant_id: 1, description: ""},
  {name: "cinnamon", restaurant_id: 1, description: ""},
  {name: "soy brown butter", restaurant_id: 1, description: ""},
  {name: "su-shoyu", restaurant_id: 1, description: ""},
  {name: "shichimi", restaurant_id: 1, description: ""},
  {name: "onion marmalade", restaurant_id: 1, description: ""},
  {name: "black truffle", restaurant_id: 1, description: ""},
  {name: "corn soy", restaurant_id: 1, description: ""},
  {name: "shiso", restaurant_id: 1, description: ""},
  {name: "parmigiano", restaurant_id: 1, description: ""},
  {name: "white cabbage soy", restaurant_id: 1, description: ""},
  {name: "1000 island", restaurant_id: 1, description: ""},
  {name: "caraway powder", restaurant_id: 1, description: ""},
  {name: "corn", restaurant_id: 1, description: ""},
  {name: "favas", restaurant_id: 1, description: ""},
  {name: "parmesan", restaurant_id: 1, description: ""},
  {name: "squid ink black butter", restaurant_id: 1, description: ""},
  {name: "bbq pork belly", restaurant_id: 1, description: ""},
  {name: "spicy lemongrass broth", restaurant_id: 1, description: ""},
  {name: "poached egg", restaurant_id: 1, description: ""},
  {name: "green peas", restaurant_id: 1, description: ""},
  {name: "confit porkbelly", restaurant_id: 1, description: ""},
  {name: "black pepper", restaurant_id: 1, description: ""},
  {name: "porkbelly & pineapple", restaurant_id: 1, description: ""},
  {name: "seafood & aioli", restaurant_id: 1, description: ""},
  {name: "pickled red grapes", restaurant_id: 1, description: ""},
  {name: "beef cheek marmalade", restaurant_id: 1, description: ""},
  {name: "mini baked brioche", restaurant_id: 1, description: ""},
  {name: "bigeye tuna tartare", restaurant_id: 1, description: ""},
  {name: "tomato pulp", restaurant_id: 1, description: ""},
  {name: "croutons", restaurant_id: 1, description: ""},
  {name: "pickled cucumber", restaurant_id: 1, description: ""},
  {name: "soft parmesan polenta", restaurant_id: 1, description: ""},
  {name: "tomato jus", restaurant_id: 1, description: ""},
  {name: "shiso ricotta", restaurant_id: 1, description: ""},
  {name: "black truffle gnudi", restaurant_id: 1, description: ""},
  {name: "asparagus", restaurant_id: 1, description: ""},
  {name: "hazlenut", restaurant_id: 1, description: ""},
  {name: "oyster mushroom", restaurant_id: 1, description: ""},
  {name: "sarvecchio", restaurant_id: 1, description: ""},
  {name: "hollandaise", restaurant_id: 1, description: ""},
  {name: "haricoverts", restaurant_id: 1, description: ""},
  {name: "almonds & brown butter", restaurant_id: 1, description: ""},
  {name: "scallions", restaurant_id: 1, description: ""},
  {name: "pickled ramps", restaurant_id: 1, description: ""},
  {name: "onion jus", restaurant_id: 1, description: ""}
])

Dish.create!([
  {name: "Croquetas", description: "", portion_size: "Medium", spice: 0, hot: true, gluten_free: false, vegetarian: false, hide: false, category_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Dates avec Chorizo", description: "", portion_size: "Medium", spice: 0, hot: true, gluten_free: false, vegetarian: false, hide: false, category_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "McBelly", description: "", portion_size: "Medium", spice: 3, hot: true, gluten_free: false, vegetarian: false, hide: false, category_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Fried Chicken", description: "Murray's Family Farm, NY", portion_size: "Medium", spice: 3, hot: true, gluten_free: false, vegetarian: false, hide: false, category_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Shortrib Tartare", description: "Meyer Ranch, CO", portion_size: "Medium", spice: 0, hot: true, gluten_free: false, vegetarian: false, hide: false, category_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Japanese Amberjack", description: "Sea of Japan", portion_size: "Medium", spice: 0, hot: true, gluten_free: false, vegetarian: false, hide: false, category_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Salt & Pepper Squid", description: "Mongo Ika. Thailand", portion_size: "Medium", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Heirloom Tomatoes", description: "Palm Beach, Florida", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Domestic Burrata", description: "Di Steffanos Creamery, CA", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Korean Style Sweetbreads", description: "Strauss Farms, Iowa", portion_size: "Medium", spice: 3, hot: true, gluten_free: false, vegetarian: false, hide: false, category_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Chopped Bone Marrow", description: "Cox Farms, Alabama", portion_size: "Medium", spice: 0, hot: true, gluten_free: false, vegetarian: false, hide: false, category_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Skate Cheeks", description: "Cape Cod, MA", portion_size: "Medium", spice: 2, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Pork Belly", description: "Duroc, Compart Family Farms, MN", portion_size: "Medium", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Fried Snapper Salad", description: "Snapper Ledge, Florida Keys", portion_size: "Medium", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Bay Scallops Bourguinon", description: "Nantucket, MA", portion_size: "Medium", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Octopus a la Plancha", description: "Galicia Spain", portion_size: "Medium", spice: 1, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Cochinillo", description: "Martins Ranch, FL", portion_size: "Medium", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "The Korean Dog", description: "", portion_size: "Medium", spice: 3, hot: true, gluten_free: false, vegetarian: false, hide: false, category_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Green Beans", description: "", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: true, hide: false, category_id: 2, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Mofongo", description: "", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 2, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Soft Polenta", description: "", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 2, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Brussels Sprouts", description: "", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 2, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Brocolli Rabe", description: "", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 2, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Riptide", description: "Westport, MA, USA", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 3, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Duxbury", description: "Duxbury Bay, MA, USA", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 3, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Chorizo", description: "Olli Salumeria, Virgina", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 3, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Paleta Iberica", description: "Salamanca, Spain", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 3, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Formagio Parrano", description: "Italia", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 3, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Pan con Tomate", description: "", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 7, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Pan con Ajo", description: "", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 7, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Goat Butter Toast", description: "", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 7, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Baguette", description: "", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 7, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Miso Butter Toast", description: "", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 7, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Duck & Pumpkin", description: "", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 4, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Pork Belly & Scallion", description: "", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 4, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Shortrib & Corn", description: "", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 4, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Pastrami Sauerkraut", description: "", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 4, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Mushroom & Huitlacoche", description: "", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 4, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Pubbelly Ramen", description: "", portion_size: "Full", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 5, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Udon Carbonara", description: "", portion_size: "Full", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 5, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Kimchee Fried Rice", description: "", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 5, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Kimchee Fried Rice", description: "", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 5, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Foie Gras Mousse", description: "Hudson Valley, NY", portion_size: "Small", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 6, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Heirloom Tomato Gazpacho", description: "", portion_size: "Medium", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 6, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Pubbelly Meatballs", description: "", portion_size: "Medium", spice: 0, hot: true, gluten_free: false, vegetarian: false, hide: false, category_id: 6, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Pork Cheeks", description: "Niman Ranch, CO", portion_size: "Medium", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 6, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Rainbow Trout Amandine", description: "Clear Springs, Idaho", portion_size: "Medium", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 6, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "Dry Aged Hanger Steak", description: "Cox Farms, Alabama", portion_size: "Full", spice: 0, hot: false, gluten_free: false, vegetarian: false, hide: false, category_id: 6, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil}
])
DishIngredient.create!([
  {dish_id: 1, ingredient_id: 1},
  {dish_id: 1, ingredient_id: 2},
  {dish_id: 19, ingredient_id: 62},
  {dish_id: 2, ingredient_id: 3},
  {dish_id: 2, ingredient_id: 4},
  {dish_id: 19, ingredient_id: 63},
  {dish_id: 19, ingredient_id: 64},
  {dish_id: 3, ingredient_id: 5},
  {dish_id: 3, ingredient_id: 6},
  {dish_id: 3, ingredient_id: 7},
  {dish_id: 20, ingredient_id: 1},
  {dish_id: 20, ingredient_id: 65},
  {dish_id: 4, ingredient_id: 8},
  {dish_id: 4, ingredient_id: 9},
  {dish_id: 4, ingredient_id: 10},
  {dish_id: 21, ingredient_id: 66},
  {dish_id: 21, ingredient_id: 67},
  {dish_id: 5, ingredient_id: 11},
  {dish_id: 5, ingredient_id: 12},
  {dish_id: 5, ingredient_id: 13},
  {dish_id: 5, ingredient_id: 14},
  {dish_id: 5, ingredient_id: 15},
  {dish_id: 21, ingredient_id: 68},
  {dish_id: 22, ingredient_id: 49},
  {dish_id: 6, ingredient_id: 16},
  {dish_id: 6, ingredient_id: 17},
  {dish_id: 6, ingredient_id: 18},
  {dish_id: 6, ingredient_id: 19},
  {dish_id: 22, ingredient_id: 69},
  {dish_id: 7, ingredient_id: 20},
  {dish_id: 7, ingredient_id: 21},
  {dish_id: 7, ingredient_id: 22},
  {dish_id: 7, ingredient_id: 23},
  {dish_id: 23, ingredient_id: 70},
  {dish_id: 23, ingredient_id: 71},
  {dish_id: 23, ingredient_id: 72},
  {dish_id: 8, ingredient_id: 24},
  {dish_id: 8, ingredient_id: 25},
  {dish_id: 8, ingredient_id: 26},
  {dish_id: 8, ingredient_id: 27},
  {dish_id: 34, ingredient_id: 64},
  {dish_id: 9, ingredient_id: 28},
  {dish_id: 9, ingredient_id: 29},
  {dish_id: 9, ingredient_id: 30},
  {dish_id: 9, ingredient_id: 31},
  {dish_id: 34, ingredient_id: 73},
  {dish_id: 34, ingredient_id: 74},
  {dish_id: 34, ingredient_id: 75},
  {dish_id: 10, ingredient_id: 5},
  {dish_id: 10, ingredient_id: 32},
  {dish_id: 10, ingredient_id: 33},
  {dish_id: 11, ingredient_id: 34},
  {dish_id: 11, ingredient_id: 35},
  {dish_id: 11, ingredient_id: 36},
  {dish_id: 35, ingredient_id: 76},
  {dish_id: 35, ingredient_id: 77},
  {dish_id: 35, ingredient_id: 78},
  {dish_id: 12, ingredient_id: 37},
  {dish_id: 12, ingredient_id: 38},
  {dish_id: 12, ingredient_id: 39},
  {dish_id: 12, ingredient_id: 40},
  {dish_id: 12, ingredient_id: 41},
  {dish_id: 36, ingredient_id: 79},
  {dish_id: 13, ingredient_id: 42},
  {dish_id: 13, ingredient_id: 43},
  {dish_id: 13, ingredient_id: 44},
  {dish_id: 36, ingredient_id: 80},
  {dish_id: 36, ingredient_id: 81},
  {dish_id: 36, ingredient_id: 82},
  {dish_id: 14, ingredient_id: 45},
  {dish_id: 14, ingredient_id: 46},
  {dish_id: 14, ingredient_id: 47},
  {dish_id: 15, ingredient_id: 48},
  {dish_id: 15, ingredient_id: 49},
  {dish_id: 15, ingredient_id: 50},
  {dish_id: 37, ingredient_id: 83},
  {dish_id: 37, ingredient_id: 84},
  {dish_id: 37, ingredient_id: 85},
  {dish_id: 16, ingredient_id: 51},
  {dish_id: 16, ingredient_id: 52},
  {dish_id: 16, ingredient_id: 53},
  {dish_id: 16, ingredient_id: 54},
  {dish_id: 38, ingredient_id: 86},
  {dish_id: 17, ingredient_id: 55},
  {dish_id: 17, ingredient_id: 56},
  {dish_id: 17, ingredient_id: 57},
  {dish_id: 17, ingredient_id: 58},
  {dish_id: 38, ingredient_id: 87},
  {dish_id: 38, ingredient_id: 88},
  {dish_id: 38, ingredient_id: 89},
  {dish_id: 18, ingredient_id: 7},
  {dish_id: 18, ingredient_id: 60},
  {dish_id: 18, ingredient_id: 61},
  {dish_id: 39, ingredient_id: 90},
  {dish_id: 39, ingredient_id: 91},
  {dish_id: 39, ingredient_id: 92},
  {dish_id: 40, ingredient_id: 88},
  {dish_id: 40, ingredient_id: 92},
  {dish_id: 40, ingredient_id: 93},
  {dish_id: 40, ingredient_id: 94},
  {dish_id: 40, ingredient_id: 95},
  {dish_id: 41, ingredient_id: 96},
  {dish_id: 42, ingredient_id: 97},
  {dish_id: 43, ingredient_id: 98},
  {dish_id: 43, ingredient_id: 99},
  {dish_id: 43, ingredient_id: 100},
  {dish_id: 44, ingredient_id: 72},
  {dish_id: 44, ingredient_id: 101},
  {dish_id: 44, ingredient_id: 102},
  {dish_id: 44, ingredient_id: 103},
  {dish_id: 44, ingredient_id: 104},
  {dish_id: 45, ingredient_id: 1},
  {dish_id: 45, ingredient_id: 105},
  {dish_id: 45, ingredient_id: 106},
  {dish_id: 45, ingredient_id: 107},
  {dish_id: 46, ingredient_id: 108},
  {dish_id: 46, ingredient_id: 109},
  {dish_id: 46, ingredient_id: 110},
  {dish_id: 46, ingredient_id: 111},
  {dish_id: 46, ingredient_id: 112},
  {dish_id: 47, ingredient_id: 113},
  {dish_id: 47, ingredient_id: 114},
  {dish_id: 47, ingredient_id: 115},
  {dish_id: 48, ingredient_id: 18},
  {dish_id: 48, ingredient_id: 116},
  {dish_id: 48, ingredient_id: 117},
  {dish_id: 48, ingredient_id: 118}
])
