class User < ActiveRecord::Base
  include FriendlyId
  friendly_id :username
  include Gravtastic
  gravtastic default: "http://i1287.photobucket.com/albums/a627/alejoriveralara/balloon_purple_zps26f69545.png",
             size: 125

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
  :default_url => "http://i1287.photobucket.com/albums/a627/alejoriveralara/balloon_purple_zps26f69545.png",
  :url  => ":s3_domain_url",
  :path => "public/avatars/:id/:style_:basename.:extension",
  :storage => :fog,
  :fog_credentials => {
      provider: 'AWS',
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
  },
  fog_directory: ENV["FOG_DIRECTORY"]
  

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :challenges, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes

  scope :reminder_email_ready_america, -> { where(unsuscribe_from_reminder_email: false, europe: false) }
  scope :reminder_email_ready_europe, -> { where(unsuscribe_from_reminder_email: false, europe: true) }
  scope :europe_users, -> { where(europe: true) }
  scope :america_users, -> { where(europe: false) }

  validates :username, uniqueness: true,
                       format: { with: /\A[a-z0-9]+\Z/, message: "only allows lowercase letters and numbers" }


  def current_challenge
    if challenges.count == 0 or challenges.last.day >= 21
      nil
    else
      challenges.last
    end
  end

  def like!(activity)
    Like.find_or_create_by!(user_id: self.id, activity_id: activity.id)
  end

  def unlike!(activity)
    Like.find_by(user_id: self.id, activity_id: activity.id).destroy!
  end

  def likes?(activity)
    Like.exists?(user_id: self.id, activity_id: activity.id)
  end

end
