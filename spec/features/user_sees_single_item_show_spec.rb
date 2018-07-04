require "rails_helper"

describe "user sees one article" do
	describe "they link from the articles index" do
		it "displays information for one article" do
      article_1 = Article.create!(title: 'Title_1', body: 'Body_1')
      article_2 = Article.create!(title: 'Title_2', body: 'Body_2')

      visit '/articles/index'
      click_link article_1.title

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
      expect(page.to_not have_content(article_2.title)
      expect(page.to_not have_content(article_2.body)
		end
	end
end
