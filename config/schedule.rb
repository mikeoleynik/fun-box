every 2.minute do
  runner 'Rate.update_rate', environment: 'development'
end
