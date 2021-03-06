class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :likes

  has_attached_file :image,
                    styles: { large: "600x600>", medium: "400x400>" },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\Z}

  def created_by?(user)
    user == self.user
  end
end
