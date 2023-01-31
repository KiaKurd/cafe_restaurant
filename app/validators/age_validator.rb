require 'date'

class AgeValidator 
    def check_age
        if (Date.today - User.age) / 365.25 >= 18
            true
        else
            errors.add(:User.age, "must be at least 18 yesrs old")
        end
    end
end