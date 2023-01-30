class AgeValidator 
    birth_date = 2001-02-22
    
    def check_age
        if (Date.today - birth_date) / 365.25 >= 18
            true
        else
            errors.add(:birth_date, "must be at least 18 yesrs old")
        end
    end
end