class Entry < ApplicationRecord
  belongs_to :author, :class_name => "User"

  validates :title, :body, :author_id, presence: true

  def self.most_recent
    Entry.order(created_at: :desc).limit(5)
  end
end
