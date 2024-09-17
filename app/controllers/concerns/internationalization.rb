# frozen_string_literal: true

module Internationalization
  extend ActiveSupport::Concern

  included do
    around_action :switch_locale

    private

    def switch_locale(&)
      locale = locale_from_url || I18n.default_locale
      I18n.with_locale(locale, &)
    end

    def locale_from_url
      locale = params[:locale]

      I18n.available_locales.map(&:to_s).include?(locale) ? locale : nil
    end

    def default_url_options
      { locale: I18n.locale }
    end
  end
end
