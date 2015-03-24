require 'couchrest_model'

class Cat < CouchRest::Model::Base

  property :name,      String
  property :lives,     Integer, :default => 9

  property :nicknames, [String]

  timestamps!

  design do
    view :by_name
  end

end

@cat = Cat.new(:name => 'Felix', :nicknames => ['so cute', 'sweet kitty'])

@cat.new?   # true
@cat.save

@cat['name']   # "Felix"

@cat.nicknames << 'getoffdamntable'

@cat = Cat.new
@cat.update_attributes(:name => 'Felix', :random_text => 'feline')
@cat.new? # false
@cat.random_text  # Raises error!
