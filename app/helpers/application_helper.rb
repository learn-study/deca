module ApplicationHelper
  def age(birthday)
    date_format = "%Y%m%d"
    (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end
  
  def boolean(object)
    if object == true
      return "可"
    else
      return "不可"
    end
  end
end
