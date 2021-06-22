module ApplicationHelper
  def flash_class(name)
    case name
    when 'notice' then 'info'
    when 'alert'  then 'danger'
    else name
    end
  end
end
