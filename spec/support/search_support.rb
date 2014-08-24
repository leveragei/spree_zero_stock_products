def find_products
  params   = { :per_page => "" }
  searcher = Spree::Core::Search::Base.new(params)
  searcher.retrieve_products
end