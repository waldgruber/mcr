class Representment < ActiveRecord::Base

  belongs_to :question
  belongs_to :collection
  
end
