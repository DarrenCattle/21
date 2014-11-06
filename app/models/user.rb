class User < ActiveRecord::Base
  include Gravtastic
  gravtastic default: "http://i1287.photobucket.com/albums/a627/alejoriveralara/balloon_purple_zps26f69545.png",
             size: 75


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :challenges, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes

  scope :reminder_email_ready, -> { where(unsuscribe_from_reminder_email: false) }


  def current_challenge
    if challenges.count == 0 or challenges.last.day >= 21
      nil
    else
      challenges.last
    end
  end

  def like!(activity)
    Like.create!(user_id: self.id, activity_id: activity.id)
  end

  def unlike!(activity)
    Like.find_by(user_id: self.id, activity_id: activity.id).destroy!
  end

  def likes?(activity)
    Like.exists?(user_id: self.id, activity_id: activity.id)
  end

end
