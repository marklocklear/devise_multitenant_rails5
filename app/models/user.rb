class User < ApplicationRecord
	belongs_to :organization
	has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :organization
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.get_users(current_org)
    current_org.users
  end
end
