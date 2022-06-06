class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true

  has_many :midis, dependent: :destroy
  has_many :upvotes

  has_one_attached :photo

  has_one :profile, dependent: :destroy

  after_create :create_profile

  private

  def create_profile
    # Profile.create(user: self)
    # self.create_profile!
    create_profile!
  end
end
