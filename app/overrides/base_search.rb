Spree::Core::Search::Base.class_eval do

  alias_method :original_get_base_scope, :get_base_scope unless method_defined? :original_get_base_scope

  def get_base_scope
    if Spree::Config.show_zero_stock_products
      original_get_base_scope
    else
      original_get_base_scope.on_hand
    end
  end

end
