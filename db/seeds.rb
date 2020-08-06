# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"


# 10 Users
10.times do
  password = Faker::Internet.password(min_length: 10)

  user = User.new(
      email: Faker::Internet.unique.email,
      username: Faker::Name.unique.name,
      password: password,
      password_confirmation: password
  )

  user.save!

  # Download profile_image
  profile_image_name = "profile.jpg";

  URI.open(Faker::Avatar.image) do |image|
    File.open(profile_image_name, "wb") do |file|
      file.write(image.read)
    end
  end

  # Attach profile image to user
  user
      .profile_image
      .attach(
          io: File.open(profile_image_name),
          filename: profile_image_name
      )

  File.delete(profile_image_name)
end

puts "Users completely created!"

# 10 Posts
10.times do
  post = Post.new(
      title: Faker::Lorem.unique.sentence(word_count: 2),
      views: rand(1..100),
      user_id: rand(1..10),
      body: '
      <p style="margin: 0px 0px 20px; padding: 0px; color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">You&rsquo;ve probably heard of&nbsp;<a href="https://www.webfx.com/tools/lorem-ipsum-generator/" style="margin: 0px; padding: 0px; text-decoration: none; color: rgb(65, 96, 143);">Lorem Ipsum</a> before &ndash; it&rsquo;s the most-used dummy text excerpt out there. People use it because it has a fairly normal distribution of letters and words (making it look like normal English), but it&rsquo;s also Latin, which means your average reader won&rsquo;t get distracted by trying to read it. It&rsquo;s perfect for showcasing design work as it should look when fleshed out with text, because it allows viewers to focus on the design work itself, instead of the text. It&rsquo;s also a great way to showcase the functionality of programs like word processors, font types, and more.</p>
      <p style="margin: 0px 0px 20px; padding: 0px; color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">We&rsquo;ve taken Lorem Ipsum to the next level with our HTML-Ipsum tool. As you can see, this Lorem Ipsum is tailor-made for websites and other online projects that are based in HTML. Most&nbsp;<a href="https://www.webfx.com/How-much-should-web-site-cost.html" style="margin: 0px; padding: 0px; text-decoration: none; color: rgb(65, 96, 143);">web design projects</a> use Lorem Ipsum excerpts to begin with, but you always have to spend an annoying extra minute or two formatting it properly for the web.</p>
      <p style="margin: 0px 0px 20px; padding: 0px; color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">Maybe you have a custom-styled ordered list you want to show off, or maybe you just want a long chunk of Lorem Ipsum that&rsquo;s already wrapped in paragraph tags. No matter the need, we&rsquo;ve put together a number of Lorem Ipsum samples ready to go with HTML tags and formatting in place. All you have to do is click the heading of any section on this page, and that HTML-Ipsum block is copied to your clipboard and ready to be loaded into a website redesign template, brand new design mockup, or any other digital project you might need dummy text for.</p>
      <p style="margin: 0px 0px 20px; padding: 0px; color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">No matter the project, please remember to replace your fancy HTML-Ipsum with real content before you go live - this is especially important if you&#39;re planning to implement a&nbsp;<a href="https://www.webfx.com/content-marketing-strategy.html" style="margin: 0px; padding: 0px; text-decoration: none; color: rgb(65, 96, 143);">content-based marketing strategy</a> for your new creation! Lorem Ipsum text is all well and good to demonstrate a design or project, but if you set a website loose on the Internet without replacing dummy text with relevant,&nbsp;<a href="https://www.webfx.com/content-marketing/elements-of-high-quality-content.html" style="margin: 0px; padding: 0px; text-decoration: none; color: rgb(65, 96, 143);">high quality content</a>, you&rsquo;ll run into all sorts of potential&nbsp;<a href="https://www.webfx.com/SEO-Pricing.html" style="margin: 0px; padding: 0px; text-decoration: none; color: rgb(65, 96, 143);">Search Engine Optimization</a> issues like thin content, duplicate content, and more.</p>
      <p style="margin: 0px 0px 20px; padding: 0px; color: rgb(0, 0, 0); font-family: sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">HTML-Ipsum is maintained by&nbsp;<a href="https://www.governor.pa.gov/governor-wolf-announces-webfx-expansion-of-national-headquarters-in-dauphin-county-creation-of-80-jobs/" style="margin: 0px; padding: 0px; text-decoration: none; color: rgb(65, 96, 143);">WebFX</a>. For more information about us, please visit&nbsp;<a href="https://clutch.co/profile/webfx" style="margin: 0px; padding: 0px; text-decoration: none; color: rgb(65, 96, 143);">WebFX Reviews</a>. To learn more about the&nbsp;<a href="https://www.webfx.com/industries/" style="margin: 0px; padding: 0px; text-decoration: none; color: rgb(65, 96, 143);">industries</a> we drive&nbsp;<a href="https://www.webfx.com/" style="margin: 0px; padding: 0px; text-decoration: none; color: rgb(65, 96, 143);">Internet marketing</a> performormance for and our revenue driving services:&nbsp;<a href="https://www.webfx.com/seo-checker/" style="margin: 0px; padding: 0px; text-decoration: none; color: rgb(65, 96, 143);">SEO</a>,&nbsp;<a href="https://www.webfx.com/ppc-management-services.html" style="margin: 0px; padding: 0px; text-decoration: none; color: rgb(65, 96, 143);">PPC</a>,&nbsp;<a href="https://www.webfx.com/Social-Media-Pricing.html" style="margin: 0px; padding: 0px; text-decoration: none; color: rgb(65, 96, 143);">social media</a>,&nbsp;<a href="https://www.webfx.com/best-web-design-company.html" style="margin: 0px; padding: 0px; text-decoration: none; color: rgb(65, 96, 143);">web design</a>,&nbsp;<a href="https://www.webfx.com/local-seo-pricing.html" style="margin: 0px; padding: 0px; text-decoration: none; color: rgb(65, 96, 143);">local SEO</a> and online&nbsp;<a href="https://www.webfx.com/blog/business-advice/the-cost-of-advertising-nationally-broken-down-by-medium/" style="margin: 0px; padding: 0px; text-decoration: none; color: rgb(65, 96, 143);">advertising services</a>.</p>
      '
  )

  post.save!

  # Download thumbnail_image
  thumbnail_image_file = "thumbnail.jpg";

  URI.open("https://picsum.photos/500/500") do |image|
    File.open(thumbnail_image_file, "wb") do |file|
      file.write(image.read)
    end
  end

  # Attach profile image to post
  post
      .thumbnail_image
      .attach(
          io: File.open(thumbnail_image_file),
          filename: thumbnail_image_file
      )

  File.delete(thumbnail_image_file)

end

puts "Posts completely created!"

# 10 Likes
10.times do |i|
  like = Like.new(
      user_id: i,
      post_id: rand(1..10)
  )

  like.save
end

puts "Likes completely created!"

# 5 Comments with 5 SubComments
Post.all.each do |post|

  # Comments
  5.times do
    user = User.find(rand(1..10))
    comment = Comment.new(
        post: post,
        user: user,
        content: Faker::Lorem.sentence(word_count: 5)
    )
    comment.save!

    # Sub Comments
    3.times do
      sub_user = User.find(rand(1..10))
      sub_comment = Comment.new(
          post: post,
          user: sub_user,
          content: Faker::Lorem.sentence(word_count: 5),
          parent_id: comment.id
      )
      sub_comment.save!
    end
  end

end

puts "Comments completely created!"
