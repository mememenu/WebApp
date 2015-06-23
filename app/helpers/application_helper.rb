module ApplicationHelper
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
      content_tag(
        :div,
        render('dishes/' + association.to_s.singularize + "_fields", f: builder),
        class: ['avatar', 'col-md-4', 'well', 'text-center']
      )
    end
    link_to(name, '#', class: "add_fields btn btn-default btn-xs", data: {id: id, fields: fields.gsub("\n", "")})
  end

end
