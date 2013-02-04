module PhonesHelper
  def phone_number_type_select_options
    Phone::NUMBERTYPES.map { |number_type| [t("phone.number_types.#{number_type}"), number_type] }
  end
end