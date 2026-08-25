Design Instagram/WhatsApp Stories — content that's visible for exactly 24 hours and then disappears automatically. How would you store this, and how would you make sure it's removed after 24 hours without needing to constantly scan your entire database for expired posts?


Where would you store the story metadata — SQL or NoSQL, and why? (tests: write-heavy content → NoSQL, same reasoning as comments/views)


How do you actually delete something after 24 hours — do you run a cron job that scans for expired stories every few minutes? (this is the trap — they want you to say "no," and reach for TTL instead)


What happens to the actual video/image file in blob storage — does that get deleted too, or just the metadata reference?



If a story has 10M viewers, how would you track 'who has seen this story' without that becoming a bottleneck?