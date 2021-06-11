require 'rails_helper'

n = 0

describe RedirectIfRequestedConcern, type: :controller do
  controller(ActionController::Base) do
    include RedirectIfRequestedConcern

    def test
      path_routes = _routes.named_routes.helper_names.map(&:to_s).sort.select { |r| r.end_with?('_path') && r.exclude?('rails_') }
      puts "In test controller method: #{path_routes.count}"
      puts path_routes.map { |r| "\t#{r}" }

      render plain: 'Test controller, test method'
    end
  end

  subject { response }

  before do
    n+=1
    puts "N=#{n}"
    routes.draw do
      get 'test' => 'anonymous#test'
      get "n_#{n}" => 'anonymous#test'
    end

    path_routes = routes.named_routes.helper_names.map(&:to_s).sort.select { |r| r.end_with?('_path') && r.exclude?('rails_') }
    puts "In test before hook: #{path_routes.count}"
    puts path_routes.map { |r| "\t#{r}" }

    get :test, params: params, session: nil
  end

  let(:params) { {} }

  it { is_expected.not_to be_redirect }
  it { is_expected.to     have_attributes(body: 'Test controller, test method') }

  context 'with redirect_me=yes' do
    let(:params) { { redirect_me: 'yes' } }

    it { is_expected.to redirect_to('http://test.host/test?redirected_from_concern=true') }
  end
end
