module CategoriesHelper

  def nested_categories(categories)
    categories.map do |category, sub_categories|
      content_tag :div, :class => "category-#{category.id} category_container" do
        render(category) + content_tag(:div, nested_categories(sub_categories), :class => "nested_categories")
      end
    end.join.html_safe
  end
  
end
