class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :text, presence: true
    validates :status, presence: true
end
