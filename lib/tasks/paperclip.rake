namespace :mememenu do
  namespace :paperclip do
    desc "Recreate paperclip specific style for dishes and images"

    task :refresh_style, [:style] => :environment do |task, args|
      style = args[:style]
      raise "Must provide a style!!!" unless style.present?

      puts "----- Reprocessing #{style} style for Dish model... -----"
      successful_dish_count = 0
      failed_dish_count = 0

      Dish.find_each do |dish|
        if dish.avatar.reprocess! style.to_sym
          successful_dish_count += 1
        else
          failed_dish_count += 1
        end
      end

      puts "----- #{successful_dish_count} successful dishes reprocessed. -----"
      puts "----- #{failed_dish_count} failed attempts to reprocess dishes. -----"

      puts "----- Reprocessing #{style} style for Image model... -----"
      successful_image_count = 0
      failed_image_count = 0

      Image.find_each do |image|
        if dish.avatar.reprocess! style.to_sym
          successful_image_count += 1
        else
          failed_image_count += 1
        end
      end

      puts "----- #{successful_image_count} successful images reprocessed. -----"
      puts "----- #{failed_image_count} failed attempts to reprocess images. -----"
    end
  end
end

