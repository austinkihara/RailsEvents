class Event < ActiveRecord::Base

belongs_to :user
validates :location, :name, presence: true
has_many :joins, dependent: :destroy
has_many :events_joined, through: :joins, source: :user
has_many :comments, dependent: :destroy

end
