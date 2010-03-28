ConsumerConfig = YAML.load(File.read(Rails.root + 'config' + 'twitter.yml'))

G140 = {
  :site_name => "140.mk",
  :front_page_lists_count => 4,
  :tweets_per_list => 5,
  :users_per_list => 5,
  :max_lists => 5,
  :my_tweets_per_page => 10,
  :tweets_per_page => 10,
  :categories_per_page => 16,
  :users_per_page => 10,
  :subscriptions_per_user => 5
}
