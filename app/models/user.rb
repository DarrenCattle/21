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
  :storage => :s3,
  :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  
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

  def profile_pic
    if self.avatar == nil
      gravatar_url
    else
      avatar.url
    end
  end

  def s3_credentials
    {:bucket => ENV['BUCKET'], :access_key_id => ENV['S3_ACCESS'], :secret_access_key => ENV['S3_SECRET']}
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
