module ApplicationHelper
    def bootstrap_class_for(flash_type)
        case flash_type
        when 'notice'
          'alert-success'
        end
      end
end
