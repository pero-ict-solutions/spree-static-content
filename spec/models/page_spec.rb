require 'spec_helper'

describe Spree::Page do
  let!(:page) { create(:page) }

  context 'factory' do
    it 'is valid' do
      expect(page).to be_valid
    end
  end

  it 'always add / prefix to slug' do
    page = create(:page, slug: 'hello')
    expect(page.slug).to eq '/hello'
  end

  context '.link' do
    it 'return slug if foreign_link blank' do
      page = create(:page, slug: 'hello')
      expect(page.link).to eq page.slug
    end

    it 'return foreign_link if set' do
      page = create(:page, :with_foreign_link, slug: 'hello')
      expect(page.link).to eq page.foreign_link
    end
  end
end