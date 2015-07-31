class SpotlightItem < ActiveRecord::Base
  belongs_to :spotlight
  belongs_to :spotable, polymorphic: true
end
