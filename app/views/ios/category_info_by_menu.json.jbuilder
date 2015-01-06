json.array!(@active_menus) do |menu|

  json.name menu.name 
  ordered_categories = menu.categories.order(priority: :asc)
  json.categories ordered_categories.each do |category| 

    if category.hide == false || category.hide == nil
      json.(category, :name, :priority)
    else
      
    end

  end

end