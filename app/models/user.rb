class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :challenges

  def current_challenge
  	if challenges.last != 21
  		challenges.last
  	else
  		nil
  	end
  end
end
