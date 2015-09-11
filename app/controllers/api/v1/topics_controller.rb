class Api::V1::TopicsController < Api::V1::BaseController
  def trending
    render json: Topic.for_date(Time.current).limit(TrendingTopicFactory::TRENDING_SET_SIZE)
  end
end
