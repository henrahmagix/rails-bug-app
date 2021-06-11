module RedirectIfRequestedConcern
  extend ActiveSupport::Concern

  included do
    before_action :redirect_if_requested
  end

  private

    def redirect_if_requested
      path_routes = _routes.named_routes.helper_names.map(&:to_s).sort.select { |r| r.end_with?('_path') && r.exclude?('rails_') }
      puts "In concern method: #{path_routes.count}"
      puts path_routes.map { |r| "\t#{r}" }

      redirect_to url_for(redirected_from_concern: true) if params[:redirect_me] == 'yes'
    end
end
