User.create!([
  {email: "andyweiss1982@gmail.com", encrypted_password: "", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2014-11-20 21:39:58", last_sign_in_at: "2014-11-20 20:41:12", current_sign_in_ip: #<IPAddr: IPv4:127.0.0.1/255.255.255.255>, last_sign_in_ip: #<IPAddr: IPv4:127.0.0.1/255.255.255.255>, admin: true, restaurant: nil, provider: "facebook", uid: "1408355", restaurant_id: nil}
])

Restaurant.create!([
  {name: "The Dutch", address_1: "2201 Collins Ave", address_2: "", city: "Miami Beach", state: "FL", zipcode: "33139", description: nil, phone: "3059383111", dollars: nil, reservations: false, hide: false, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil}
])

Menu.create!([
  {name: "Lunch", description: nil, hide: false, restaurant_id: 1},
  {name: "Supper", description: nil, hide: false, restaurant_id: 1},
  {name: "Desserts", description: nil, hide: false, restaurant_id: 1}
])

Category.create!([
  {name: "Snacks", menu_id: 1, hide: false, restaurant_id: 1},
  {name: "Appetizers", menu_id: 1, hide: false, restaurant_id: 1},
  {name: "Second", menu_id: 1, hide: false, restaurant_id: 1},
  {name: "Snacks", menu_id: 2, hide: false, restaurant_id: 1},
  {name: "Appetizers", menu_id: 2, hide: false, restaurant_id: 1},
  {name: "Second", menu_id: 2, hide: false, restaurant_id: 1},
  {name: "Dessert at the Dutch", menu_id: 3, hide: false, restaurant_id: 1}
])

Dish.create!([
  {name: "Sheep's Milk Ricotta, Grilled Bread, Herbs", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 5, avatar_file_name: "lun_sna_02.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 221234, avatar_updated_at: "2014-11-20 21:28:05", menu_id: 1, restaurant_id: 1},
  {name: "Local Field Greens, Shaved Garden Vegetables", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 6, avatar_file_name: "lun_app_01.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 203298, avatar_updated_at: "2014-11-20 21:48:03", menu_id: 1, restaurant_id: 1},
  {name: "Kale Caesar, Crunchy Crouton, Parmesan, Walnuts", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 6, avatar_file_name: "lun_app_02.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 160452, avatar_updated_at: "2014-11-20 21:48:43", menu_id: 1, restaurant_id: 1},
  {name: "Lobster Salad, Vadouvan Curry, Mango, Cashews, Coconut", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 6, avatar_file_name: "lun_app_03.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 149839, avatar_updated_at: "2014-11-20 21:49:51", menu_id: 1, restaurant_id: 1},
  {name: "Traditional Peruvian Corvina Ceviche, Rocoto Chile, Celery", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 6, avatar_file_name: "lun_app_05.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 203755, avatar_updated_at: "2014-11-20 21:51:00", menu_id: 1, restaurant_id: 1},
  {name: "Yellowtail Crudo, Spicy Watermelon, Jalapeno", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 6, avatar_file_name: "lun_app_04.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 145993, avatar_updated_at: "2014-11-20 21:52:08", menu_id: 1, restaurant_id: 1},
  {name: "Margherita Pizzette, San Marzano Tomatoes, Mozzarella", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 5, avatar_file_name: "lun_sna_01.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 188432, avatar_updated_at: "2014-11-20 21:30:32", menu_id: 1, restaurant_id: 1},
  {name: "Grilled Mahi, Braised Mustard Greens, Butternut Squash", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 7, avatar_file_name: "lun_sec_01.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 131853, avatar_updated_at: "2014-11-20 21:55:20", menu_id: 1, restaurant_id: 1},
  {name: "Korean Fried Chicken Sandwich", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 7, avatar_file_name: "lun_sec_02.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 128654, avatar_updated_at: "2014-11-20 21:55:55", menu_id: 1, restaurant_id: 1},
  {name: "Slow-roasted turkey sandwich, avocado, herb mayo", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 7, avatar_file_name: "lun_sec_03.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 150283, avatar_updated_at: "2014-11-20 21:56:35", menu_id: 1, restaurant_id: 1},
  {name: "Roasted Chicken, Wild Rice, Quinoa, Dill Yogurt, Arugula", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 7, avatar_file_name: "lun_sec_04.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 157779, avatar_updated_at: "2014-11-20 21:58:05", menu_id: 1, restaurant_id: 1},
  {name: "Prime Burger, Cheddar, Sesame Bun, Secret Sauce", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 7, avatar_file_name: "lun_sec_06.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 145093, avatar_updated_at: "2014-11-20 22:00:31", menu_id: 1, restaurant_id: 1},
  {name: "Sheep's Milk Ricotta, Grilled Bread, Herbs", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 8, avatar_file_name: "lun_sna_02.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 221234, avatar_updated_at: "2014-11-20 22:02:21", menu_id: 2, restaurant_id: 1},
  {name: "Little Oyster Sandwiches", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 8, avatar_file_name: "sup_sna_02.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 134918, avatar_updated_at: "2014-11-20 22:03:37", menu_id: 2, restaurant_id: 1},
  {name: "Meatballs, Red Sauce, Pecorino, Sicilian Oregano", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 8, avatar_file_name: "sup_sna_01.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 109832, avatar_updated_at: "2014-11-20 22:04:22", menu_id: 2, restaurant_id: 1},
  {name: "Butter Lettuce, Citrus, Avocado, Buttermilk, Pistachio", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 9, avatar_file_name: "sup_app_01.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 191892, avatar_updated_at: "2014-11-20 22:06:50", menu_id: 2, restaurant_id: 1},
  {name: "Local Field Greens, Shaved Garden Vegetables", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 9, avatar_file_name: "sup_app_04.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 203298, avatar_updated_at: "2014-11-20 22:09:47", menu_id: 2, restaurant_id: 1},
  {name: "Roasted Beets. Horseradish, Rye, Smoked Maple Syrup", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 9, avatar_file_name: "sup_app_08.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 122238, avatar_updated_at: "2014-11-20 22:11:33", menu_id: 2, restaurant_id: 1},
  {name: "Calamari, Pickled Peppers, Garlic Butter, lemon", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 9, avatar_file_name: "sup_app_02.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 118889, avatar_updated_at: "2014-11-20 22:12:26", menu_id: 2, restaurant_id: 1},
  {name: "Yellowtail Crudo, Spicy Watermelon, Jalapeno", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 9, avatar_file_name: "sup_app_06.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 145993, avatar_updated_at: "2014-11-20 22:13:14", menu_id: 2, restaurant_id: 1},
  {name: "Lobster Salad, Vadouvan Curry, Mango, Cashews, Coconut", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 9, avatar_file_name: "sup_app_05.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 149839, avatar_updated_at: "2014-11-20 22:13:41", menu_id: 2, restaurant_id: 1},
  {name: "Classic Corvina Ceviche, Rocoto Chiles, sweet potato", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 9, avatar_file_name: "sup_app_03.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 203755, avatar_updated_at: "2014-11-20 22:15:22", menu_id: 2, restaurant_id: 1},
  {name: "steak tartare, quail egg, truffle vinaigrette", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 9, avatar_file_name: "sup_app_07.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 182864, avatar_updated_at: "2014-11-20 22:16:36", menu_id: 2, restaurant_id: 1},
  {name: "Orrechiette, Lamb bolognese, sheep's milk ricotta, mint", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 7, avatar_file_name: "lun_sec_05.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 163585, avatar_updated_at: "2014-11-20 21:59:26", menu_id: 1, restaurant_id: 1},
  {name: "Butternut squash lasagna, sage brown butter, walnuts", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 10, avatar_file_name: "sup_sec_02.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 151768, avatar_updated_at: "2014-11-20 22:18:46", menu_id: 2, restaurant_id: 1},
  {name: "red snapper, caramelized fennel, navel orange, olive", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 10, avatar_file_name: "sup_sec_04.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 157266, avatar_updated_at: "2014-11-20 22:20:08", menu_id: 2, restaurant_id: 1},
  {name: "sea scallops, \"carrots and peas\", ginger, black quinoa", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 10, avatar_file_name: "sup_sec_06.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 127736, avatar_updated_at: "2014-11-20 22:21:37", menu_id: 2, restaurant_id: 1},
  {name: "braised lamb, roasted root vegetables, potato puree", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 10, avatar_file_name: "sup_sec_01.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 169338, avatar_updated_at: "2014-11-20 22:22:36", menu_id: 2, restaurant_id: 1},
  {name: "roast marinated chicken, wild rice, dill yogurt, greens", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 10, avatar_file_name: "sup_sec_05.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 157779, avatar_updated_at: "2014-11-20 22:23:33", menu_id: 2, restaurant_id: 1},
  {name: "smoked pork chops, sauerkraut, roast apples, mustard jus", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 10, avatar_file_name: "sup_sec_03.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 163752, avatar_updated_at: "2014-11-20 22:24:17", menu_id: 2, restaurant_id: 1},
  {name: "smoked pork chops, sauerkraut, roast apples, mustard jus", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 10, avatar_file_name: "sup_sec_03.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 163752, avatar_updated_at: "2014-11-20 22:24:18", menu_id: 2, restaurant_id: 1},
  {name: "chocolate souffle ", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 11, avatar_file_name: "des_01.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 121495, avatar_updated_at: "2014-11-20 22:26:56", menu_id: 3, restaurant_id: 1},
  {name: "Toasted Almond panna cotta", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 11, avatar_file_name: "des_02.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 109638, avatar_updated_at: "2014-11-20 22:28:00", menu_id: 3, restaurant_id: 1},
  {name: "New Orleans beignets", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 11, avatar_file_name: "des_03.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 133043, avatar_updated_at: "2014-11-20 22:28:56", menu_id: 3, restaurant_id: 1},
  {name: "coconut ice cream cake", description: nil, portion_size: nil, spice: nil, hot: nil, gluten_free: nil, vegetarian: nil, hide: false, category_id: 11, avatar_file_name: "des_04.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 97970, avatar_updated_at: "2014-11-20 22:29:40", menu_id: 3, restaurant_id: 1}
])

Ingredient.create!([
  {name: "Mint Chocolate Chip Ice Cream", restaurant_id: 1, description: "", dish_id: 32},
  {name: "strawberry compote", restaurant_id: 1, description: "", dish_id: 33},
  {name: "yuzu sorbet", restaurant_id: 1, description: "", dish_id: 33},
  {name: "dulce de leche cream", restaurant_id: 1, description: "", dish_id: 34},
  {name: "black & blue jam", restaurant_id: 1, description: "", dish_id: 34},
  {name: "spiced pineapple", restaurant_id: 1, description: "", dish_id: 35},
  {name: "banana anglaise", restaurant_id: 1, description: "", dish_id: 35}
])


