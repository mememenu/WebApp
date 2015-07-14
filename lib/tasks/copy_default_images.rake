desc "Copy dish images from avatar to default image objects"

namespace :mememenu do
  task copy_dish_images: :environment do
    copied_count = 0
    failed_count = 0
    Dish.find_each do |dish|
      begin
        if dish.default_image.nil?
          if dish.avatar.present?
            dish.create_default_image(avatar: dish.avatar)
          else
            dish.create_default_image
          end
          if dish.reload.default_image.present?
            copied_count += 1
          else
            failed_count += 1
            puts "--- Dish #{dish.id} failed"
          end
        end
      rescue StandardError
        failed_count += 1
        puts "--- Dish #{dish.id} failed"
      end
    end

    puts "---- #{copied_count} avatars copied successfully"
    puts "---- #{failed_count} avatars failed to be copied"
  end
end
