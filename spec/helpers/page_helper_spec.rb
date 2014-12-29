RSpec.describe Spree::PagesHelper, type: :helper do
  context '.render_snippet' do
    it 'returns body when page exists' do
      page = create(:page)
      expect(render_snippet(page.slug)).to eq page.body
    end

    it 'returns nil when no page exist' do
      expect(render_snippet('hello')).to be_nil
    end
  end
end
