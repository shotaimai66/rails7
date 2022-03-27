require 'elasticsearch/model'

class Book < ApplicationRecord
  include Books::Searchable
end
