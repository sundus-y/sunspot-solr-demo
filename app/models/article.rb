class Article < ActiveRecord::Base

  searchable do
    text :title, :abstract, :content
  end

end
