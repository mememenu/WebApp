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
  {name: "Pubbelly", address_1: "1418 20th St", address_2: "", city: "Miami Beach", state: "FL", zipcode: "33139", description: "", phone: "3055327555", dollars: 3, reservations: false},
  {name: "Yardbird Southern Table and Bar", address_1: "1600 Lenox Ave", address_2: "", city: "Miami Beach", state: "FL", zipcode: "33139", description: "", phone: "3055385220", dollars: 3, reservations: true},
  {name: "Tongue & Cheek", address_1: "431 Washington Ave", address_2: "", city: "Miami Beach", state: "FL", zipcode: "33139", description: "", phone: "3057042900", dollars: 3, reservations: true},
  {name: "Black Brick", address_1: "3451 NE 1 Ave", address_2: "Ste 103", city: "Miami", state: "FL", zipcode: "33137", description: "", phone: "3055738886", dollars: 2, reservations: false},
  {name: "MC Kitchen", address_1: "4141 NE 2nd Ave", address_2: "", city: "Miami", state: "FL", zipcode: "33137", description: "", phone: "3054569948", dollars: 3, reservations: true},
  {name: "The Dutch", address_1: "2201 Collins Ave", address_2: "", city: "Miami Beach", state: "FL", zipcode: "33139", description: "", phone: "3059383111", dollars: 3, reservations: true},
  {name: "The District", address_1: "190 NE 46th St", address_2: "", city: "Miami", state: "FL", zipcode: "33137", description: "", phone: "3055734199", dollars: 3, reservations: true},
  {name: "Mignonette", address_1: "210 NE 18th St", address_2: "", city: "Miami", state: "FL", zipcode: "33132", description: "", phone: "3053744635", dollars: 3, reservations: true},
  {name: "Mmmm", address_1: "2519 NW 2nd Ave", address_2: "", city: "Miami", state: "AL", zipcode: "33137", description: "", phone: "7867033409", dollars: 1, reservations: true},
  {name: "Niu Kitchen", address_1: "134 NE 2nd Ave", address_2: "", city: "Miami", state: "FL", zipcode: "33132", description: "", phone: "7865425070", dollars: 2, reservations: true},
  {name: "The Federal", address_1: "5132 Biscayne Blvd", address_2: "", city: "Miami", state: "FL", zipcode: "33137", description: "", phone: "3057589559", dollars: 2, reservations: true}
])
RestaurantCuisine.create!([
  {restaurant_id: 1, cuisine_id: 3},
  {restaurant_id: 1, cuisine_id: 4},
  {restaurant_id: 2, cuisine_id: 7},
  {restaurant_id: 3, cuisine_id: 3},
  {restaurant_id: 3, cuisine_id: 4},
  {restaurant_id: 3, cuisine_id: 9},
  {restaurant_id: 4, cuisine_id: 7},
  {restaurant_id: 5, cuisine_id: 3},
  {restaurant_id: 5, cuisine_id: 4},
  {restaurant_id: 6, cuisine_id: 5},
  {restaurant_id: 7, cuisine_id: 4},
  {restaurant_id: 8, cuisine_id: 1},
  {restaurant_id: 9, cuisine_id: 3},
  {restaurant_id: 10, cuisine_id: 8},
  {restaurant_id: 10, cuisine_id: 13},
  {restaurant_id: 11, cuisine_id: 4}
])
Menu.create!([
   # pubbelly
   {name: "Dinner", display_name: "Dinner", description: ""},
   {name: "Brunch", display_name: "Sunday Brunch Fare", description: ""},
   # yardbird
   {name: "Brunch", display_name: "Brunch", description: ""},
   {name: "Lunch", display_name: "Lunch", description: ""},
   {name: "Dinner", display_name: "Supper", description: ""},
   {name: "Dessert", display_name: "Dessert", description: ""},
   # Tongue and Cheek
   {name: "Brunch", display_name: "Brunch", description: ""},
   {name: "Lunch", display_name: "Lunch", description: ""},
   {name: "Happy Hour", display_name: "Happy Hour", description: ""},
   {name: "Dinner", display_name: "Dinner", description: ""},
   {name: "Kids", display_name: "Kids", description: ""},
   # Black Brick
   {name: "Brunch", display_name: "Dim Sum Sunday", description: ""},
   {name: "Lunch", display_name: "Dim Sum", description: ""},
   # MC Kitchen
   {name: "Brunch", display_name: "Brunch", description: ""},
   {name: "Lunch", display_name: "Lunch", description: ""},
   {name: "Dinner", display_name: "Dinner", description: ""},
   {name: "Dessert", display_name: "Dessert", description: ""},
   # The Dutch
   {name: "Breakfast", display_name: "Breakfast", description: ""},
   {name: "Lunch", display_name: "Lunch", description: ""},
   {name: "Dinner", display_name: "Supper", description: ""},
   {name: "Dessert", display_name: "Dessert", description: ""},
   # The District
   {name: "Lunch", display_name: "Lunch", description: ""},
   {name: "Brunch", display_name: "Brunch", description: ""},
   {name: "Dinner", display_name: "Supper", description: ""},
   {name: "Dinner", display_name: "Sea Food Tower", description: ""},
   {name: "Happy Hour", display_name: "Happy Hour", description: ""},
   # Mignonette
   {name: "Lunch", display_name: "Lunch", description: ""},
   {name: "Dinner", display_name: "Dinner", description: ""},
   {name: "Dessert", display_name: "Dessert", description: ""},
   {name: "Happy Hour", display_name: "Happy Hour", description: ""},
   #Mmmm
   {name: "Default", display_name: "Menu", description: ""},
   # Niu Kitchen
   {name: "Lunch", display_name: "Lunch", description: ""},
   {name: "Dinner", display_name: "Dinner", description: ""},
   # The Federal
   {name: "Brunch", display_name: "Brunch", description: ""},
   {name: "Dinner", display_name: "Supper", description: ""}
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
