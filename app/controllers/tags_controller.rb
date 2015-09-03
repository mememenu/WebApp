class TagsController < ApplicationController
  def add_to_place
    place = Place.find(params[:place_id])
    tag = Tag.find(params[:id])

    if place.tags << tag
      head :ok
    else
      head :not_found
    end
  end

  def remove_from_place
    place = Place.find(params[:place_id])
    tag = Tag.find(params[:id])

    if place.tags.delete(tag)
      head :ok
    else
      head :not_found
    end
  end

  def create
    if params[:name].present?
      tag = if params[:place_id] && place = Place.find_by_id(params[:place_id])
              place.tags.create(name: params[:name])
            else
              Tag.create(name: params[:name])
            end

      if tag.valid?
        render json: tag, status: :ok
      else
        render json: { errors: tag.errors }, status: :ok
      end
    else
      head :bad_request
    end
  end
end
