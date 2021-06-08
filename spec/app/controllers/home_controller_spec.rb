require 'rails_helper'

describe HomeController, type: :controller do
  describe '#show' do
    subject { response }

    # controller {} # uncomment this to make all tests below fail at `get :show` with `ActionController::UrlGenerationError`

    before { get :show, params: params, session: nil }

    controller {} # but here is fine, after `before`

    let(:params) { {} }

    it { is_expected.not_to be_redirect }
    it { is_expected.to     have_attributes(body: 'Home controller, show method') }

    context 'with redirect_me=yes' do
      let(:params) { { redirect_me: 'yes' } }

      it { is_expected.to redirect_to('http://test.host/home?redirected_from_concern=true') }
    end
  end
end
