class Article < ActiveRecord::Base

  searchable do
    text :title, :abstract
    text :content, stored: true
  end

end
