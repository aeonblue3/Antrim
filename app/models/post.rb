class Post < ActiveRecord::Base
  validates_presence_of :title, :content
  
  attr_accessible :name, :title, :content, :publish, :id, :created_at, :updated_at
  scope :recent, order('created_at desc')
end
