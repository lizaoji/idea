Given /^there is a task called "([^\"]*)"$/ do |task|
	FactoryGirl.create(:post, :title => task)
end

Then /^(?:|I )should have an object called "([^\"]*)"$/ do |name|
	post =  Post.find_by(title: name)
	post.should be_valid
end