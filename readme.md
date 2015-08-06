# README

1. `bundle install`
2. `bundle exec ruby app.rb`
3. In another terminal: `ruby test.rb`, taking note of the reserved memory of the sinatra process (`RSS` column) before and after the test.
4. `bundle exec rbtrace -p <PID> -e 'OD.d'`, replacing `<PID>` with the process ID observed earlier.
5. `./process_trace.rb` and see that many objects remain allocated from each generation hinting at a memory leak.
6. `./process_generation.rb` will show the allocations hanging on from generation 16 by default. Change this within the file if desired.
