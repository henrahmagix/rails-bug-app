require 'rails_helper'

describe HomeController, type: :controller do
  describe '#show' do
    subject { response }

    before { get :show, params: params, session: nil }

    let(:params) { {} }

    it { is_expected.not_to be_redirect }
    it { is_expected.to     have_attributes(body: 'Home controller, show method') }
  end
end
