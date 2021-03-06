class Task < ActiveRecord::Base

  belongs_to :list
  validates :description, presence: true

  scope :today, -> { where("created_at >=?", Time.now.beginning_of_day) }

  scope :ten_recent, -> { order(created_at: :desc).limit(10) }

  scope :search, -> (keyword) { where("name like ?", "%#{keyword}%")}

end
