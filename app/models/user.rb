class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
  :recoverable, :rememberable, :trackable, :validatable

  GENDERS = %w(Male Female)

  has_many :places, foreign_key: :owner_id
  has_many :other_lists, -> { where(default: nil, kind: "UserList") },
                        dependent: :destroy, class_name: "List",
                        foreign_key: :user_id, inverse_of: :user
  has_one :default_list, -> { where(default: true, kind: "UserList") },
                        dependent: :destroy, class_name: "List",
                        inverse_of: :user
  validates :gender, inclusion: { in: GENDERS }, allow_nil: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  before_create :set_default_list

  # sets user attributes to attributes provided through omniauth
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
    end
  end

  def owns_place?(place)
    places.exists?(place.id)
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    if uid.nil?
      super && true
    else
      false
    end
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  private

  def set_default_list
    build_default_list(name: "My List")
  end

end
