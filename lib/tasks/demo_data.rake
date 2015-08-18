namespace :mememenu do
  desc "generates some demo data for the new API"

  task demo_data_reset: :environment do
    DemoData.call
  end
end
