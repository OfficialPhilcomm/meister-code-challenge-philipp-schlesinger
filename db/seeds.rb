# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Project.transaction do
  200.times do |i|
    project = Project.create!(name: "Project °#{i}", created_at: 1.year.ago, updated_at: 1.year.ago)
    30.times do |j|
      expired_at = [ true, false ].sample ? (1.year.ago.to_date..Time.zone.now.to_date).to_a.sample : nil
      Task.create!(project:, name: "Task °#{j}", expired_at:)
    end
  end
end
