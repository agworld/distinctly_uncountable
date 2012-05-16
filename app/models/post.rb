class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title, :number
end
