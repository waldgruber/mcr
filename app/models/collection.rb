class Collection < ActiveRecord::Base

  has_many :questions
  has_many :representments
  
  validates_presence_of :name
  validates_presence_of :rep

end
