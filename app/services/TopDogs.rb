class TopDogs 
    def initialize(entries)
        @entries_grouped_by_dog = entries
    end

    def return_top_ten
        dog_points = {}
        @entries_grouped_by_dog.each do |dog_id, entries|
            total_points = entries.sum(&:final_points)
            dog_points[dog_id] = total_points
        end
        sorted_dog_points = dog_points.sort_by { |_dog_id, points| -points }
        return sorted_dog_points.take(10)
    end
end