require "rails_helper"

describe "user sees one article" do
	describe "they link from the articles index" do
		it "displays information for one article" do
      article = Article.create!(title: 'Title_1', body: 'Body_1')
			comment_1 = article.comments.create!(author_name: 'Emmie', body: 'sample comment')
			comment_2 = article.comments.create!(author_name: 'Michelle Obama', body: 'Girl Power!')

			visit articles_path
      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
		  expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
		end
	end
end
