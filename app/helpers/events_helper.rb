module EventsHelper
def date_display(date)
    fsdate = (date == nil)? date :  I18n.l( DateTime.parse(date.localtime.to_s), :format => :long)
 end
end
