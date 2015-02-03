module ApplicationHelper
  def cuisine_finder
    finder = []

    Cuisine.all.each do |cuisine|
      unless cuisine.restaurants.empty?
        finder<<cuisine
      end
    end
    
    finder
  end

  def miami_restaurant_dropdown_options
    Restaurant.where(hide: [nil, false], region: "MIA")
  end

  def nola_restaurant_dropdown_options
    Restaurant.where(hide: [nil, false], region: "NOLA")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render('dishes/' + association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

end
