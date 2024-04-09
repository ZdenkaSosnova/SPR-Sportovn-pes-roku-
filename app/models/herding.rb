class Herding < ApplicationRecord
    belongs_to :dog
    before_save :compute_final_points

    validate :validate_herding_fields

    private

    def compute_final_points
        self.final_points = ComputePoints.new(self).compute_final_points
    end

    def validate_herding_fields
        HerdingValidator.new(self, errors).validate_herding_fields
    end

end

