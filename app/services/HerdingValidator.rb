class HerdingValidator
    attr_reader :herding, :errors

    def initialize(herding, errors)
        @herding = herding
        @errors = errors
    end

    def validate_herding_fields
        validate_compulsory_fields
        validate_points
        validate_trial_fields
    end

    def validate_compulsory_fields
        @errors.add(:base, "Kategorie musí být vybrána.") if @herding.category.blank?
        @errors.add(:base, "Místo konání akce musí být vyplněno") if @herding.event_place.blank?
        @errors.add(:base, "Datum konání akce musí být vyplněn") if @herding.event_date.blank?
    end


    def validate_points
        if ["HWT", "IHT1", "IHT2", "IHT3"].include?(@herding.category)
            if @herding.points.blank?
                @errors.add(:base, "V kategorii #{@herding.category} musí být specifikován počet bodů.")
            else validate_points_range
            end
        end
    end

    def validate_trial_fields
        if ["IHT1", "IHT2", "IHT3"].include?(@herding.category)
            if @herding.position.blank? || @herding.num_dogs.blank?
                @errors.add(:base, "V kategorii #{@herding.category} musí být specifikován počet účastníků a pozice psa.")
            elsif !@herding.position.is_a?(Integer) || !@herding.num_dogs.is_a?(Integer)
                @errors.add(:base, "Počet účastníků a pozice psa musí být celá čísla.")
            elsif @herding.position <= 0 || @herding.num_dogs <=0
                @errors.add(:base, "Pozice nebo počet soupeřů nemohou být záporné.")
            elsif @herding.position > @herding.num_dogs
                @errors.add(:base, "Počet soupeřů nemůže být menší než výsledná pozice psa")
            end
        end
    end
     

    def validate_points_range
        if @herding.event_date.present? && Date.parse(@herding.event_date.to_s) > Date.new(2023,5,1)
            if ["HWT", "IHT1"].include?(@herding.category)
                @errors.add(:base, message: "Počet bodů v kategorii #{@herding.category} musí být mezi 70 a 100.") unless (70..100).include?(@herding.points)
            elsif @herding.category == "IHT2"
                @errors.add(:base, message: "Počet bodů v kategorii #{@herding.category} musí být mezi 84 a 120.") unless (84..120).include?(@herding.points)
            elsif @herding.category == "IHT3"
                @errors.add(:base, message: "Počet bodů v kategorii #{@herding.category} musí být mezi 105 a 150.") unless (90..150).include?(@herding.points)
            end
        elsif @herding.event_date.present?
            if ["HWT", "IHT1"].include?(@herding.category)
                @errors.add(:base, message: "Počet bodů v kategorii #{@herding.category} musí být mezi 70 a 100.") unless (60..100).include?(@herding.points)
            elsif @herding.category == "IHT2"
                @errors.add(:base, message: "Počet bodů v kategorii #{@herding.category} musí být mezi 84 a 120.") unless (72..120).include?(@herding.points)
            elsif @herding.category == "IHT3"
                @errors.add(:base, message: "Počet bodů v kategorii #{@herding.category} musí být mezi 105 a 150.") unless(105..150).include?(@herding.points)
            end
        end
    end
        
end
