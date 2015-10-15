module HomePagesHelper
  def options_for_featured_select(home_page)
    options_from_collection_for_select(
      List.featured_lists, :id, :name, home_page.featured_list.try(:id)
    )
  end
end
