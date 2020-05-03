# frozen_string_literal: true

RSpec.describe 'recipes/index', type: :view, vcr: { record: :all } do
  let(:recipes) { Recipe.all }

  before { assign(:recipes, recipes) }

  it 'renders a list of recipes' do
    render
    recipes.each_entry { |r| assert_select('tr>td', text: r.title) }
    assert_select('tr>td', href: %r{//images\.ctfassets\.net.*})
    assert_select('h1', text: "Today's menu")
  end
end
