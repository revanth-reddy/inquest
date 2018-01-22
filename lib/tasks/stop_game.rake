namespace :game do
  desc "Stop the game"
  task :stop => :environment do
    Game.first.update_attributes(:is_playable => false)
    puts "The hunt is over is over.."
  end
end