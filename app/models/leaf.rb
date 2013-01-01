class Leaf < ActiveRecord::Base
  scope :created_today, lambda { where("created_on = ?", Date.today) }
  scope :created_this_week, lambda { where("created_on >= ? && created_on < ?", Date.today.beginning_of_week, Date.today.end_of_week) }

  attr_accessible :content, :photo

  validates_presence_of :content

  belongs_to :user
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  def has_photo
    photo.url != '/photos/original/missing.png'
  end
end
