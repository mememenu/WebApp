class Image < ActiveRecord::Base
  belongs_to :dish, dependent: :destroy
end
