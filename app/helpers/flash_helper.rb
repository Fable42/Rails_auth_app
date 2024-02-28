module FlashHelper
  def flash_class(flash_key)
    case flash_key.to_sym
    when :error
      "bg-error"
    else
      "bg-w"
    end 
  end
end