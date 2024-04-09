class ComputePoints
    def initialize(herding)
        @herding = herding
    end

    def compute_final_points
        case @herding.category
        when "NHAT"
            @herding.final_points = 30
        when "HWT"
            @herding.final_points = @herding.points
        when "IHT1", "IHT2", "IHT3"
            @herding.final_points = compute_iht_points
        end
    end
    def compute_iht_points
        case @herding.category
        when "IHT1"
            @herding.final_points = (@herding.points * 1.5)
        when "IHT2"
            @herding.final_points = (@herding.points * 2)
        when "IHT3"
            @herding.final_points = (@herding.points * 2.5)
        end
        @herding.final_points += position_points
        @herding.final_points += ranking_points
    end
    def position_points
        case @herding.position
        when 1
            15
        when 2
            10
        when 3
            5
        else 
            0
        end
    end
    def ranking_points
        (@herding.num_dogs - @herding.position) * 5
    end

end