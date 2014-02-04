require 'spec_helper'

describe Spree::StaticContentController do
  before { controller.stub spree_current_user: nil }

  context '#show' do
    it 'accepts path as root' do
      page = create(:page, slug: '/')
      controller.request.stub(:path).and_return(page.slug)
      spree_get :show, path: page.slug
      expect(response).to be_success
    end

    it 'accepts path as string' do
      page = create(:page, slug: 'hello')
      controller.request.stub(:path).and_return(page.slug)
      spree_get :show, path: page.slug
      expect(response).to be_success
    end

    it 'accepts path as nested' do
      page = create(:page, slug: 'aa/bb/cc')
      controller.request.stub(:path).and_return(page.slug)
      spree_get :show, path: page.slug
      expect(response).to be_success
    end

    it 'respond with a 404 when no page exists' do
      spree_get :show
      expect(response.response_code).to eq(404)
    end
  end
end