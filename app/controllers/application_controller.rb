class ApplicationController < ActionController::Base
  around_action :switch_locale
  before_action :last_events

  private

  def last_events
    @last_events = Event.order(created_at: :desc).limit(3)
  end

  def switch_locale(&action)
    locale = locale_from_url || locale_from_headers || I18n.default_locale
    response.set_header "Content-Language", locale
    I18n.with_locale locale, &action
  end

  def locale_from_url
    locale = params[:locale]

    return locale if I18n.available_locales.map(&:to_s).include?(locale)
  end

  def locale_from_headers
    header = request.env["HTTP_ACCEPT_LANGUAGE"]

    return if header.nil?

    locales = header.gsub(/\s+/, '').split(",").map do |language_tag|
      locale, quality = language_tag.split(/;q=/i)
      quality = quality ? quality.to_f : 1.0
      [locale, quality]
    end.reject do |(locale, quality)|
      locale == '*' || quality == 0
    end.sort_by do |(_, quality)|
      quality
    end.map(&:first)

    return if locales.empty?

    if I18n.enforce_available_locales
      locale = locales.reverse.find { |locale| I18n.available_locales.any? { |al| match?(al, locale) } }
      if locale
        I18n.available_locales.find { |al| match?(al, locale) }
      end
    else
      locales.last
    end
  end

  def match?(s1, s2)
    s1.to_s.casecmp(s2.to_s) == 0
  end

  def default_url_options
    { locale: I18n.locale }
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Настройка для работы девайза при правке профиля юзера
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Хелпер метод, доступный во вьюхах
  helper_method :current_user_can_edit?

  # Настройка для девайза — разрешаем обновлять профиль, но обрезаем
  # параметры, связанные со сменой пароля.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: [:password, :password_confirmation, :current_password]
    )
  end

  # Вспомогательный метод, возвращает true, если текущий залогиненный юзер
  # может править указанное событие
  def current_user_can_edit?(article)
    user_signed_in? && article.user == current_user
  end
end