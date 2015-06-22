namespace :mememenu do
  namespace :paperclip do
    desc "Recreate paperclip specific style for dishes and images"

    task :refresh_style, [:model, :style] => :environment do |task, args|
      raise "Must provide a valid model name!!!" unless args[:model].present?
      model = args[:model].constantize
      style = args[:style]
      raise "Must provide a style!!!" unless style.present?

      puts "----- Reprocessing #{style} style for #{model} model... -----"
      successful_count = 0
      failed_count = 0

      model.find_each do |instance|
        if instance.avatar.reprocess! style.to_sym
          successful_count += 1
        else
          failed_count += 1
        end
      end

      puts "----- #{successful_count} successful instances of #{model} reprocessed. -----"
      puts "----- #{failed_count} failed attempts to reprocess instances of #{model}. -----"
    end
  end
end

