# frozen_string_literal: true

RSpec.describe 'recipes/show', type: :view, vcr: { record: :none } do
  # Ugly but practical to use a constant to find a specific kind of recipe
  let(:recipe) { Recipe.find('437eO3ORCME46i02SeCW46') }

  before { assign(:recipe, recipe) }

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(CGI.escapeHTML(recipe.title))
    expect(rendered).to match(recipe.calories.to_s)
    expect(rendered).to match(view.parse_markdown(recipe.description))
    expect(rendered).to match(recipe.tags.first.name)
    expect(rendered).to match(recipe.chef.name)
  end
end
