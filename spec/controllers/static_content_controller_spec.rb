RSpec.describe Spree::StaticContentController, type: :controller do
  before do
    allow(controller).to receive(:spree_current_user).and_return(nil)
  end

  let!(:store) { create(:store, default: true) }

  context '#show' do
    it 'accepts path as root' do
      page = create(:page, slug: '/', stores: [store])
      allow(controller.request).to receive(:path).and_return(page.slug)
      spree_get :show, path: page.slug
      expect(response).to be_success
    end

    it 'accepts path as string' do
      page = create(:page, slug: 'hello', stores: [store])
      allow(controller.request).to receive(:path).and_return(page.slug)
      spree_get :show, path: page.slug
      expect(response).to be_success
    end

    it 'accepts path as nested' do
      page = create(:page, slug: 'aa/bb/cc', stores: [store])
      allow(controller.request).to receive(:path).and_return(page.slug)
      spree_get :show, path: page.slug
      expect(response).to be_success
    end

    it 'respond with a 404 when no page exists' do
      spree_get :show
      expect(response.response_code).to be(404)
    end
  end
end
