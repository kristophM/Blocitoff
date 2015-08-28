namespace :todo do
  desc "Delete items older than default days left (7 days)"
  task delete_items: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).each do |item|
      puts "Attempting to delete Item ID: #{item.id}"
      item.destroy!
    end
  end

end
