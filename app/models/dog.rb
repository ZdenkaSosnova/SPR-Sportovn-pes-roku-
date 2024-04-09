class Dog < ApplicationRecord
    belongs_to :owner    
    has_many :herdings, dependent: :destroy

    validate :compulsory_inputs

    private

    def compulsory_inputs
        if dog_name.blank?
            errors.add(:base, "Musíte zadat jméno psa")
        end
        if date_of_birth.blank?
            errors.add(:base, "Musíte zadat datum narození psa")
        end
    end
end


