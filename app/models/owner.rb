class Owner < ApplicationRecord
        belongs_to :member
        has_many :dogs
        before_validation { self.email = email.downcase}

        validate :compulsory_fields
        has_secure_password

        private

        def compulsory_fields
                errors.add(:base, "Musíte zadat křestní jméno") if first_name.blank?
                errors.add(:base, "Musíte zadat příjmení") if last_name.blank?
                errors.add(:base, "Musíte zadat email") if email.blank?
                errors.add(:base, "Nesprávný formát emailu") unless email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        end

end