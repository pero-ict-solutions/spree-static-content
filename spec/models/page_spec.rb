RSpec.describe Spree::Page, type: :model do
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
    it 'returns slug if foreign_link blank' do
      page = create(:page, slug: 'hello')
      expect(page.link).to eq page.slug
    end

    it 'returns foreign_link if set' do
      page = create(:page, :with_foreign_link, slug: 'hello')
      expect(page.link).to eq page.foreign_link
    end
  end

  context 'pages in stores' do
    before do
      @store = create(:store)
      @page = create(:page, stores: [@store])
      @page2 = create(:page)
    end

    it 'correctly finds pages by store' do
      pages_by_store = described_class.by_store(@store)
      expect(pages_by_store).to include(@page)
      expect(pages_by_store).to_not include(@page2)
    end
  end
end
