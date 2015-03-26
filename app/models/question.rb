# klassen in ruby mit grossbuchstaben 
class Question < ActiveRecord::Base

# relation mehrere answers auf eine question
# bezeichnung eines symboles beginnt mit doppelpunkt
# symbole in ruby mit kleinbuchstaben
  has_many :answers
  accepts_nested_attributes_for :answers
  belongs_to :collection
  
  validates_presence_of :collection, :content
  
  has_one :representment
  
end
