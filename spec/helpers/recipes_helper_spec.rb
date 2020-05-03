# frozen_string_literal: true

RSpec.describe RecipesHelper, vcr: { record: :none } do
  let(:recipe) { double('Recipe', photo: nil) }

  describe '#photo_header_url' do
    subject { helper.photo_header_url(recipe) }

    context 'when there is no photo' do
      it { is_expected.to be_empty }
    end

    context 'when there is a photo' do
      let(:recipe) { Recipe.first }

      it do
        is_expected.to match(%r{//images\.ctfassets\.net.*\?w=400&h=400&r=15})
      end
    end
  end

  describe '#photo_thumbnail_url' do
    subject { helper.photo_thumbnail_url(recipe) }

    context 'when there is no photo' do
      it { is_expected.to be_empty }
    end

    context 'when there is a photo' do
      let(:recipe) { Recipe.first }

      it { is_expected.to match(%r{//images\.ctfassets\.net.*\?w=50&h=80&r=30}) }
    end
  end

  describe '#tag_list' do
    subject { helper.tag_list(recipe) }

    context 'when there are no tags' do
      let(:recipe) { double('Recipe', tags: nil) }

      it { is_expected.to be_nil }
    end
  end

  describe '#info' do
    subject { helper.info(recipe) }

    context 'when there is no chef or calories' do
      let(:recipe) { double('Recipe', chef: nil, calories: nil) }

      it { is_expected.to be_empty }
    end

    context 'when there are calories and chef' do
      let(:recipe) do
        chef = double('Chef', name: 'a pug')
        double('Recipe', calories: 1, chef: chef)
      end

      it { is_expected.to eq('By a pug, 1 kcal') }
    end
  end
end
