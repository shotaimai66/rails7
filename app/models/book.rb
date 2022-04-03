require 'elasticsearch/model'

class Book < ApplicationRecord
  include Books::Elasticsearchable
end
