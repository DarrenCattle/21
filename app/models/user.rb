class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :challenges, dependent: :destroy

  def current_challenge
  	if challenges.last.day < 21
  		challenges.last
  	else
  		nil
  	end
  end
end
