1. Frequency Capping

"Suppose an advertiser wants to ensure that a particular ad is shown to a user no more than 5 times per day. Design a system that enforces this limit at scale. Assume you have billions of users and millions of ads. How would you track impressions and prevent the same user from seeing the ad more than the configured limit?"

Likely follow-ups:

Where would you store the counters?
Would you use Redis?
How would you handle Redis failure?
How would you shard the data?
How would TTL work?
What happens when multiple ad-serving requests arrive simultaneously?


2. Ad Targeting

"Design an advertising system where advertisers can specify targeting criteria such as keywords, location, device type, language, age group, and audience. When a user performs a search, the system should identify which ads are eligible to be shown. How would you design this system?"

Likely follow-ups:

How do you retrieve matching ads?
How would you index keywords?
How do you combine multiple targeting conditions?
Where would you store targeting rules?
How would you handle millions of advertisers?
What would you cache?
How would you update targeting rules without causing stale results?


3. Ad Ranking

"Suppose your targeting system finds 100,000 ads that are potentially eligible for a user's search. You can only display 3 ads. Design a system to rank these ads and select the best ones."

Then the interviewer might add:

"The ranking should consider bid amount, relevance, predicted click-through rate, ad quality, and advertiser constraints. How would you design the ranking pipeline?"

Likely follow-ups:

How do you reduce 100K candidates to a manageable number?
Would you use ML?
Where would ranking features come from?
How do you keep ranking latency low?
How frequently are models/features updated?
What happens if the ranking service is unavailable?


4. Budget Management

"Design a system that allows advertisers to set a daily budget for their campaigns. Every time an ad is served or clicked, the advertiser incurs some cost. The system must prevent advertisers from significantly exceeding their daily budget even though millions of ad requests are being processed concurrently across thousands of servers."

Then:

"How would you maintain the spending state and ensure that multiple ad-serving servers don't overspend the advertiser's budget?"

Likely follow-ups:

Redis vs database?
Atomic operations?
Distributed counters?
Strong vs eventual consistency?
What happens if two servers spend the last ₹10 simultaneously?
How do you reset the budget every day?
What happens during a Redis outage?
How much overspending is acceptable?


5. Ad Auction

"Suppose a user searches for 'running shoes'. Your targeting system finds 1,000 eligible ads. Each advertiser has specified a bid, and each ad has a relevance score and predicted CTR. Design an auction system that determines which ads should be displayed and how much each advertiser should pay."

Then the interviewer may say:

"The highest bidder should not necessarily win. An advertiser with a lower bid but significantly better relevance should potentially rank higher. How would you design the auction?"

Likely follow-ups:

What determines ad rank?
How do you calculate the winner?
How do you calculate the price?
First-price vs second-price auction?
How do you prevent advertisers from manipulating the auction?
How do you make the auction low latency?
How do you handle ties?


6. Budget Pacing

"An advertiser has a daily budget of ₹100,000. Suppose the campaign receives very high traffic in the morning. If you simply serve the ad whenever it's eligible, the entire budget could be exhausted by noon. Design a system that distributes the advertiser's budget throughout the day while still maximizing the number of valuable impressions/clicks."

Then:

"How would your system decide whether an ad should participate in an auction at a particular moment based on how much of the advertiser's budget has already been spent and how much time is left in the day?"

Likely follow-ups:

How do you calculate the desired spending rate?
What if traffic suddenly increases?
What if traffic is lower than expected?
How does pacing interact with bidding?
How do you coordinate pacing across thousands of ad servers?
Can pacing decisions be eventually consistent?
What happens near the end of the day?


7. Ad Ranking
"Suppose a user searches for 'running shoes'. Your targeting system identifies 10,000 ads that are eligible to participate. However, you can only display 5 ads to the user. Design a system that determines which 5 ads should be shown. The ranking should consider factors such as advertiser bid, ad relevance, predicted click-through rate, ad quality, and user context. How would you design this ranking system?"

Possible follow-ups:

How do you reduce 10,000 candidates efficiently?
Which features would you use for ranking?
Would you use an ML model?
Where do the ranking features come from?
How do you keep ranking latency under 50 ms?
How frequently are ranking models updated?
What happens if the ranking service is unavailable?
How would you evaluate whether your ranking algorithm is good?


8. Click Fraud Detection

Instead of simply:

"Design Click Fraud Detection."

A realistic interview question would be:

"Suppose you operate a sponsored-search platform where advertisers are charged whenever users click their ads. Some malicious users and bots are generating large numbers of fake clicks to either exhaust an advertiser's budget or generate fraudulent revenue. Design a system that detects and prevents fraudulent clicks at scale without incorrectly blocking legitimate users."

Possible follow-ups:

What signals would you use to identify fraudulent clicks?
How would you distinguish a bot from a real user?
Would fraud detection happen synchronously or asynchronously?
Would you block the click immediately or investigate it later?
How would you handle false positives?
How would you process billions of click events?
Where would you store click events?
Would Kafka be useful?
How would you detect coordinated attacks from many IP addresses?
How would ML fit into the system?
What happens if your fraud-detection service is unavailable?
When should an advertiser actually be charged?