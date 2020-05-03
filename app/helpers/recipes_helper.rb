# frozen_string_literal: true

module RecipesHelper
  def photo_header_url(recipe)
    return '' unless recipe.photo

    recipe.photo.resize(400, 400).rounded_corners(15).load
  end

  def photo_thumbnail_url(recipe)
    return '' unless recipe.photo

    recipe.photo.resize(50, 80).rounded_corners(30).load
  end

  def tag_list(recipe)
    return unless recipe.tags

    tag_links = recipe.tags.each_entry.map { |tag| link_to(tag.name, '') }
    tag_links.join(', ').html_safe
  end

  def info(recipe)
    name = recipe.chef&.name&.strip
    chef = name ? "By #{name}" : nil
    calories = recipe.calories ? "#{recipe.calories} kcal" : nil
    [chef, calories].compact.join(', ')
  end
end
