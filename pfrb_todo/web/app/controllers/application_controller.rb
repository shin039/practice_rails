class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :detect_mobile_variant

  def require_login
    logger.info "require_login"
    # ログイン確認後、非ログイン時にリダイレクトする
  end

end

private

def detect_mobile_variant
  request.variant = :mobile if request.user_agent =~ /iPhone/
end
