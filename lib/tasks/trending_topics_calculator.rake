desc "It calculates and generates trending topics from the last day"

namespace :mememenu do
  namespace :trending_topics do
    task calculate: :environment do
      TrendingTopicFactory.call(Date.tomorrow)
    end
  end
end
