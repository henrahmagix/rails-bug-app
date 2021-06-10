require 'rails_helper'

describe HomeController, type: :controller do
  describe '#show' do
    subject { response }

    before { get :show, params: params, session: nil }

    let(:params) { {} }

    it { is_expected.not_to be_redirect }
    it { is_expected.to     have_attributes(body: 'Home controller, show method') }

    context 'with redirect_me=yes' do
      let(:params) { { redirect_me: 'yes' } }

      it { is_expected.to redirect_to('http://test.host/home?redirected_from_concern=true') }
    end
  end
end
