class Activity < PublicActivity::Activity
	acts_as_commentable
	has_many :likes, dependent: :destroy
end