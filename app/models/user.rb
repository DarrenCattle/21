class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :challenges, dependent: :destroy

  def current_challenge
  	if challenges.count == 0 or challenges.last.day >= 21
  		nil
  	else
  		challenges.last
  	end
  end
end
