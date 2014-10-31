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
  {genre: "Seafood"}
])
Restaurant.create!([
  {name: "The Federal", address_1: "5132 Biscayne Blvd", address_2: "", city: "Miami", state: "FL", zipcode: "33137", description: "", phone: "3057589559", dollars: 2, reservations: true},
  {name: "Oolite", address_1: "1661 Pennsylvania Ave", address_2: "", city: "Miami Beach", state: "FL", zipcode: "33139", description: "", phone: "3059075535", dollars: 3, reservations: true},
  {name: "Pubbelly", address_1: "1418 20th St", address_2: "", city: "Miami Beach", state: "FL", zipcode: "33139", description: "", phone: "3055327555", dollars: 3, reservations: false},
  {name: "Yardbird Southern Table and Bar", address_1: "1600 Lenox Ave", address_2: "", city: "Miami Beach", state: "FL", zipcode: "33139", description: "", phone: "3055385220", dollars: 3, reservations: true},
  {name: "Tongue & Cheek", address_1: "431 Washington Ave", address_2: "", city: "Miami Beach", state: "FL", zipcode: "33139", description: "", phone: "3057042900", dollars: 3, reservations: true},
  {name: "Black Brick", address_1: "3451 NE 1 Ave", address_2: "Ste 103", city: "Miami", state: "FL", zipcode: "33137", description: "", phone: "3055738886", dollars: 2, reservations: false},
  {name: "Sakaya Kitchen", address_1: "3401 N Miami Ave", address_2: "Ste 125", city: "Miami", state: "FL", zipcode: "33137", description: "", phone: "3055768096", dollars: 2, reservations: false},
  {name: "MC Kitchen", address_1: "4141 NE 2nd Ave", address_2: "", city: "Miami", state: "FL", zipcode: "33137", description: "", phone: "3054569948", dollars: 3, reservations: true},
  {name: "The Dutch", address_1: "2201 Collins Ave", address_2: "", city: "Miami Beach", state: "FL", zipcode: "33139", description: "", phone: "3059383111", dollars: 3, reservations: true},
  {name: "The District", address_1: "190 NE 46th St", address_2: "", city: "Miami", state: "FL", zipcode: "33137", description: "", phone: "3055734199", dollars: 3, reservations: true},
  {name: "Bulla", address_1: "2500 Ponce De Leon Blvd", address_2: "", city: "Coral Gables", state: "FL", zipcode: "33134", description: "", phone: "3054410107", dollars: 2, reservations: true},
  {name: "Mignonette", address_1: "210 NE 18th St", address_2: "", city: "Miami", state: "FL", zipcode: "33132", description: "", phone: "3053744635", dollars: 3, reservations: true}
])
RestaurantCuisine.create!([
  {restaurant_id: 1, cuisine_id: 3},
  {restaurant_id: 1, cuisine_id: 4},
  {restaurant_id: 2, cuisine_id: 2},
  {restaurant_id: 3, cuisine_id: 3},
  {restaurant_id: 3, cuisine_id: 4},
  {restaurant_id: 3, cuisine_id: 9},
  {restaurant_id: 4, cuisine_id: 7},
  {restaurant_id: 5, cuisine_id: 3},
  {restaurant_id: 5, cuisine_id: 4},
  {restaurant_id: 6, cuisine_id: 5},
  {restaurant_id: 7, cuisine_id: 6},
  {restaurant_id: 8, cuisine_id: 1},
  {restaurant_id: 9, cuisine_id: 3},
  {restaurant_id: 10, cuisine_id: 3},
  {restaurant_id: 11, cuisine_id: 8},
  {restaurant_id: 11, cuisine_id: 9},
  {restaurant_id: 12, cuisine_id: 10}
])
