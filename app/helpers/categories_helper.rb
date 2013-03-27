module CategoriesHelper

  def get_catalog_categories
    Category.scoped.arrange(:order => :weight)
  end


  def nested_categories(categories = get_catalog_categories)
    categories.map do |category, sub_categories|
      content_tag :div, :class => "category-#{category.id} category_container" do
        render('categories/category', :category => category)  + content_tag(:div, nested_categories(sub_categories), :class => "nested_categories")
      end
    end.join.html_safe
  end
  
end
