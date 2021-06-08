module RedirectIfRequestedConcern
  extend ActiveSupport::Concern

  included do
    before_action :redirect_if_requested
  end

  private

    def redirect_if_requested
      redirect_to url_for(redirected_from_concern: true) if params[:redirect_me] == 'yes'
    end
end
