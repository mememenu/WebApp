module RestaurantsHelper

  def us_states
    [
      ['Alabama', 'AL'],
      ['Alaska', 'AK'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'],
      ['California', 'CA'],
      ['Colorado', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Puerto Rico', 'PR'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['Washington', 'WA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY']
    ]
  end

  def restaurant_dollars
    if @restaurant.dollars 
      @restaurant.dollars
    else
      1
    end
  end

  def restaurant_state 
    if @restaurant.state 
      @restaurant.state
    else
      1
    end
  end

  def restaurant_id_array
    [@restaurant.id]
  end

  def dollars
    case @restaurant.dollars
    when 1
    '$' 
    when 2
    '$$'
    when 3
    '$$$'
    when 4
    '$$$$'
    end    
  end

  def comma_separated_cuisines
    @restaurant.cuisines.map{|cuisine| cuisine.genre}.join(', ') 
  end

  def restaurant_category_names
    menus = []

    @restaurant.menus.each do |menu|
      menus<<menu
    end

    categories = []

    menus.each do |menu|
      menu.categories.each do |category|
        categories<<category.clean_name
      end
    end

    categories
  end

  def restaurant_category_and_category_menu_names

    menus = []

    @restaurant.menus.each do |menu|
      menus<<menu
    end

    categories = []
    
    menus.each do |menu|
      menu.categories.each do |category|
        categories<<category
      end
    end

    category_and_menu_names = []

    categories.each do |category|

      category_and_menu_names<<('a#'+category.clean_name+category.menu.clean_name)

    end

    category_and_menu_names.join(', ')

  end

  def class_of_restaurant_category_and_category_menu_names

    menus = []

    @restaurant.menus.each do |menu|
      menus<<menu
    end

    categories = []
    
    menus.each do |menu|
      menu.categories.each do |category|
        categories<<category
      end
    end

    category_and_menu_names = []

    categories.each do |category|

      category_and_menu_names<<('.'+category.clean_name+category.menu.clean_name)

    end

    category_and_menu_names.join(', ')

  end


  def restaurant_menu_options
    
    menu_options = []

    if @restaurant  
      @restaurant.menus.each do |menu|
        menu_options<<[menu.name, menu.id]
      end
    elsif @category
      @category.restaurant.menus.each do |menu|
        menu_options<<[menu.name, menu.id]
      end
    else 
      @dish.resaurant.menus.each do |menu|
        menu_options<<[menu.name, menu.id]
      end
    end

    menu_options

  end

  # def default_menu_option

  #   if @category
  #     if @category.menu
  #       @category.menu.id
  #     elsif @dish.category
  #       @dish.category.menu.id
  #     else
  #       1    
  #     end
  #   else
  #     1
  #   end
  # end

def restaurant_menu_names
    menus = []

    @restaurant.menus.each do |menu|
      menus<<menu.clean_name.prepend('.')
    end

    menus.join(", ")
  end


  def default_menu_from_category_edit
    if @category.menu
      @category.menu.id
    else
      1
    end
  end

  def default_menu_from_dish_edit
    if @dish.category
      @dish.category.menu.id
    else
      1
    end
  end

end
