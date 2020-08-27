# #
# # config/initializers/scheduler.rb
# include Ct
# require 'rufus-scheduler'
# # Let's use the rufus-scheduler singleton
# #
# s = Rufus::Scheduler.singleton

# if Rails.env == 'development'
#   s.every '10s' do
#     begin
#       csv = Getcsv.new
#       csv.get
#     rescue => exception
#       p exception
#     end
#   end 

#   s.every '1s' do
#     begin
#       Facebook.csv_import
#     rescue => exception
#       p exception
#     end
#   end 
# end