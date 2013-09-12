Feature: Static home page
	Scenario: Homepage Check
		Given I am on root
		Then I should see "+ 添加新任务"

		When I follow "关于"
		Then I should see "关于此网站"

		When I follow "我的任务"
		Then I should see "所有任务"

		When I follow "+ 添加新任务"
		Then I should see "添加任务"

