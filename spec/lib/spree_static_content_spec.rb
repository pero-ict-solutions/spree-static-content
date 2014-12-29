RSpec.describe StaticPage do
  context '.remove_spree_mount_point' do
    specify do
      path = '/hello'
      expect(subject.remove_spree_mount_point(path)).to eq 'hello'
    end
  end
end

RSpec.describe Spree::StaticPage do
  context '.matches?' do
    it 'is true when valid page' do
      page = create(:page, slug: 'hello', visible: true)
      request = double('request', path: page.slug)
      expect(described_class.matches?(request)).to be true
    end

    it 'is false when using reserved slug name' do
      page = create(:page, slug: 'login', visible: true)
      request = double('request', path: page.slug)
      expect(described_class.matches?(request)).to be false
    end

    it 'is false when page is not accessible' do
      page = create(:page, slug: 'hello', visible: false)
      request = double('request', path: page.slug)
      expect(described_class.matches?(request)).to be false
    end
  end
end
