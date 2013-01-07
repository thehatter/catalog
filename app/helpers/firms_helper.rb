module FirmsHelper

  def nested_firm_path(firm)
    "/" + (firm.category.ancestors + [firm]).map(&:to_param).join("/")
  end
  
end
