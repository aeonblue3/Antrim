class Post < ActiveRecord::Base
  validates_presence_of :title, :content
  
  attr_accessible :name, :title, :content, :publish
  scope :recent, order('created_at desc')
end
