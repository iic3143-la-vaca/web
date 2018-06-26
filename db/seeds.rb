# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

carlos = User.create!(name: 'Carlos Álvarez', email: 'ctalvarez@uc.cl', password: '123456', role: 'normal')
louise = User.create!(name: 'Louise Nicolas', email: 'louise@uc.cl', password: '123456', role: 'normal')
rodolfo = User.create!(name: 'Rodolfo Palma', email: 'rodolfo@uc.cl', password: '123456', role: 'normal')
admin = User.create!(name: 'admin', email: 'admin@uc.cl', password: '123456', role: 'admin')

# Bank accounts
bank_1 = BankAccount.create!(
  bank: 'Banco Santander',
  account: '4000-700-564',
  rut: '11.111.111-1',
  account_type: 1,
  email: carlos.email,
  user: carlos
)
bank_2 = BankAccount.create!(
  bank: 'Banco de Chile',
  account: '700-006-1652',
  rut: '10.004.056-3',
  account_type: 1,
  email: louise.email,
  user: louise
)
bank_3 = BankAccount.create!(
  bank: 'Banco Itaú',
  account: '600-1324-563',
  rut: '18.333.245-9',
  account_type: 1,
  email: rodolfo.email,
  user: rodolfo
)

# Running projects
running_1 = Project.create!(
  title: 'Exhibition',
  deadline: Date.today + 30,
  description: 'Contemporary artists of all practices - fine art, photography, sculpture, painting, drawing, poetry, music - have been invited to submit proposals to an exhibition responding to the theme of the environment. This exhibition aims to blur the line between art and activisim, highlight issues concerning the environment and raise awareness, through art, of the impact that pollution has on the world.',
  financing_description: 'The funds would go towards producing small, handmade brochures to celebrate the contributing artists and to give more information about the themes involved and ways in which they have been interpreted.',
  creators_description: 'Juta Shoes was started by Sabeha, who has a BA in Social Enterprise and has run the Boundary Women’s Project at St Hilda’s for ten years, and Joanna, who was a Year Here fellow in social innovation and loves crafts.',
  goal: 351,
  status: 'running',
  user: louise
)
Reward.create!(
  name: 'A very big THANK YOU',
  description: 'An email with a personal thank you to you for your contribution to the project, complete with some behind-the-scenes images of the exhibition and any fun stories that may occur during!',
  lower_bound: 5,
  upper_bound: 9,
  dispatchable: false,
  project: running_1
)
Reward.create!(
  name: 'A \'thank-you\' postcard',
  description: 'A handprinted postcard: a physical thank you for your generosity. Black linocut print on brown kraft paper by myself! :-)',
  lower_bound: 10,
  upper_bound: 19,
  dispatchable: true,
  project: running_1
)
Reward.create!(
  name: 'A \'thank-you\' drawing',
  description: 'A unique drawing: a physical thank you for your generosity. An A4 monochrome ink drawing made by myself! :-)',
  lower_bound: 20,
  upper_bound: 50,
  dispatchable: true,
  project: running_1
)

running_2 = Project.create!(
  title: 'Juta Shoes',
  deadline: Date.today + 90,
  description: 'Our goal is to make Juta Shoes available in ethical fashion boutiques, online retailers, and pop-up stores across the UK, and create bespoke shoes for each customer so we can reduce waste across our supply chain.',
  financing_description: 'The funds would go towards producing small, handmade brochures to celebrate the contributing artists and to give more information about the themes involved and ways in which they have been interpreted.',
  creators_description: 'Juta Shoes was started by Sabeha, who has a BA in Social Enterprise and has run the Boundary Women’s Project at St Hilda’s for ten years, and Joanna, who was a Year Here fellow in social innovation and loves crafts.',
  goal: 4201,
  status: 'running',
  user: louise
)
Reward.create!(
  name: 'Signed Postcard',
  description: 'A massive hug and a giant thank you! You will receive a handwritten postcard of thanks from all of us at Juta Shoes, and be a member of the Juta family for life. If you\'re outside the UK, we\'ll send you a digital version of the postcard to your email address (it\'ll get to you faster!)',
  lower_bound: 5,
  upper_bound: 9,
  dispatchable: true,
  project: running_2
)
Reward.create!(
  name: 'Juta Keychain',
  description: 'Our shoes are made from leather offcuts - but we go one step further and make sure we use any scraps left over from our pattern. This leather keychain is made from brown leather with silver hardware.',
  lower_bound: 10,
  upper_bound: 19,
  dispatchable: true,
  project: running_2
)
Reward.create!(
  name: 'Juta Wallet',
  description: 'A simple wallet perfect for carrying just the necessities. Made of the same leather offcuts as our shoes, this wallet can fit your cards, cash, and coins and slide into your pocket. Made in brown leather with cream stitching.',
  lower_bound: 20,
  upper_bound: 50,
  dispatchable: true,
  project: running_2
)

running_3 = Project.create!(
  title: 'Kelp Jerky',
  deadline: Date.today + 60,
  description: 'Together, we\'ve created a new wave of 100% vegan, seagreens and plant-based foods made from the most sustainable source of food on Earth: 100% ocean farmed latissima kelp, a superfood from the sea that has nourished civilizations for thousands of years. By helping us fund our Kickstarter, you\'re helping us bring this ancient magical seagreen to the world today.',
  financing_description: 'The funds will help support our first fully scaled production run so we can move out of our little East Village kitchen.',
  creators_description: 'AKUA is a modern food brand on a mission to create food the right way: healthy, delicious, plant-based, and with a positive impact on the planet.',
  goal: 71141,
  status: 'running',
  user: louise
)
Reward.create!(
  name: 'AKUA\'s Seagreens Cookbook',
  description: 'With AKUA\'s Seagreens cookbook, you\'ll learn to incorporate super healthy seaweeds like kelp, wakame, and dulse into your daily diet. We\'ve lovingly put together dozens of our favorite recipes from the world\'s greatest chefs into a digital recipe book that we will email you when the campaign ends!',
  lower_bound: 5,
  upper_bound: 19,
  dispatchable: false,
  project: running_3
)
Reward.create!(
  name: 'KELP JERKY: EARLY BIRD SPECIAL',
  description: 'Get our variety 3-pack for just $20 that includes one bag each of our three flavors of Kelp Jerky - Turmeric Thai & Coconut, Rosemary & Maple BBQ, and Sesame Sea Salt plus our "I Kelped Out" sticker that goes to all backers of Kelp Jerky!',
  lower_bound: 20,
  upper_bound: 24,
  dispatchable: true,
  project: running_3
)
Reward.create!(
  name: 'KELP JERKY: Variety 3-Pack',
  description: 'Receive our variety 3-pack that includes one bag each of our three flavors of Kelp Jerky - Turmeric Thai & Coconut, Rosemary & Maple BBQ, and Sesame Sea Salt.',
  lower_bound: 25,
  upper_bound: 50,
  dispatchable: true,
  project: running_3
)

# pending projects
pending_1 = Project.create!(
  title: 'Save Penguins!',
  deadline: Date.today + 15,
  description: 'There are just hours left to Invest in the Nest! This is your last chance to join this project, make more nests for African penguins, and pick one of our exclusive rewards. Watch our video to meet Tanga, a baby penguin at the Dallas Zoo. Help save this incredible species from extinction and pledge now!',
  financing_description: 'The majority of the funds we crowdsource on Kickstarter will go directly to the production and distribution of 1,500 artificial nests. Once we’ve built 1,500 nests, we’ll place them in up to a dozen penguin colonies all across South Africa and Namibia. In addition to the costs of production and distribution, Kickstarter funds will be used to produce marketing materials and to produce and deliver unique penguin-inspired rewards for backers like you!',
  creators_description: 'Founded in 1924, the Association of Zoos and Aquariums is a nonprofit organization dedicated to the advancement of zoos and aquariums in the areas of conservation, animal welfare, education, science, and recreation. AZA is the accrediting body for the top zoos and aquariums in the United States and eight other countries. Currently, over 230 aquariums, nature centers, science centers and zoos are accredited by AZA.',
  goal: 19356000,
  status: 'pending',
  user: carlos
)
Reward.create!(
  name: 'Nest To Meet You Starter Pack',
  description: 'Welcome to our fine feathered family! Chip in $3, and we’ll send you a personal, heartfelt “thank you” and exclusive updates from the project.',
  lower_bound: 3,
  upper_bound: 9,
  dispatchable: false,
  project: pending_1
)
Reward.create!(
  name: 'The Keep Cool Digital Poster',
  description: 'We’ll send you a print-quality digital download of this special poster, designed exclusively for our project. Print it and hang it, or make it your desktop wallpaper.',
  lower_bound: 10,
  upper_bound: 14,
  dispatchable: false,
  project: pending_1
)
Reward.create!(
  name: '#InvestInTheNest Car Decal',
  description: 'Show your support for African penguins every time you go for a dive—er, drive. Add some flair to your flightless vehicle with this attractive car decal.',
  lower_bound: 15,
  upper_bound: 50,
  dispatchable: true,
  project: pending_1
)

pending_2 = Project.create!(
  title: 'New Robot!',
  deadline: Date.today + 20,
  description: 'Yellowstone started a proud tradition of protecting our planet’s most unique environments when it became the world’s first National Park more than a century ago. However, there is a part of Yellowstone that very few people have visited. An entire ecosystem that is hidden from us at the surface. A place that scientists are eager to study and may harbor unknown life; the depths of Yellowstone Lake.',
  financing_description: 'The cost of this kind of vehicle depends largely on its capabilities but they typically cost hundreds of thousands of dollars to build. However, MBARI has provided us with basic mechanical schematics and control software for "Yogi", GFOE engineers have already invested the time to adapt the design, and several major components have been privately donated to the project. One of these private donors has even offered a 1:1 match on any funds raised through Kickstarter, up to $100,000. This means that your donation will effectively be doubled. We have many of the important pieces in place but we need at least $100,000 in public support to raise the $200,000 required to actually build "Yogi" and move the project forward.',
  creators_description: 'The Global Foundation for Ocean Exploration (GFOE) is a non-profit engineering organization dedicated to empowering the global science community with robotic tools to explore the world’s oceans and large lakes. GFOE is made up of engineers and explorers who design and operate vehicles used to study the bottom of the ocean and who now plan to build a robot to explore the largely unknown depths of Yellowstone Lake. With the launch of this Kickstarter campaign to build "Yogi" the Robot, we are pioneering a new way to fund underwater exploration--crowdfunding directly through the public, to produce high-definition underwater video and scientific data for the benefit and enjoyment of everyone.',
  goal: 200000,
  status: 'pending',
  user: carlos
)
Reward.create!(
  name: 'Email',
  description: 'You will receive an email from the GFOE team thanking you for your support!',
  lower_bound: 5,
  upper_bound: 9,
  dispatchable: false,
  project: pending_2
)
Reward.create!(
  name: 'Engineering blog',
  description: 'You will be given exclusive access to our engineering development blog. Get the latest updates on how the project is progressing!',
  lower_bound: 10,
  upper_bound: 24,
  dispatchable: false,
  project: pending_2
)
Reward.create!(
  name: 'Digital posters',
  description: 'You will receive 3 high-resolution digital posters featuring our artist\'s rendering of some of the most popular animals found in Yellowstone National Park!',
  lower_bound: 25,
  upper_bound: 100,
  dispatchable: false,
  project: pending_2
)

pending_3 = Project.create!(
  title: 'MudWatt',
  deadline: Date.today + 20,
  description: 'The MudWatt kit empowers kids (and kids at heart) to become scientists and engineers, teaching them important STEM skills while engaging their curiosity, their creativity, and their appreciation for the natural world around them. It merges topics like energy, biology, physics, chemistry, and engineering to generate the spark (<--Pun!) in STEM learning.   The MudWatt is not a "build it and forget it" kit; it encourages kids to get creative with science and offers long-term engagement over weeks, or even months, through the MudWatt Explorer App.',
  financing_description: 'Since we’ve already been producing the early version of MudWatt kits for some time, there’s less risk associated with this project than some other Kickstarter projects. We’re already a company vetted through the prestigious, Stanford-affiliated StartX incubator, and we’ve already established relationships with high-quality and trusted manufacturers for the new products we’re offering as rewards.',
  creators_description: 'We are engineers who’ve made everything from potato guns to giant space stations lurking ominously above the earth’s surface! (OK, not so much the space stations. But we’ve made some great stuff.)',
  goal: 150000,
  status: 'pending',
  user: rodolfo
)
Reward.create!(
  name: 'Curriculum PDF & Comic',
  description: 'Intrigued but not ready to get your hands dirty? In addition to early curriculum access, you’ll get a printed copy of our fun and educational comic book! Follow the story of Shewy the microbe through this complicated, muddy world.',
  lower_bound: 5,
  upper_bound: 19,
  dispatchable: false,
  project: pending_3
)
Reward.create!(
  name: 'Shewy Plush Toy & Comic',
  description: 'We’re always working on new ways to get kids interested in science! Shewy (short for Shewanella) is an electric bacteria plush who lights up to show electron flow! Shewy is great educational tool and/or companion. Comes with the fun and educational Shewy comic book!',
  lower_bound: 20,
  upper_bound: 29,
  dispatchable: true,
  project: pending_3
)
Reward.create!(
  name: 'MudWatt Core Kit',
  description: 'Ready to get your hands dirty? Fantastic. This is our new low cost version that lets you build a MudWatt your way! The kit has everything you need to build the battery in a container of your choice, and also includes the MudWatt Explorer App, as well as full access to our downloadable curriculum for when those questions really start flowing.',
  lower_bound: 30,
  upper_bound: 100,
  dispatchable: true,
  project: pending_3
)

# rejected projects
rejected_1 = Project.create!(
  title: 'Trinity',
  deadline: Date.today + 30,
  description: 'The short battery life of most phones and tablets can be really frustrating. With Trinity you have the freedom to charge your USB devices anywhere in the world with sustainable energy. Your phone, your tablet, these small things contain so much information we need constant access to. It gets rough when your phone is out of battery, especially when you are nowhere near electricity. You might be camping with the family or taking a long hike with your friends, you need to stay connected. Our phones can also be important for our security in case of emergency. TRINITY is easy to carry with you and works everywhere, it fits as well in your bag as in your hand. TRINITY’s unique design allows you to charge your smart phone up to 4-6 times before it has to be recharged either by itself (using the wind) or simply plug it into a wall output so it can be fully charged before you leave your home. We recommend using the power of the wind, for clean energy.',
  financing_description: 'We have been able to build a fully working prototype but it may require small changes for full scale manufacturing. We will face more challenges and unforeseen product issues as we get closer to manufacturing. We do not currently have a factory though we will explore every option and decide the best way to manufacture the product. If we decide to partner up with a manufacturer there may be delays should we need to change suppliers. Every step in our development will be carefully selected to make this product even more special for our backers.',
  creators_description: 'We understand the role sustainable energy holds for our future and the importance for humans to live in harmony with nature. When designing Trinity we looked to nature and natural law. After building and installing a horizontal axis turbine we started looking into a better design and came to the conclusion that a vertical axis turbine was better suited for smaller wind turbines. Our vertical axis design was chosen so Trinity could capture the wind coming from any direction. We wanted to make it portable and sleek. something you can put in your bag and take with you everywhere as we have been doing with our prototypes. Bringing the design to where it is today came with many challenges such as fitting everything in such a compact package and turning a tube into a tripod. Trinity has changed enormously from the first drawings and first rough prototype to where it is now.',
  goal: 10000000,
  status: 'rejected',
  user: rodolfo
)
Reward.create!(
  name: 'White Trinity',
  description: 'High quality water and weatherproof Trinity pouch for your phone with built in USB charging cable that doubles as a lanyard. The Trinity Pouch also has a metal grommet for staking or tying down. Fits all popular smart phones (suggested retail $50)',
  lower_bound: 10,
  upper_bound: 40,
  dispatchable: true,
  project: rejected_1
)
Reward.create!(
  name: 'Black Trinity',
  description: 'Early Bird special: Black Trinity 100',
  lower_bound: 41,
  upper_bound: 55,
  dispatchable: true,
  project: rejected_1
)
Reward.create!(
  name: 'Set of two',
  description: 'Choose any two different sizes of the High quality water and weatherproof Trinity pouch for your phone or tablet with built in USB charging cable that doubles as a lanyard. The Trinity Pouch also has a metal grommet for staking or tying down. (suggested retail $110-$130)',
  lower_bound: 56,
  upper_bound: 200,
  dispatchable: true,
  project: rejected_1
)

FactoryBot.create_list(:tag, 10)

# FactoryBot.create_list(:reward, 3, project: projects[])
